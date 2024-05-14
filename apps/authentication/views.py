from utils import *
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse, HttpResponseNotFound
from ..src.models import *
from django.core import serializers
from uuid import uuid4
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.urls import resolve
from django.contrib.auth.hashers import make_password
from datetime import date 
import calendar
import json
from sanstha.settings import MONTHS_NAME_NUMBER
from dateutil.relativedelta import relativedelta
from datetime import datetime,date
from django.db.models import Q
from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK
)
from sanstha.settings import MONTHS_NAME, MONTHS_NAME_NUMBER
baseurl = settings.BASE_URL
import sys
import os
sys.path.append(os.getcwd()+'/..')
from sanstha.decorators import unauthenticated_user
baseurl = settings.BASE_URL


@unauthenticated_user
def index(request):
    context = {'logo': getConfigurationResult('logo')}
    try:
        if request.method == 'POST':
            username = request.POST.get('username', '')
            password = request.POST.get('password', '')
            remember_me = request.POST.get('remember_me', False)

            # Basic validation
            if not username:
                messages.error(request, 'Please enter email id', extra_tags='invalid')
                return redirect('login')

            if not password:
                messages.error(request, 'Please enter password', extra_tags='invalid')
                return redirect('login')

            if not isValidEmail(username):
                messages.error(request, 'Please enter valid email', extra_tags='invalid')
                return redirect('login')

            # Authenticate user
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                user_name = f"{user.first_name} {user.middle_name} {user.last_name}".strip()

                # Handling user's favorites and permissions
                user_favorites, menus = get_user_favorites_and_menus(user)

                # Setting up cookies correctly
                response = redirect('custom-dashboard')  # Adjust redirect as needed
                if remember_me:
                    response.set_cookie('username', username, max_age=30*24*60*60)  # 30 days
                    response.set_cookie('password', password, max_age=30*24*60*60)  # 30 days
                else:
                    response.delete_cookie('username')
                    response.delete_cookie('password')
        
                # Set session data
                request.session['modules'] = menus
                request.session['favorites'] = user_favorites
                messages.success(request, f'Hello {user_name}, Welcome to {getConfigurationResult("org_name")}!', extra_tags='success')
                
                return response
            else:
                messages.error(request, 'Invalid email id & password', extra_tags='invalid')
                return redirect('login')
        
        else:
            # Prepare to render login page
            context['saved_username'] = request.COOKIES.get('username', '')
            context['saved_password'] = request.COOKIES.get('password', '')
            return render(request, 'authentication/login.html', context)

    except Exception as e:
        print(e)
        return render(request, 'authentication/login.html', context)

def get_user_favorites_and_menus(user):
    # Here you can implement the logic to retrieve favorites and modules
    user_favorites = []
    menus = []

    favorites = SpFavorites.objects.filter(user_id=user.id)
    for favorite in favorites:
        user_favorites.append({'favorite': favorite.favorite, 'link': favorite.link})

    # Assuming user has role and permissions set up
    if user.role_id == 0:
        modules = SpModules.objects.filter(status=1)
    else:
        modules = SpModules.objects.raw(
            '''SELECT * FROM sp_modules WHERE id IN (SELECT module_id FROM sp_user_role_permissions WHERE user_id = %s)''', 
            [user.id]
        )

    for module in modules:
        menu = {'menu': module.module_name, 'submenus': []}
        sub_modules = SpSubModules.objects.filter(module_id=module.id).exclude(link='')

        for sub_module in sub_modules:
            menu['submenus'].append({
                'sub_menu': sub_module.sub_module_name,
                'link': sub_module.link
            })

        menus.append(menu)

    return user_favorites, menus


# @unauthenticated_user
# def index(request):
#     context = {'logo': getConfigurationResult('logo')}
#     try:
#             if request.POST:
#                 username = request.POST['username']
#                 password = request.POST['password']
#                 remember_me = request.POST.get('remember_me', False)
#                 error_count = 0

#                 if username == '':
#                     messages.error(request, 'Please enter email id', extra_tags='invalid')
#                     error_count = error_count+1

#                 if not isValidEmail(username):
#                     messages.error(request, 'Please enter valid email', extra_tags='invalid')
#                     error_count = error_count+1
#                 if password == '':
#                     messages.error(request, 'Please enter password', extra_tags='invalid')
#                     error_count = error_count+1
#                 if username == '' and password == '':
#                     messages.error(request, 'Please enter email id & password', extra_tags='invalid')
#                     error_count = error_count+1
#                     return redirect('login')
                
#                 if(error_count > 0):
#                     return redirect('login')
#                 else:
#                     user = authenticate(username=username, password=password)
#                     # return HttpResponse(user)
#                     if user is not None:
#                         login(request, user)
#                         user_name = user.first_name +' '+ user.middle_name +' '+ user.last_name
#                         if 'next' in request.POST:

#                             # get user favourites
#                             current_user = request.user
#                             user_favorites = []
#                             favorites = SpFavorites.objects.filter(user_id = current_user.id)
#                             for favorite in favorites :
#                                 temp = {}
#                                 temp['favorite'] = favorite.favorite
#                                 temp['link'] = favorite.link
#                                 user_favorites.append(temp)

#                             # get users modules
#                             menus = []
#                             if current_user.role_id == 0 :
#                                 modules = SpModules.objects.filter(status=1)
#                             else:
#                                 modules = SpModules.objects.raw(''' select * from sp_modules where id in (select module_id from sp_user_role_permissions where user_id = %s) ''', [current_user.id])                                
                            
#                             for module in modules : 
#                                 menu = {}
#                                 menu['menu'] = module.module_name
                                
#                                 if current_user.role_id == 0 :
#                                     sub_modules = SpSubModules.objects.filter(module_id=module.id).exclude(link='')
#                                 else:
#                                     sub_modules = SpSubModules.objects.raw(''' select * from sp_sub_modules where link != "" and module_id = %s and id in (select sub_module_id from sp_user_role_permissions where user_id = %s) ''', [module.id,current_user.id])
                                
#                                 submenus = []
#                                 for sub_module in sub_modules :
#                                     sub_menu = {}
#                                     sub_menu['sub_menu'] = sub_module.sub_module_name
#                                     sub_menu['link'] = sub_module.link
#                                     submenus.append(sub_menu)
#                                 menu['submenus'] = submenus
#                                 menus.append(menu)
                             
#                             if remember_me:
#                                 # Store credentials in session (or use cookies/local storage)
#                                 request.session['saved_username'] = username
#                                 request.session['saved_password'] = password
#                                 request.session.set_expiry(2592000)
#                             else:
#                                 # Clear saved credentials
#                                 request.session.pop('saved_username', None)
#                                 request.session.pop('saved_password', None)
#                                 request.session.set_expiry(0)
                                
#                             request.session['modules'] = menus
#                             request.session['favorites'] = user_favorites
#                             messages.success(request, 'Hello '+user_name+', Welcome to '+getConfigurationResult('org_name')+'!', extra_tags='success')
#                             return redirect('/custom-dashboard')
#                         else:
#                             # get user favourites
#                             current_user = request.user
#                             user_favorites = []
#                             favorites = SpFavorites.objects.filter(user_id = current_user.id)
#                             for favorite in favorites :
#                                 temp = {}
#                                 temp['favorite'] = favorite.favorite
#                                 temp['link'] = favorite.link
#                                 user_favorites.append(temp)

#                              # get users modules

#                             menus = []
#                             if current_user.role_id == 0 :
#                                 modules = SpModules.objects.filter(status=1)
#                             else:
#                                 modules = SpModules.objects.raw(''' select * from sp_modules where id in (select module_id from sp_user_role_permissions where user_id = %s) ''', [current_user.id])                                
                            
#                             for module in modules : 
#                                 menu = {}
#                                 menu['menu'] = module.module_name
#                                 if current_user.role_id == 0 :
#                                     sub_modules = SpSubModules.objects.filter(module_id=module.id).exclude(link='')
#                                 else:
#                                     sub_modules = SpSubModules.objects.raw(''' select * from sp_sub_modules where link != "" and module_id = %s and id in (select sub_module_id from sp_user_role_permissions where user_id = %s) ''', [module.id,current_user.id])                                
                                
#                                 submenus = []
#                                 for sub_module in sub_modules :
#                                     sub_menu = {}
#                                     sub_menu['sub_menu'] = sub_module.sub_module_name
#                                     sub_menu['link'] = sub_module.link
#                                     submenus.append(sub_menu)

                                
#                                 menu['submenus'] = submenus
#                                 menus.append(menu)

#                             request.session['modules'] = menus
#                             request.session['favorites'] = user_favorites
#                             messages.success(request, 'Hello '+user_name+', Welcome to '+getConfigurationResult('org_name')+'!', extra_tags='success')
#                             return redirect('/custom-dashboard')
#                             # return redirect('/users')
#                     else:
#                         messages.error(request, 'Invalid email id & password', extra_tags='invalid')
#                         return redirect('login')
#     except Exception as e:
#         print(e)
#     return render(request, 'authentication/login.html', context)


def logout_view(request):
    try:
        messages.success(request, 'You have successfully logout!', extra_tags='success')
        logout(request)
    except Exception as e:
        print(e)
    return redirect('login')

def forgotPassword(request):
    if request.method == "POST":
        if request.POST['email'] == "" or not isValidEmail(request.POST['email']):
            messages.error(request, 'Invalid email.', extra_tags='invalid')
            return redirect('/forgot-password')
        else:
            if SpUsers.objects.filter(official_email=request.POST['email']).exists():

                SpPasswordResets.objects.filter(email=request.POST['email']).delete()

                user = SpUsers.objects.get(official_email=request.POST['email'])
                user_name = user.first_name
                if user.middle_name is not None:
                    user_name += ' '+user.middle_name
                user_name += ' '+user.last_name

                auth_token = uuid4()
                password_reset = SpPasswordResets()
                password_reset.email = request.POST['email']
                password_reset.auth_token = auth_token
                password_reset.save()

                # send email.
                payload = {}
                payload['token'] = auth_token
                payload['link'] = baseurl+'/'+'reset-password/'+str(auth_token)
                msg_html = render_to_string('email-templates/forgot-password.html', payload)
                send_mail(
                    'Password Reset Request for TTrack Account',
                    '',
                    'sansthaa@gmail.com',
                    [request.POST['email']],
                    html_message=msg_html,
                )

                messages.success(request, 'If you are registered with us, a reset password link has been sent to your email.', extra_tags='success')
                return redirect('/forgot-password')
            else:
                messages.error(request, 'This email is not register.', extra_tags='invalid')
                return redirect('/forgot-password')
                
    else:
        context = {}
        return render(request, 'authentication/forgot-password.html', context)


def resetPassword(request,token):
    if request.method == "POST":
        if SpPasswordResets.objects.filter(email=request.POST['email'],auth_token=request.POST['token']).exists():

            password_reset = SpPasswordResets.objects.get(email=request.POST['email'],auth_token=request.POST['token'])
            user = SpUsers.objects.get(official_email=password_reset.email)
            user.password = make_password(request.POST['new_password'])
            user.save()
            
            # delete token
            SpPasswordResets.objects.filter(email=request.POST['email'],auth_token=request.POST['token']).delete()

            messages.success(request, 'Password reset successfully.', extra_tags='success')
            return redirect('/login')

        else:
            messages.error(request, 'Invalid or expired token', extra_tags='invalid')
            return redirect('/forgot-password')
    else:
        if SpPasswordResets.objects.filter(auth_token=token).exists():
            password_reset = SpPasswordResets.objects.get(auth_token=token)
            context = {}
            context['password_reset'] = password_reset
            return render(request, 'authentication/reset-password.html', context)
        else:
            messages.error(request, 'Invalid or expired token', extra_tags='invalid')
            return redirect('/forgot-password')


def handler404(request, exception):
    return render(request, 'authentication/404.html', status=404) 
    
def get_month_list_date(start_year,end_year):
    month_list = []
    for year in range(start_year, end_year + 1):
        start_month = 4 if year == start_year else 1
        end_month = 12 if year != end_year else 3
        for month in range(start_month, end_month + 1):
            month_year = date(year, month, 1)
            month_list.append(month_year)
    return month_list
def financial_year(date):
    # Extract year and month from the given date
    year = date.year
    month = date.month

    # Determine the financial year based on the month
    if month < 4:
        return year - 1, year
    else:
        return year, year + 1
    

   
def customDashboard(request):
    total_employee              = SpUsers.objects.filter(user_type=1,status=1).exclude(role_id=0).count()
    today_attendance            = SpUserAttendance.objects.raw(''' SELECT id, COUNT(DISTINCT(user_id)) as today_attendance FROM sp_user_attendance WHERE DATE(attendance_date_time) = CURDATE() ''' )
    leads                       = SpLeadBasic.objects.all()
    total_leads                 = leads.count()
    initiated                   = leads.filter(status =1).count()
    in_progress                 = leads.filter(status =2).count()
    close_win                   = leads.filter(status =3).count()
    close_Lost                  = leads.filter(status =4).count()
    approvel_pending            = leads.filter(status =3,approvel_status =0).count()
    lead_folloups               = SpFollowUp.objects.filter().order_by('-created_at')
    for lead_folloup in lead_folloups:
        try:
            lead_folloup.reson_name  = getModelColumnById(SpReasons,lead_folloup.reason_id,'reason') if lead_folloup.reason_id else ""
        except:
            lead_folloup.reson_name  = ""
        try:
            lead_folloup.company_name  = getModelColumnById(SpLeadBasic,lead_folloup.lead_id,'company_name') if lead_folloup.lead_id else ""
        except:
            lead_folloup.company_name = ""
        try:
            lead_folloup.lead_code      = "TTRACK"+str(lead_folloup.lead_id)
        except:
            lead_folloup.lead_code      = ""
        try:
            lead_folloup.employee_name  = getUserName(lead_folloup.created_by)
        except:
            lead_folloup.employee_name = ""
    page = request.GET.get('page')
    paginator = Paginator(lead_folloups, 10)
    try:
        lead_folloups = paginator.page(page)
    except PageNotAnInteger:
        lead_folloups = paginator.page(1)
    except EmptyPage:
        lead_folloups = paginator.page(paginator.num_pages)
    page                        = page if page is not None else 1
    current_month = datetime.now()

    current_financial_year  =  financial_year(datetime.now())
    fy = SpFinancialYears.objects.filter(start_year=current_financial_year[0],end_year=current_financial_year[1]).first()
    if fy:
        lists             = FinancialYearData.objects.filter(FY=fy).values_list('id', flat=True)
        month_list        = FinancialMonthly.objects.filter(fy_id__in=lists).values_list('month_year',flat=True).annotate(total_lead_target=Sum('lead_target')).order_by('month_year')
        lead_target       = FinancialMonthly.objects.filter(fy_id__in=lists).values('month_year').annotate(total_lead_target=Sum('lead_target')).order_by('month_year')
        lead_counts_per_month  = []
        lead_convert_per_month = []
        # month target 12 value each for one month 
        lead_targets_list = [item['total_lead_target'] for item in lead_target]
        dates             =  get_month_list_date(fy.start_year, fy.end_year)
        acheivement_leads = []
        acheivement_deals = []
        target_data = []

    else:
        month_list        = []
        lead_targets_list = []
        # lead_counts_per_month  = []
        # lead_convert_per_month = []
        acheivement_leads = []
        acheivement_deals = []
        target_data = []
        
    if fy:
        dates             =  get_month_list_date(fy.start_year, fy.end_year)
        new_datas         = [] 
        excepted_lead     = 0
        for idx, date_obj in enumerate(dates):
            date_data = {}
            date_obj = datetime(date_obj.year, date_obj.month, 1)
            year_month = date_obj.strftime("%Y-%m")
            date_data = {"month":date_obj.strftime("%m-%Y")}
            year_month_str = MONTHS_NAME_NUMBER[date_obj.month]+'-'+str(date_obj.year)[-2:]
      
            date_data['target']    = FinancialMonthly.objects.filter(month_year__icontains=year_month_str).aggregate(Sum('lead_target'))['lead_target__sum'] or 0
            excepted_lead        +=  date_data['target']
            date_data['acheived']  = SpLeadBasic.objects.filter(created_at__icontains=year_month).count() or 0
            date_data['deal'] = SpLeadBasic.objects.filter(deal_date_time__icontains=year_month).count() or 0
            #date_data['projected']  =  excepted_lead
            new_datas.append(date_data)
            if idx == 2:
                break
        financial_ids = FinancialYearData.objects.filter(FY=fy).values_list('id', flat=True)
        financial_data = FinancialMonthly.objects.filter(fy_id__in=financial_ids)
        total_lead_target   = financial_data.aggregate(Sum('lead_target'))['lead_target__sum'] or 0
        month_list = []
        month_str_list = []

        for year in range(fy.start_year, fy.end_year + 1):
            start_month = 4 if year == fy.start_year else 1
            end_month = 12 if year != fy.end_year else 3
            
            for month in range(start_month, end_month + 1):
                month_year = date(year, month, 1).strftime("%Y-%m")
                month_list.append(month_year)
                month_str = f"{MONTHS_NAME[month - 1]}-{str(year)[-2:]}"
                month_str_list.append(month_str)

                if current_month.month == month:
                    break

            if current_month.month == month:
                break                       
        lead_win_total = sum(SpLeadBasic.objects.filter(created_at__icontains=i).count() for i in month_list)
        query = Q()
        for month_str in month_str_list:
            query |= Q(month_year__icontains=month_str)
        projected_lead_target = financial_data.filter(query).aggregate(Sum('lead_target'))['lead_target__sum'] or 0
    else:
        new_datas = []
        total_lead_target = 0
        lead_win_total = 0
        projected_lead_target = 0

    context = {}
    context['page_title'] = "Sales Dashboard"
    context['month_list'] =  list(month_list)
    context['new_datas'] = json.dumps(new_datas)
    context['total_lead_target'] = total_lead_target
    context['lead_win_total'] = lead_win_total
    context['projected_lead_target'] =projected_lead_target
    context['lead_targets_list'] = json.dumps(target_data)
    context['lead_counts_per_month'] = json.dumps(acheivement_leads)
    context['lead_convert_per_month'] = json.dumps(acheivement_deals)
    context['lead_folloups'] = lead_folloups
    context['total_leads'] = total_leads
    context['initiated'] = initiated
    context['in_progress'] = in_progress
    context['close_win'] = close_win
    context['close_Lost'] = close_Lost
    context['approvel_pending'] = approvel_pending
    context['total_employee'] = total_employee
    context['fy_id']   = fy.id if fy else 0 
    context['employees']  =SpUsers.objects.filter(user_type=1,status=1).exclude(role_id=0)
    context['fy_year']   = SpFinancialYears.objects.all()
    try:
        context['today_attendance']     = today_attendance[0].today_attendance
    except:
        context['today_attendance']  = 0
    return render(request, 'layout/dashboard.html', context)  




def filter_chart(request):
    user_id = request.GET.get('userId', '0')
    year_id = request.GET.get('YearId', '0')
    filter_id = request.GET.get('FilterId', '0')

    current_financial_year = financial_year(datetime.now())
    fy = SpFinancialYears.objects.filter(id=year_id).first()
    
    if fy:
        query = {'user_id': user_id} if user_id != '0' else {}
        quer1 = {'created_by_id': user_id} if user_id != '0' else {}

        lists = FinancialYearData.objects.filter(FY=fy, **query).values_list('id', flat=True)
        month_list = FinancialMonthly.objects.filter(fy_id__in=lists).values_list('month_year', flat=True).annotate(total_lead_target=Sum('lead_target')).order_by('month_year')
        
        if filter_id == '1':
            lead_target = FinancialMonthly.objects.filter(fy_id__in=lists).values('month_year').annotate(total_lead_target=Sum('revenue_target')).order_by('month_year')
        else:
            lead_target = FinancialMonthly.objects.filter(fy_id__in=lists).values('month_year').annotate(total_lead_target=Sum('lead_target')).order_by('month_year')
        
        lead_targets_list = [item['total_lead_target'] for item in lead_target]
        dates = get_month_list_date(fy.start_year, fy.end_year)
        acheivement_leads = []
        acheivement_deals = []
        target_data = []

        if lead_targets_list:
            for idx, date in enumerate(dates):
                first_day = datetime(date.year, date.month, 1)
                _, num_days = calendar.monthrange(date.year, date.month)
                
                for day in range(1, num_days + 1):
                    start_date = first_day
                    end_date = datetime(date.year, date.month, day) + timedelta(days=1) - timedelta(seconds=1)
                    
                    if filter_id == '1':
                        value = SpLeadBasic.objects.filter(**quer1, created_at__range=[start_date, end_date]).count()
                        value_deals = SpLeadBasic.objects.filter(**quer1, deal_date_time__range=[start_date, end_date]).aggregate(deal_amount_sum=Sum('deal_amount'))['deal_amount_sum'] or 0
                    else:
                        value = SpLeadBasic.objects.filter(**quer1, created_at__range=[start_date, end_date]).count()
                        value_deals = SpLeadBasic.objects.filter(**quer1, deal_date_time__range=[start_date, end_date]).count()
                    
                    target_value = round(float(lead_targets_list[idx]) / float(num_days), 2)
                    
                    acheivement_leads.append({'date': end_date.strftime("%d-%m-%Y"), 'value': value})
                    acheivement_deals.append({'date': end_date.strftime("%d-%m-%Y"), 'value': value_deals})
                    target_data.append({'date': end_date.strftime("%d-%m-%Y"), 'value': target_value})

        updated_data = {
            'target_list': target_data,
            'acheivement_lead': acheivement_leads,
            'acheivement_deals': acheivement_deals,
            'flagged': bool(lead_targets_list)
        }
    else:
        updated_data = {
            'target_list': [],
            'acheivement_lead': [],
            'acheivement_deals': [],
            'flagged': False
        }
    
    return JsonResponse(updated_data)
    

def get_quarter_range(start_year, end_year,quarter_id):
    quarter_start_dates = []
    
    for year in range(start_year, end_year):
        for quarter in range(1, 5):
            if quarter == 1:
                start_date = datetime(year, 4, 1)
            elif quarter == 2:
                start_date = datetime(year, 7, 1)
            elif quarter == 3:
                start_date = datetime(year, 10, 1)
            else:
                start_date = datetime(year + 1, 1, 1)
            quarter_start_dates.append(start_date)
    current_quater_months = []
    for i in range(0,3):
        if i == 0:
            current_quater_months.append(quarter_start_dates[(int(quarter_id)-1)])
        else:
            current_quater_months.append(quarter_start_dates[(int(quarter_id)-1)]  + relativedelta(months=i))


    return current_quater_months
    
def filter_chart1(request):
    user_id = request.GET.get('userId', '0')
    year_id = request.GET.get('YearId', '0')
    filter_id = request.GET.get('FilterId', '0')
    quarterId = request.GET.get('quarterId', '0')

    current_financial_year = financial_year(datetime.now())
    fy = SpFinancialYears.objects.filter(id=year_id).first()
    if fy:
        query = {'user_id': user_id} if user_id != '0' else {}
        quer1 = {'created_by_id': user_id} if user_id != '0' else {}
        #dates             =  get_month_list_date(fy.start_year, fy.end_year)
        dates = get_quarter_range(fy.start_year, fy.end_year,int(quarterId))

        new_datas         = [] 
        excepted_lead     = 0
        excepted_deal     = 0
        for idx, date in enumerate(dates):
            date_data = {}
            date = datetime(date.year, date.month, 1)
            year_month = date.strftime("%Y-%m")
            date_data = {"month":date.strftime("%m-%Y")}
            year_month_str = MONTHS_NAME_NUMBER[date.month]+'-'+str(date.year)[-2:]
            fy_ids                 = FinancialYearData.objects.filter(FY=fy,**query).values_list('id', flat=True)

            if filter_id == '1':
                date_data['target']    = int(FinancialMonthly.objects.filter(fy_id__in=fy_ids,month_year__icontains=year_month_str).aggregate(revenue_target__sum=Sum('revenue_target'))['revenue_target__sum'] or 0)
                excepted_deal        +=  date_data['target']
                date_data['acheived']  = int(SpLeadBasic.objects.filter(**quer1,deal_date_time__icontains=year_month).aggregate(deal_amount__sum=Sum('deal_amount'))['deal_amount__sum'] or 0)
                # date_data['projected']  =  int(excepted_deal)
            else:

                date_data['target']    = FinancialMonthly.objects.filter(fy_id__in=fy_ids,month_year__icontains=year_month_str).aggregate(Sum('lead_target'))['lead_target__sum'] or 0
                excepted_lead        +=  date_data['target']
                date_data['acheived']  = SpLeadBasic.objects.filter(**quer1,created_at__icontains=year_month).count() or 0
                date_data['deal'] = SpLeadBasic.objects.filter(**quer1,deal_date_time__icontains=year_month).count() or 0
                #date_data['projected']  =  excepted_lead
            if date_data['target'] == 0:
                break
            new_datas.append(date_data)
    else:
       new_datas = []
    return JsonResponse((new_datas),safe=False)
    

def lead_revenue_filter(request):
    user_id = request.GET.get("userId1")
    fy_year = request.GET.get("YearId1")
    lead_or_revenue = request.GET.get("FilterId1")

    query = {'fy__user': user_id} if user_id != '0' else {}

    try:
        financial_year = SpFinancialYears.objects.get(id=int(fy_year))
    except SpFinancialYears.DoesNotExist:
        financial_year = None
    if financial_year:
        current_month = datetime.now()
        financial_data = FinancialMonthly.objects.filter(**query, fy__FY=financial_year)
    
        if lead_or_revenue == '0':
            target = int(financial_data.aggregate(Sum('lead_target'))['lead_target__sum'] or 0)
        else:
            target = int(financial_data.aggregate(Sum('revenue_target'))['revenue_target__sum'] or 0)
    
        month_list = []
        month_str_list = []
    
        for year in range(financial_year.start_year, financial_year.end_year + 1):
            start_month = 4 if year == financial_year.start_year else 1
            end_month = 12 if year != financial_year.end_year else 3
            
            for month in range(start_month, end_month + 1):
                month_year = date(year, month, 1).strftime("%Y-%m")
                month_list.append(month_year)
                month_str = f"{MONTHS_NAME[month - 1]}-{str(year)[-2:]}"
                month_str_list.append(month_str)
    
                if current_month.month == month:
                    break
    
            if current_month.month == month:
                break 
        if lead_or_revenue == '0':
            query_filter = {'created_by_id': user_id} if user_id != '0' else {}
            win_total = sum(SpLeadBasic.objects.filter(**query_filter, created_at__icontains=i).count() for i in month_list)
        else:
            query_filter = {'created_by_id': user_id} if user_id != '0' else {}
            # Calculate win_total using list comprehension and sum
            win_total = sum(
                SpLeadBasic.objects.filter(**query_filter, deal_date_time__icontains=i)
                .aggregate(Sum('deal_amount'))['deal_amount__sum'] or 0
                for i in month_list
            )
    
    
    
        query = Q()
        for month_str in month_str_list:
            query |= Q(month_year__icontains=month_str)
        if lead_or_revenue != '0':
            expected_value = int(financial_data.filter(query).aggregate(Sum('revenue_target'))['revenue_target__sum'] or 0)
        else:
            expected_value = int(financial_data.filter(query).aggregate(Sum('lead_target'))['lead_target__sum'] or 0)
    else:
        target = 0
        expected_value = 0
        win_total = 0
        

    response_data = {
        'response_code': HTTP_200_OK,
        'target_value': target,
        'expected_value': expected_value,
        'acheived_value': win_total,
    }
    return JsonResponse(response_data)
