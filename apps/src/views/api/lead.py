import json
import time
from django.contrib.auth import authenticate
from django.views.decorators.csrf import csrf_exempt
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK
)
from django.template.loader import render_to_string
from django.core.mail import EmailMultiAlternatives
from rest_framework.response import Response
from sanstha.settings import *
from ...models import *
from django.db.models import Q
from django.forms.models import model_to_dict
from django.core import serializers
from utils import *
from datetime import datetime,date
from datetime import timedelta
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password, check_password
from math import sin, cos, sqrt, atan2, radians
from django.http import HttpResponse, JsonResponse, HttpResponseNotFound
from django.db import transaction
from dateutil.relativedelta import relativedelta

baseurl = settings.BASE_URL

def financial_year(date):
    # Extract year and month from the given date
    year = date.year
    month = date.month

    # Determine the financial year based on the month
    if month < 4:
        return year - 1, year
    else:
        return year, year + 1
def current_quarter(current_date):
    # Extract the month from the current date
    month = current_date.month

    # Determine the quarter based on the month
    if month in range(1, 4):
        return 1
    elif month in range(4, 7):
        return 2
    elif month in range(7, 10):
        return 3
    else:
        return 4
        
def quarter_start_dates(start_year, end_year,quarter_id):
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

@csrf_exempt
@api_view(["POST"])
def saveLeadBasic(request): 
    if request.data.get("created_by_id")is None or request.data.get("created_by_id") == '':
        return Response({'message': 'created by id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("basic_date")is None or request.data.get("basic_date") == '':
        return Response({'message': 'basic date field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("company_name")is None or request.data.get("company_name") == '':
        return Response({'message': 'company name field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)    
    if request.data.get("turnover")is None or request.data.get("turnover") == '':
        return Response({'message': 'turnover field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)    
    if request.data.get("contact_person_name")is None or request.data.get("contact_person_name") == '':
        return Response({'message': 'contact person_name is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("desk_no")is None or request.data.get("desk_no") == '':
        return Response({'message': 'desk no is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("mobile_no")is None or request.data.get("mobile_no") == '':
        return Response({'message': 'mobile no is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("email")is None or request.data.get("email") == '':
        return Response({'message': 'email is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("address")is None or request.data.get("address") == '':
        return Response({'message': 'address is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("total_no_of_employee")is None or request.data.get("total_no_of_employee") == '':
        return Response({'message': 'total no of employee is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("core_business_area")is None or request.data.get("core_business_area") == '':
        return Response({'message': 'core business area is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("latitude")is None or request.data.get("latitude") == '':
        return Response({'message': 'latitude is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("longitude")is None or request.data.get("longitude") == '':
        return Response({'message': 'longitude is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if SpLeadBasic.objects.filter(email__icontains = request.data.get("email")).exists():
        return Response({'message': 'Email id already exists.', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if SpLeadBasic.objects.filter(mobile_no=request.data.get("mobile_no")).exists():
        return Response({'message': 'Phone Number already exists.', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    try: 
        if SpLeadBasic.objects.filter(email = request.data.get("email"),company_name__icontains=request.data.get("company_name"),status=1):
            userbasic                        = SpLeadBasic.objects.get(email = request.data.get("email"),company_name__icontains=request.data.get("company_name"),status=1)
        else:
            userbasic                        = SpLeadBasic()
        userbasic.basic_date                 = request.data.get("basic_date")
        userbasic.company_name               = request.data.get("company_name")
        userbasic.turnover                   = request.data.get("turnover") if request.data.get("turnover") else 0.0
        userbasic.contact_person_name        = request.data.get("contact_person_name")
        userbasic.desk_no                    = request.data.get("desk_no")
        if request.data.get("contry_code_id"):
            userbasic.contry_code_id         = request.data.get("contry_code_id")
        if request.data.get("currency_code"):
            userbasic.currency_code          = getModelColumnById(SpCurrencyCode,request.data.get("currency_code"),'currency_code')
        userbasic.created_by_id              = request.data.get("created_by_id")
        userbasic.mobile_no                  = request.data.get("mobile_no") 
        userbasic.email                      = request.data.get("email") 
        userbasic.address                    = request.data.get("address") 
        userbasic.total_no_of_employee       = request.data.get("total_no_of_employee") 
        # userbasic.tag_address              = request.data.get("tag_address") 
        userbasic.core_business_area         = request.data.get("core_business_area")
        userbasic.status                     = 1
        userbasic.phase                      = 1
        userbasic.longitude                  = request.data.get("longitude") 
        userbasic.latitude                   = request.data.get("latitude") 
        userbasic.save()
        last_lead_ids                        = userbasic.id 
        ledgerfollow                         = SpFollowUp()
        ledgerfollow.lead_status             = 1
        ledgerfollow.lead_id                 = userbasic.id
        ledgerfollow.latitude                = request.data.get("latitude")
        ledgerfollow.longitude               = request.data.get("longitude")
        ledgerfollow.type                    = 'initiated'
        ledgerfollow.remark                  = 'New Lead created'
        ledgerfollow.created_by              = request.data.get("created_by_id")
        ledgerfollow.save()
        context                              = {}
        context['core_business_iso_list']    = SpIsoMaster.objects.filter().values('id','iso_id', 'iso_name')
        context['message']                   = 'Lead details has been saved successfully.'
        context['last_lead_id']              = userbasic.id
        context['response_code']             = HTTP_200_OK
        return Response(context, status=HTTP_200_OK)      
    except Exception as e:
        context = {}
        context['message']                  = str(e)
        context['response_code']            = HTTP_400_BAD_REQUEST
        return Response(context, status = HTTP_400_BAD_REQUEST)

@csrf_exempt
@api_view(["POST"])
def saveLeadIso(request): 
   
    if request.data.get("created_by_id")is None or request.data.get("created_by_id") == '':
        return Response({'message': 'Created By Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("iso_status")is None or request.data.get("iso_status") == '':
        return Response({'message': 'iso status is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    
    if request.data.get("iso_applicable_id")is None or request.data.get("iso_applicable_id") == '':
        return Response({'message': 'iso applicable Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("date_of_issue")is None or request.data.get("date_of_issue") == '':
        return Response({'message': 'date of issue field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

    if request.data.get("date_of_survilance1")is None or request.data.get("date_of_survilance1") == '':
        return Response({'message': 'date of survilance1 field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("date_of_survilance2")is None or request.data.get("date_of_survilance2") == '':
        return Response({'message': 'date of survilance2 field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 

    if request.data.get("date_of_expiry")is None or request.data.get("date_of_expiry") == '':
        return Response({'message': 'date of expiry. field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    
    if request.data.get("iso_issued_agency")is None or request.data.get("iso_issued_agency") == '':
        return Response({'message': 'iso issued agency is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("iso_issued_consultant")is None or request.data.get("iso_issued_consultant") == '':
        return Response({'message': 'iso issued consultant is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("price_of_existing_iso")is None or request.data.get("price_of_existing_iso") == '':
        return Response({'message': 'price of existing iso is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

    if request.data.get("last_lead_id")is None or request.data.get("last_lead_id") == '':
        return Response({'message': 'previous user id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    try:
       
        if request.data.get("iso_applicable_id") and SpLeadIso.objects.filter(iso_applicable_id=request.data.get("iso_applicable_id"),status = 1,last_lead_id =  request.data.get("last_lead_id"),created_by_id=request.data.get("created_by_id")).exists():
            lead                            = SpLeadIso.objects.get(iso_applicable_id=request.data.get("iso_applicable_id"),status = 1,last_lead_id =  request.data.get("last_lead_id"),created_by_id=request.data.get("created_by_id"))
        else:
            lead                            = SpLeadIso()
        if request.data.get("iso_status") == '1':
            lead.created_by_id                   = request.data.get("created_by_id")
            lead.last_lead_id                    = request.data.get("last_lead_id")
            lead.iso_applicable_id              = request.data.get("iso_applicable_id")
            lead.date_of_issue                   = request.data.get("date_of_issue")
            lead.date_of_survilance1             = request.data.get("date_of_survilance1")
            lead.date_of_survilance2             = request.data.get("date_of_survilance2")
            lead.date_of_expiry                  = request.data.get("date_of_expiry")
            lead.master_iso_id                   = getModelColumnById(SpIsoMaster, request.data.get("iso_applicable_id"), 'iso_id')
            lead.master_iso_name                 = getModelColumnById(SpIsoMaster, request.data.get("iso_applicable_id"), 'iso_name')
            
            if bool(request.FILES.get('copy_of_iso', False)) == True:
                # if getModelColumnById(SpLeadIso, request.data.get("last_lead_id"), 'copy_of_iso'):
                #      deleteMediaFile(getModelColumnById(SpLeadIso, request.data.get("last_lead_id"), 'copy_of_iso'))
                uploaded_store_image            = request.FILES['copy_of_iso']
                storage                         = FileSystemStorage()
                timestamp                       = int(time.time())
                copy_of_iso_name              = uploaded_store_image.name
                temp                            = copy_of_iso_name.split('.')
                copy_of_iso_name              = 'media/iso_image/'+str(timestamp)+"."+temp[(len(temp) - 1)]
                copy_of_iso                   = storage.save(copy_of_iso_name, uploaded_store_image)
                copy_of_iso                    = storage.url(copy_of_iso)
            else:
                copy_of_iso                    = None
            lead.iso_issued_agency               = request.data.get("iso_issued_agency")
            lead.iso_issued_consultant           = request.data.get("iso_issued_consultant")
            lead.price_of_existing_iso           = request.data.get("price_of_existing_iso")
            if request.data.get("currency_code"):
                lead.currency_code              = getModelColumnById(SpCurrencyCode,request.data.get("currency_code"),'currency_code')
            lead.iso_status                      = request.data.get("iso_status")
            lead.copy_of_iso                     = copy_of_iso
            lead.status  = 1
            lead.save()
      
            last_lead_id                         = request.data.get("last_lead_id") 
            context = {}
            context['message']                  = 'Existing ISO details has been added successfully.'
            context['last_lead_id']             = last_lead_id
            context['response_code']            = HTTP_200_OK
        return Response(context, status=HTTP_200_OK)      
    except Exception as e:
        context = {}
        context['message']                  = str(e)
        context['response_code']            = HTTP_400_BAD_REQUEST
        return Response(context, status = HTTP_400_BAD_REQUEST)


@csrf_exempt
@api_view(["POST"])
def saveLeadOther(request): 
    if request.data.get("created_by_id")is None or request.data.get("created_by_id") == '':
        return Response({'message': 'created by id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("last_lead_id")is None or request.data.get("last_lead_id") == '':
        return Response({'message': 'last lead id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("other_production_pitch")is None or request.data.get("other_production_pitch") == '':
        return Response({'message': 'other production pitch field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("sales_person")is None or request.data.get("sales_person") == '':
        return Response({'message': 'sales person field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("visit_date")is None or request.data.get("visit_date") == '':
        return Response({'message': 'visit date field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("reminder")is None or request.data.get("reminder") == '':
        return Response({'message': 'reminder field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("remark")is None or request.data.get("remark") == '':
        return Response({'message': 'remark field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    try:
        if request.data.get("last_lead_id") and SpLeadOther.objects.filter(last_lead_id=request.data.get("last_lead_id"),status =1).exists():
            leadotherdetail                            = SpLeadOther.objects.get(last_lead_id=request.data.get("last_lead_id"),status =1)
        else:
            leadotherdetail                            = SpLeadOther()
        leadotherdetail.last_lead_id                   = request.data.get("last_lead_id")
        leadotherdetail.created_by_id                  = request.data.get("created_by_id")
        leadotherdetail.other_production_pitch         = request.data.get("other_production_pitch")
        leadotherdetail.software_or_erp                = request.data.get("software_or_erp") if request.data.get("software_or_erp") else None
        leadotherdetail.sales_person                   = request.data.get("sales_person")
        leadotherdetail.visit_date                     = request.data.get("visit_date")
        if request.data.get("other_resource"):
            leadotherdetail.other_resource             = request.data.get("other_resource")
        leadotherdetail.reminder                       = request.data.get("reminder")
        leadotherdetail.remark                         = request.data.get("remark")
        leadotherdetail.status                         = 1
        leadotherdetail.save()
        context                                        = {}
        context['message']                             = 'Lead details has been updated successfully.'
        context['last_lead_id']                        = request.data.get("last_lead_id")
        user_name                                      = getUserName(request.user.id)
        heading                                        = 'New Lead '
        activity                                       = 'New Lead  has been created by '+user_name+' on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p')
        saveActivity('New User', 'New Lead', heading, activity, request.user.id, user_name, 'userTag.png', '2', 'app.png') 
        # --------------------------------notification  -----------------
        user_names                                      = getUserName(request.data.get("created_by_id")) 
        message                                         = f"New Lead has been created by {user_name.upper()}."
        message_title                                   = "New Lead"
        title                                           = "Lead Management"
        notification_image                              = ""
        saveNotification(None,None,'Lead Management',title,message_title,message,notification_image,request.data.get("last_lead_id"),user_names,request.user.id,'','userTag.png',2,'app.png',1,1)
        # --------------------------------notification  -----------------
     
        context['response_code']            = HTTP_200_OK
        return Response(context, status=HTTP_200_OK)         
    except Exception as e:
        context = {}
        context['message']                  = str(e)
        context['response_code']            = HTTP_400_BAD_REQUEST
        return Response(context, status = HTTP_400_BAD_REQUEST)

@csrf_exempt
@api_view(["POST"])
def removeSavedIso(request):
    if request.data.get("created_by_id") is None or request.data.get("created_by_id") == '':
        return Response({'message': 'created by field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("last_lead_id") is None or request.data.get("last_lead_id") == '':
        return Response({'message': 'last lead id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        
    iso_lead_list =  SpLeadIso.objects.filter(created_by_id=request.data.get("created_by_id"),last_lead_id = request.data.get("last_lead_id"))
    iso_lead_list.delete()
    context = {}
    context['message']      = 'ISO removed successfully'
    context['response_code']    = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)
    
    



@csrf_exempt
@api_view(["POST"])
def showActivityLog(request):
    if request.data.get("lead_id") is None or request.data.get("lead_id") == '':
        return Response({'message': 'lead id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

    lead_followups = SpFollowUp.objects.filter(lead_id=request.data.get("lead_id")).order_by('-created_at')

    # Iterate through each follow-up and add additional fields
    for lead_followup in lead_followups:
        lead_followup.reason_name = getModelColumnById(SpReasons, lead_followup.reason_id, 'reason') if lead_followup.reason_id else ""
        lead_followup.company_name = getModelColumnById(SpLeadBasic, lead_followup.lead_id, 'company_name') if lead_followup.lead_id else ""
        lead_followup.lead_code = "TTRACK" + str(lead_followup.lead_id)
        lead_followup.employee_name = getUserName(lead_followup.created_by)

    # Prepare the response data with additional fields
    response_data = []
    for lead_followup in lead_followups:
        followup_data = {
            'id': lead_followup.id,
            'lead_status':lead_followup.lead_status,
            'lead_code': lead_followup.lead_code,
            'remark': lead_followup.remark,
            'reason_id': lead_followup.reason_id,
            'currency_code': lead_followup.currency_code,
            'deal_amount': lead_followup.deal_amount,
            'lead_id': lead_followup.lead_id,
            'next_followup_date': lead_followup.next_followup_date,
            'created_at': lead_followup.created_at,
            'updated_at': lead_followup.updated_at,
            'type': lead_followup.type,
            'reminder_date': lead_followup.reminder_date,
            'created_by': lead_followup.created_by,
            'employee_name': lead_followup.employee_name,
            'company_name': lead_followup.company_name,
            'reason_name': lead_followup.reason_name,
            
        }
        response_data.append(followup_data)

    context = {
        'message': '200',
        'response_code': HTTP_200_OK,
        'lead_followups': response_data,
    }
    return Response(context, status=HTTP_200_OK)





@csrf_exempt
@api_view(["POST"])
def getLeadList(request):
    try:
        if request.data.get("created_by_id") is None or request.data.get("created_by_id") == '':
            return Response({'message': 'created_by id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        if request.data.get("page_limit") is None or request.data.get("page_limit") == '':
            return Response({'message': 'Page limit is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        if request.data.get("start_date") is None or request.data.get("start_date") == '':
            return Response({'message': 'start data field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)   
        if request.data.get("end_date") is None or request.data.get("end_date") == '':
            return Response({'message': 'end data field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        redirect_id                    = request.data.get("redirect_id")
        start_date                    = request.data.get("start_date")
        end_date                      = datetime.strptime(request.data.get("end_date"), "%Y-%m-%d")
        end_date                      = end_date + timedelta(days=1)
        
        page_limit                      = int(request.data.get("page_limit"))*10
        offset                          = int(page_limit)-10
        page_limit                      = 10
        if redirect_id:
            spleadbasic                     = SpLeadBasic.objects.filter(created_by_id=request.data.get("created_by_id"),id = redirect_id)
        else:
            spleadbasic                     = SpLeadBasic.objects.filter(created_by_id=request.data.get("created_by_id"),created_at__range=[start_date,end_date])
            if request.data.get("lead_status"):
                spleadbasic                 = spleadbasic.filter(status = request.data.get("lead_status"))
            if request.data.get("search_filter") is not None and request.data.get("filter_id") =="0":
                spleadbasic                 = spleadbasic.filter(id__icontains = request.data.get("search_filter"))
            if request.data.get("search_filter") is not None and request.data.get("filter_id") =="1":
                spleadbasic                 = spleadbasic.filter(company_name__icontains = request.data.get("search_filter"))
            if request.data.get("search_filter") is not None and request.data.get("filter_id") =="2":
                spleadbasic                 = spleadbasic.filter(contact_person_name__icontains = request.data.get("search_filter"))
            if request.data.get("search_filter") is not None and request.data.get("filter_id") =="3":
                spleadbasic                 = spleadbasic.filter(mobile_no__icontains = request.data.get("search_filter"))
        spleadbasic                     = spleadbasic.order_by('-id')
        total_lead_count                = spleadbasic.values().count()
        leads                           = spleadbasic.values()[offset:offset+page_limit]
        lead_count                      = math.ceil(round(total_lead_count/10, 2)) if total_lead_count else 0
        context                         = {}
        context['total_lead_count']     = total_lead_count
        context['leads']                = leads
        context['lead_count']           = lead_count
        context['response_code']        = HTTP_200_OK
        return Response(context, status=HTTP_200_OK)
    except Exception as e:
        context = {
            'message': str(e),
            'response_code': HTTP_400_BAD_REQUEST
        }
        return Response(context, status=HTTP_400_BAD_REQUEST)
        
@api_view(["POST"])
def getLeadRenewalData(request):
    today = date.today()
    required_fields = ["created_by_id"]
    
    # Check for required fields
    for field in required_fields:
        if field not in request.data:
            return Response({'message': f'{field} field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    
    # Define queryset for SpLeadIso
    lead_iso_queryset = SpLeadIso.objects.filter(created_by_id=request.data["created_by_id"])
    
    # Calculate counts
    renuwal_list = {
        "today_survilance1_count": lead_iso_queryset.filter(date_of_survilance1__icontains=today.strftime("%Y-%m-%d")).count(),
        "month_survilance1_count": lead_iso_queryset.filter(date_of_survilance1__icontains=today.strftime("%Y-%m"),date_of_survilance1__gte=today.strftime("%Y-%m-%d")).count(),
        "today_survilance2_count": lead_iso_queryset.filter(date_of_survilance2__icontains=today.strftime("%Y-%m-%d")).count(),
        "month_survilance2_count": lead_iso_queryset.filter(date_of_survilance2__icontains=today.strftime("%Y-%m"),date_of_survilance2__gte=today.strftime("%Y-%m-%d")).count(),
        "today_expiry_count": lead_iso_queryset.filter(date_of_expiry__icontains=today.strftime("%Y-%m-%d")).count(),
        "month_expiry_count": lead_iso_queryset.filter(date_of_expiry__icontains=today.strftime("%Y-%m"),date_of_expiry__gte=today.strftime("%Y-%m-%d")).count(),
    }

    context = {
        'renuwal_dict': renuwal_list,
        'response_code': HTTP_200_OK
    }
    
    return Response(context, status=HTTP_200_OK)



@api_view(["POST"])
def getLeadfollowup(request):
    try:
        # Validate required input fields
        required_fields = ["created_by_id", "page_limit", "start_date", "end_date", "filter_by"]
        for field in required_fields:
            if not request.data.get(field):
                return Response({'message': f'{field} field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

        # Validate filter by value  date_of_survilance1 = 1, date_of_survilance2 = 2, date_of_expiry = 3
        filter_by = request.data.get("filter_by")
        if filter_by not in ["1", "2", "3"]:
            return Response({'message': 'Invalid filter by', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

        # Get and process date range
        start_date  = request.data.get("start_date")
        end_date    = request.data.get("end_date")
        # end_date = datetime.strptime(request.data.get("end_date"), "%Y-%m-%d") + timedelta(days=1)

        # Pagination settings
        page_limit  = 10
        page_number = int(request.data.get("page_number", 1))  # Default to page 1 if not provided
        offset      = (page_number - 1) * page_limit
        redirect_id = request.data.get("redirect_id")
        # Filter the SpLeadIso based on the filter_by selection
        date_field = "date_of_survilance1" if filter_by == "1" else "date_of_survilance2" if filter_by == "2" else "date_of_expiry"
        
        spleadiso = SpLeadIso.objects.filter(
            created_by_id=request.data.get("created_by_id"),
            **({f"{date_field}__range": [start_date, end_date]}),
            **({"last_lead_id": redirect_id} if redirect_id else {})
        ).values_list('last_lead_id', flat=True).distinct()
        
        record_count = SpLeadIso.objects.filter(
            created_by_id=request.data.get("created_by_id"),
            **({f"{date_field}__range": [start_date, end_date]}),
            **({"last_lead_id": redirect_id} if redirect_id else {})
        ).count()
        
        # spleadiso = SpLeadIso.objects.filter(
        #     created_by_id=request.data.get("created_by_id"),
        #     **{f"{date_field}__range": [start_date, end_date]}
        # ).values_list('last_lead_id', flat=True).distinct()
        
        # record_count = SpLeadIso.objects.filter(
        #     created_by_id=request.data.get("created_by_id"),
        #     **{f"{date_field}__range": [start_date, end_date]}
        # ).count()

        # Fetch and construct the response list
        sp_lead_list = []
        if spleadiso:
            spleadbasic = SpLeadBasic.objects.filter(id__in=spleadiso)
            total_lead_count = spleadbasic.count()
            leads = spleadbasic[offset:offset + page_limit]
            for spleadbasic in leads:
                sp_lead_dict = {
                    "id": spleadbasic.id,
                    "created_by_id": spleadbasic.created_by_id,
                    "basic_date": spleadbasic.basic_date,
                    "company_name": spleadbasic.company_name,
                    "turnover": spleadbasic.turnover,
                    "contact_person_name": spleadbasic.contact_person_name,
                    "desk_no": spleadbasic.desk_no,
                    "mobile_no": spleadbasic.mobile_no,
                    "contry_code_id": spleadbasic.contry_code_id,
                    "email": spleadbasic.email,
                    "address": spleadbasic.address,
                    "total_no_of_employee": spleadbasic.total_no_of_employee,
                    "currency_code": spleadbasic.currency_code,
                    "deal_amount": spleadbasic.deal_amount,
                    "deal_date_time": spleadbasic.deal_date_time,
                    "deal_currency_code": spleadbasic.deal_currency_code,
                    "created_at": spleadbasic.created_at,
                    "updated_at": spleadbasic.updated_at,
                    "status": spleadbasic.status,
                    "longitude": spleadbasic.longitude,
                    "latitude": spleadbasic.latitude,
                    # "lead_iso_list": list(SpLeadIso.objects.filter(last_lead_id=spleadbasic.id, **{f"{date_field}__range": [start_date, end_date]}).values())
                    "lead_iso_list": list(SpLeadIso.objects.filter(last_lead_id=(redirect_id if redirect_id else spleadbasic.id),**{f"{date_field}__range": [start_date, end_date]}).values())
                }
                sp_lead_list.append(sp_lead_dict)

            lead_count = math.ceil(total_lead_count / page_limit)
        else:
            total_lead_count = 0
            lead_count = 0

        # Prepare response context
        context = {
            'total_lead_count': total_lead_count,
            'leads': sp_lead_list,
            'record_count':record_count,
            'lead_count': lead_count,
            'response_code': HTTP_200_OK
        }
        return Response(context, status=HTTP_200_OK)
    except Exception as e:
        context = {
            'message': str(e),
            'response_code': HTTP_400_BAD_REQUEST
        }
        return Response(context, status=HTTP_400_BAD_REQUEST)


        
@csrf_exempt
@api_view(["POST"])
def getUserLeadDetails(request):
    try:
        if request.data.get("created_by_id") is None or request.data.get("created_by_id") == '':
            return Response({'message': 'created_by  id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        if request.data.get("lead_id") is None or request.data.get("lead_id") == '':
            return Response({'message': 'Lead  id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        
        leads_basic     = SpLeadBasic.objects.filter(created_by_id=request.data.get("created_by_id"), id = request.data.get("lead_id")).values()
        leade_iso       = SpLeadIso.objects.filter(created_by_id=request.data.get("created_by_id"), last_lead_id = request.data.get("lead_id")).values()
        if leade_iso:
            leade_iso   = leade_iso
        else: 
            leade_iso   = []
        leade_other     =  SpLeadOther.objects.filter(created_by_id=request.data.get("created_by_id"), last_lead_id = request.data.get("lead_id")).values()
        if leade_other:
            leade_other = leade_other
        else:
            leade_other = []
           
        context = {}
        context['leads_basic']      = leads_basic
        context['total_cattles']    = SpLeadBasic.objects.filter(created_by_id=request.data.get("created_by_id"), id = request.data.get("lead_id")).count()
        context['leade_iso']        = leade_iso
        context['leade_other']      = leade_other
        context['response_code']    = HTTP_200_OK
        return Response(context, status=HTTP_200_OK)
    except Exception as e:
        error_message = str(e)
        context = {
            'message': error_message,
            'response_code': HTTP_400_BAD_REQUEST
        }
        return Response(context, status=HTTP_400_BAD_REQUEST)
        
        
@csrf_exempt
@api_view(["POST"])
def getUserCompleteLeadDetails(request):
    try:
        if request.data.get("created_by_id") is None or request.data.get("created_by_id") == '':
            return Response({'message': 'created_by  id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        if request.data.get("lead_id") is None or request.data.get("lead_id") == '':
            return Response({'message': 'Lead  id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        
        leads_basics                                = SpLeadBasic.objects.filter(created_by_id=request.data.get("created_by_id"), id = request.data.get("lead_id")).values()
        for leads_basic in leads_basics:
            leads_basic['created_by_name']          = getUserName(leads_basic['created_by_id'])
            list_of_strings                         = leads_basic['core_business_area'].split(',')
            core_business_area                      = [int(item) for item in list_of_strings ]
            leads_basic['core_business_area_list']  = SpCoreBusinessArea.objects.filter(id__in = core_business_area).values('core_business_area_name')
            leads_basic['contry_code']              = getModelColumnById(SpCountryCodes, leads_basic['contry_code_id'],'country_code') if leads_basic['contry_code_id'] else None
        
        
        lead_iso_saves                              = SpLeadIsoSave.objects.filter(created_by_id = request.data.get("created_by_id"), last_lead_id = request.data.get("lead_id")).values('id','iso_amount','iso_created_id','currency_code')
        for lead_iso_save in lead_iso_saves:
            list_of_strings                         = lead_iso_save['iso_created_id'].split(',')
            iso_ids                                 = [int(item) for item in list_of_strings ]
            lead_iso_save['iso_lists']              = SpIsoMaster.objects.filter(id__in = iso_ids).values()
        leade_isos                                  = SpLeadIso.objects.filter(created_by_id = request.data.get("created_by_id"), last_lead_id = request.data.get("lead_id")).values()
        for leade_iso in leade_isos:
            
            leade_iso['copy_of_iso_image']          = baseurl+''+leade_iso['copy_of_iso'] if leade_iso['copy_of_iso'] else None
           
        if not leade_isos:
            leade_iso                               = []
        leade_others                                = SpLeadOther.objects.filter(created_by_id = request.data.get("created_by_id"), last_lead_id = request.data.get("lead_id")).values()
        for leade_other in leade_others:
            if leade_other['software_or_erp']:
                list_of_strings                     = leade_other['software_or_erp'].split(',')
                software_or_erp                     = [int(item) for item in list_of_strings ]
                leade_other['software_or_erp']      = TtrackService.objects.filter(id__in = software_or_erp).values('service_name') 
            else:
                leade_other['software_or_erp']          = []
            leade_other['sales_person']              = getUserName(leade_other['sales_person']) 
            leade_other['other_resource']            = getUserName(leade_other['other_resource']) if leade_other['other_resource'] else None
        if not leade_others:
            leade_others                            = []
           
        context                                     = {}
        context['leads_basics']                      = leads_basics
        context['leade_isos']                       = leade_isos
        context['lead_iso_saves']                     = lead_iso_saves
        context['leade_others']                     = leade_others
        context['response_code']                    = HTTP_200_OK
        return Response(context, status=HTTP_200_OK)
    except Exception as e:
        error_message = str(e)
        context = {
            'message': error_message,
            'response_code': HTTP_400_BAD_REQUEST
        }
        return Response(context, status=HTTP_400_BAD_REQUEST)


@csrf_exempt
@api_view(["POST"])
def getMasterDataList(request):
    core_business_ids = request.data.get("core_business_ids", [])  # Assuming "core_business_ids" is a list in the request data
    iso_list                        = SpIsoMaster.objects.filter().values('id','iso_id','iso_name')
    context                         = {}
    context['core_business_area']   = SpCoreBusinessArea.objects.filter(status=1).values('id', 'core_business_area_name')
    context['iso_list']             = iso_list
    context['response_code']        = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)
    
@csrf_exempt
@api_view(["POST"])
def getIsoMasterListLead(request):
    if request.data.get("created_by_id") is None or request.data.get("created_by_id") == '':
        return Response({'message': 'created by id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("iso_status") is None or request.data.get("iso_status") == '':
        return Response({'message': 'iso status field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("last_lead_id") is None or request.data.get("last_lead_id") == '':
        return Response({'message': 'last lead id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
      
    iso_lead_list =  SpLeadIso.objects.filter(created_by_id=request.data.get("created_by_id"),iso_status=request.data.get("iso_status"),last_lead_id = request.data.get("last_lead_id")).values('iso_applicable_id','date_of_issue','date_of_survilance1','date_of_survilance2','date_of_expiry','copy_of_iso','iso_issued_agency','iso_issued_consultant','price_of_existing_iso','currency_code')
    if iso_lead_list:
        for row in iso_lead_list:
            iso_master_data = SpIsoMaster.objects.get(id=row['iso_applicable_id'])
            row['iso_id'] =  iso_master_data.iso_id
            row['iso_applicable_name'] = iso_master_data.iso_name
    else:
        # Handle the case when iso_lead_list is empty
        iso_lead_list = []   
    context = {}
    
    context['iso_lead_list']             = iso_lead_list
    context['response_code']    = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)

@csrf_exempt
@api_view(["POST"])
def removeLeadIso(request):
    if request.data.get("created_by_id") is None or request.data.get("created_by_id") == '':
        return Response({'message': 'created_by  id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("iso_status") is None or request.data.get("iso_status") == '':
        return Response({'message': 'iso status field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("last_lead_id") is None or request.data.get("last_lead_id") == '':
        return Response({'message': 'last lead id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("iso_id") is None or request.data.get("iso_id") == '':
        return Response({'message': 'iso id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
      
    iso_lead_list =  SpLeadIso.objects.filter(created_by_id=request.data.get("created_by_id"),iso_status=request.data.get("iso_status"),last_lead_id = request.data.get("last_lead_id"),iso_applicable_id= request.data.get("iso_id"))
    iso_lead_list.delete()
    context = {}
    context['message']      = 'ISO removed successfully'
    context['response_code']    = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)

@csrf_exempt
@api_view(["POST"])
def saveLeadIsoDetails(request): 
    if request.data.get("created_by_id")is None or request.data.get("created_by_id") == '':
        return Response({'message': 'Created By Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("iso_created_status")is None or request.data.get("iso_created_status") == '':
        return Response({'message': 'ISO created status is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("iso_created_id")is None or request.data.get("iso_created_id") == '':
        return Response({'message': 'ISO created id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("last_lead_id")is None or request.data.get("last_lead_id") == '':
        return Response({'message': 'previous user id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("iso_created_status") == '0':
        if request.data.get("iso_amount")is None or request.data.get("iso_amount") == '':
            return Response({'message': 'ISO amount is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        
    try:
        if request.data.get("iso_status") == '0':
            if request.data.get("last_lead_id") and SpLeadIsoSave.objects.filter(last_lead_id=request.data.get("last_lead_id"),status= 1).exists():
                lead                            = SpLeadIsoSave.objects.get(last_lead_id=request.data.get("last_lead_id"),status =1)
            else:
                lead                            = SpLeadIsoSave()
            lead.created_by_id                  = request.data.get("created_by_id")
            lead.last_lead_id                   = request.data.get("last_lead_id")
            lead.iso_created_id                 = request.data.get("iso_created_id")
            if request.data.get("iso_created_status") == '0':
                lead.iso_amount                 = request.data.get("iso_amount")
            else:
                lead.iso_amount                 =  0
            
            if request.data.get("currency_code"):
                lead.currency_code              = getModelColumnById(SpCurrencyCode,request.data.get("currency_code"),'currency_code')
            lead.iso_created_status             = request.data.get("iso_created_status")
            lead.status                         = 1
            lead.save()
            context                             = {}
            context['message']                  = 'Required ISO details has been updated successfully.'
            context['last_lead_id']              = request.data.get("last_lead_id")
            context['response_code']            = HTTP_200_OK
            return Response(context, status=HTTP_200_OK) 
        else:
            context                             = {}
            context['message']                  = 'Existing ISO details has been added successfully.'
            context['last_lead_id']              = request.data.get("last_lead_id")
            context['response_code']            = HTTP_200_OK
            return Response(context, status=HTTP_200_OK)  
    except Exception as e:
        context = {}
        context['message']                  = str(e)
        context['response_code']            = HTTP_400_BAD_REQUEST
        return Response(context, status = HTTP_400_BAD_REQUEST)

@csrf_exempt
@api_view(["POST"])
def updateLeadPhase(request):
    if request.data.get("lead_id")is None or request.data.get("lead_id") == '':
        return Response({'message': 'Lead Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("created_by_id")is None or request.data.get("created_by_id") == '':
        return Response({'message': 'Created By Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("remark")is None or request.data.get("remark") == '':
        return Response({'message': 'Remark field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    leads_basic = SpLeadBasic.objects.get(created_by_id=request.data.get("created_by_id"), id = request.data.get("lead_id"),status =1)
    try:
        leads_basic.remark          = request.data.get("remark")
        leads_basic.phase           = 2
        leads_basic.save()
        context = {}
        context['message']                  = 'Lead Approve Successfully'
        context['response_code']            = HTTP_200_OK
        return Response(context, status=HTTP_200_OK)      
    except Exception as e:
        context = {}
        context['message']                  = str(e)
        context['response_code']            = HTTP_400_BAD_REQUEST
        return Response(context, status = HTTP_400_BAD_REQUEST)
import ast
@csrf_exempt
@api_view(["POST"])
def getEditLeadBasicDetails(request):
    if request.data.get("lead_id")is None or request.data.get("lead_id") == '':
        return Response({'message': 'lead id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("created_by_id")is None or request.data.get("created_by_id") == '':
        return Response({'message': 'created by id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    try:
        userbasic                       = SpLeadBasic.objects.get(id = request.data.get("lead_id"),status=1)
        userbasic_id                    = SpLeadBasic.objects.filter(id = request.data.get("lead_id"),status=1).values_list("id")
        user_iso_data                   = SpLeadIsoSave.objects.filter(last_lead_id__in = userbasic_id,status=1).values()
        user_iso_data_id                = SpLeadIsoSave.objects.filter(last_lead_id__in = userbasic_id,status=1).values_list('id')
        user_other_data                 = SpLeadOther.objects.filter(last_lead_id__in  = user_iso_data_id,status=1).values()
        if user_iso_data and user_iso_data[0].get('iso_created_status') == 1:
            list_of_iso                 = SpLeadIso.objects.filter(last_lead_id = request.data.get("lead_id"),created_by_id = request.data.get("created_by_id"),status=1).values()
        userbasic_dict = {
            'id': userbasic.id,
            'created_by_id': userbasic.created_by_id,
            'basic_date': str(userbasic.basic_date),
            'company_name': userbasic.company_name,
            'turnover': userbasic.turnover,
            'contact_person_name': userbasic.contact_person_name,
            'desk_no': userbasic.desk_no,
            'mobile_no': userbasic.mobile_no,
            'email': userbasic.email,
            'address': userbasic.address,
            'total_no_of_employee': userbasic.total_no_of_employee,
            'tag_address': userbasic.tag_address,
            'core_business_area': ast.literal_eval(userbasic.core_business_area),
            'created_at': str(userbasic.created_at),
            'updated_at': str(userbasic.updated_at),
            'status': userbasic.status,
            'phase': userbasic.phase,
        }  
        userbasic.core_business_area    = ast.literal_eval(userbasic.core_business_area)
        iso_list                        = SpIsoMaster.objects.filter(status=1).values('id', 'iso_id', 'iso_name', 'core_business_id')
        context                         = {}
        context['message']              = 'Lead ISO Details saved successfully'
        context['core_business_area']   = SpCoreBusinessArea.objects.filter(status=1).values('id', 'core_business_area_name')
        context['iso_list_edit']        = iso_list
        context['userbasic']            = [userbasic_dict]
        
        context['user_iso_data']        = user_iso_data
        context['user_other_data']      = user_other_data
        context['get_iso_list']         = list_of_iso if user_iso_data and user_iso_data[0].get('iso_created_status') == 1 else []

        context['response_code']        = HTTP_200_OK
        return Response(context, status=HTTP_200_OK)      
    except Exception as e:
        context                         = {}
        context['message']              = str(e)
        context['response_code']        = HTTP_400_BAD_REQUEST
        return Response(context, status = HTTP_400_BAD_REQUEST)
        
from itertools import chain
from django.db.models import Value, IntegerField
@csrf_exempt
@api_view(["POST"])
def editLeadBasic(request):
    try:
        if request.data.get("last_lead_id"):
            userbasic = SpLeadBasic.objects.get(id=request.data.get("last_lead_id"),created_by_id = request.data.get("created_by_id"),status = 1)
            if str(userbasic.basic_date) == request.data.get("basic_date") and \
               str(userbasic.company_name) == request.data.get("company_name") and \
               float(userbasic.turnover) == (request.data.get("turnover") or 0.0) and \
               str(userbasic.contact_person_name) == request.data.get("contact_person_name") and \
               int(userbasic.desk_no) == request.data.get("desk_no") and \
               str(userbasic.created_by_id) == request.data.get("created_by_id") and \
               int(userbasic.mobile_no) == request.data.get("mobile_no") and \
               str(userbasic.email) == request.data.get("email") and \
               str(userbasic.address) == request.data.get("address") and \
               int(userbasic.total_no_of_employee) == request.data.get("total_no_of_employee") and \
               userbasic.core_business_area == str(request.data.get("core_business_area")):
                userbasic_id                    = SpLeadBasic.objects.filter(id = request.data.get("last_lead_id"),status=1).values_list("id")
                if SpLeadIsoSave.objects.filter(last_lead_id=request.data.get("last_lead_id"), status=1, iso_created_status=0).exists():
                    user_iso_data_id = SpLeadIsoSave.objects.get(last_lead_id=request.data.get("last_lead_id"), status=1, iso_created_status=0)
                else:
                    user_iso_data_id = 0
                if user_iso_data_id != 0:
                
                    core_iso_list_selected = SpIsoMaster.objects.filter(status=1, core_business_id__in=request.data.get("core_business_area"),id__in= ast.literal_eval(user_iso_data_id.iso_created_id)).annotate(check=Value(1, output_field=IntegerField())).values('id', 'iso_id', 'iso_name', 'core_business_id', 'check')
                   
                    core_iso_list_unselected = SpIsoMaster.objects.filter(status=1, core_business_id__in=request.data.get("core_business_area")).exclude(id__in= ast.literal_eval(user_iso_data_id.iso_created_id)).annotate(check=Value(0, output_field=IntegerField())).values('id', 'iso_id', 'iso_name', 'core_business_id', 'check')
                    combined_iso_list = list(chain(core_iso_list_selected, core_iso_list_unselected))
                else:
                    core_iso_list_selected = SpIsoMaster.objects.filter(status=1, core_business_id__in=request.data.get("core_business_area")).annotate(check=Value(0, output_field=IntegerField())).values('id', 'iso_id', 'iso_name', 'core_business_id', 'check')
                    combined_iso_list = list(chain(core_iso_list_selected))
                context = {
                    'message': 'Lead Basic detail not changed',
                    'iso_list':combined_iso_list,
                    'last_lead_id': userbasic.id,
                    'created_by_id': userbasic.created_by_id,
                    'response_code': HTTP_200_OK
                }
                return Response(context, status=HTTP_200_OK)
            else:
                

                userbasic.status = 0
                userbasic.save()
                
                user_iso_data = SpLeadIsoSave.objects.get(last_lead_id=userbasic.id,created_by_id = request.data.get("created_by_id"),status = 1)
                if user_iso_data.iso_created_status == 1:
                    user_iso_data_details = SpLeadIso.objects.get(last_lead_id=userbasic.id,created_by_id = request.data.get("created_by_id"),status = 1)
                new_basic = SpLeadBasic()
                new_basic.basic_date = request.data.get("basic_date")
                new_basic.company_name = request.data.get("company_name")
                new_basic.turnover = request.data.get("turnover") or 0.0
                new_basic.contact_person_name = request.data.get("contact_person_name")
                new_basic.desk_no = request.data.get("desk_no")
                new_basic.created_by_id = request.data.get("created_by_id")
                new_basic.mobile_no = request.data.get("mobile_no")
                new_basic.email = request.data.get("email")
                new_basic.address = request.data.get("address")
                new_basic.total_no_of_employee = request.data.get("total_no_of_employee")
               
                new_basic.core_business_area = request.data.get("core_business_area")
                new_basic.phase = 1
                new_basic.status = 1
                new_basic.save()
                user_iso_data.last_lead_id = new_basic.id
                user_iso_data.save()
                if user_iso_data.iso_created_status== 1:
                    user_iso_data_details.last_lead_id = new_basic.id
                    user_iso_data_details.save()
                last_lead_id = new_basic.id
                if SpLeadIsoSave.objects.filter(last_lead_id=new_basic.id, status=1, iso_created_status=0).exists():
                    user_iso_data_id = SpLeadIsoSave.objects.get(last_lead_id=new_basic.id, status=1, iso_created_status=0)
                else:
                    user_iso_data_id = 0
                if user_iso_data_id != 0:
               
                    core_iso_list_selected = SpIsoMaster.objects.filter(status=1, core_business_id__in=request.data.get("core_business_area"),id__in= ast.literal_eval(user_iso_data_id.iso_created_id)).annotate(check=Value(1, output_field=IntegerField())).values('id', 'iso_id', 'iso_name', 'core_business_id', 'check')
                   
                    core_iso_list_unselected = SpIsoMaster.objects.filter(status=1, core_business_id__in=request.data.get("core_business_area")).exclude(id__in= ast.literal_eval(user_iso_data_id.iso_created_id)).annotate(check=Value(0, output_field=IntegerField())).values('id', 'iso_id', 'iso_name', 'core_business_id', 'check')
                    combined_iso_list = list(chain(core_iso_list_selected, core_iso_list_unselected))
                else:
                    core_iso_list_selected = SpIsoMaster.objects.filter(status=1, core_business_id__in=request.data.get("core_business_area")).annotate(check=Value(0, output_field=IntegerField())).values('id', 'iso_id', 'iso_name', 'core_business_id', 'check')
                    combined_iso_list = list(chain(core_iso_list_selected))
                
                

                context = {
                    
                    'message': 'Lead Basic detail saved successfully',
                    'iso_list':combined_iso_list,
                    
                    'last_lead_id': new_basic.id,
                    'created_by_id': new_basic.created_by_id,
                    'response_code': HTTP_200_OK
                }
                return Response(context, status=HTTP_200_OK)

    except Exception as e:
        context = {}
        context['message']                  = str(e)
        context['response_code']            = HTTP_400_BAD_REQUEST
        return Response(context, status = HTTP_400_BAD_REQUEST)
    
@csrf_exempt
@api_view(["POST"])
def editLeadIsoDetails(request):
    try:

        if request.data.get("last_lead_id"):
            useriso = SpLeadIsoSave.objects.get(last_lead_id=request.data.get("last_lead_id"),created_by_id = request.data.get("created_by_id"),status = 1)
            # if str(request.data.get("iso_created_status")) == '1':
            if useriso.iso_created_id == str(request.data.get("iso_created_id")) and \
               str(useriso.iso_created_status) == request.data.get("iso_created_status") and \
                float(useriso.iso_amount) == request.data.get("iso_amount"):
                context = {
                    'message': 'Lead Iso not changed',
                    'last_lead_id': useriso.id,
                    'created_by_id': useriso.created_by_id,
                    'response_code': HTTP_200_OK
                }
                return Response(context, status=HTTP_200_OK)
            elif useriso.iso_created_id == str(request.data.get("iso_created_id")) and \
                str(useriso.iso_created_status) == request.data.get("iso_created_status"):
                context = {
                    'message': 'Lead Iso not changed',
                    'last_lead_id': useriso.id,
                    'created_by_id': useriso.created_by_id,
                    'response_code': HTTP_200_OK
                }
                return Response(context, status=HTTP_200_OK)
            else:
                useriso.status = 0
                useriso.save()
                lead_other = SpLeadOther.objects.get(last_lead_id=useriso.id,created_by_id = request.data.get("created_by_id"),status = 1)
                lead = SpLeadIsoSave()
                lead.created_by_id                  = request.data.get("created_by_id")
                lead.last_lead_id                   = request.data.get("last_lead_id")
                lead.iso_created_id                 = request.data.get("iso_created_id")
                if str(request.data.get("iso_created_status")) == '0':
                    lead.iso_amount                 = request.data.get("iso_amount")
                else:
                    lead.iso_amount                 =  0
                lead.iso_created_status             = request.data.get("iso_created_status")
                lead.status =1 
                lead.save()
                lead_other.last_lead_id = lead.id
                lead_other.save()
                
                context = {
                    
                    'message': 'Lead ISO saved successfully',
                    'last_lead_id': lead.id,
                    'created_by_id': lead.created_by_id,
                    'response_code': HTTP_200_OK
                }
                return Response(context, status=HTTP_200_OK)

    except Exception as e:
        context = {}
        context['message']                  = str(e)
        context['response_code']            = HTTP_400_BAD_REQUEST
        return Response(context, status = HTTP_400_BAD_REQUEST)

@csrf_exempt
@api_view(["POST"])
def editOtherDetails(request):
    try:
        if request.data.get("last_lead_id"):
            userother = SpLeadOther.objects.get(last_lead_id=request.data.get("last_lead_id"),created_by_id = request.data.get("created_by_id"),status = 1)
            
           
            if userother.other_production_pitch == request.data.get("other_production_pitch") and \
                str(userother.software_or_erp) == request.data.get("software_or_erp") and \
                str(userother.sales_person) == request.data.get("sales_person") and \
                str(userother.visit_date) == request.data.get("visit_date") and \
                str(userother.reminder) == request.data.get("reminder") and \
                str(userother.remark) == request.data.get("remark") and \
                str(userother.other_resource) == request.data.get("other_resource") and \
                str(userother.reminder) == request.data.get("reminder"):
                
                context = {
                    'message': 'Lead Other not changed',
                    'last_lead_id': userother.id,
                    'created_by_id': userother.created_by_id,
                    'response_code': HTTP_200_OK
                }
               
                return Response(context, status=HTTP_200_OK)
            elif userother.other_production_pitch == str(request.data.get("other_production_pitch")) and \
                str(userother.software_or_erp) == request.data.get("software_or_erp") and \
                str(userother.sales_person) == request.data.get("sales_person") and \
                str(userother.visit_date) == request.data.get("visit_date") and \
                str(userother.reminder) == request.data.get("reminder") and \
                str(userother.remark) == request.data.get("remark") and \
                str(userother.reminder) == request.data.get("reminder"):
                context = {
                    'message': 'Lead Other not changed',
                    'last_lead_id': userother.id,
                    'created_by_id': userother.created_by_id,
                    'response_code': HTTP_200_OK
                }
                
                return Response(context, status=HTTP_200_OK)

            else:
                userother.status = 0
                userother.save()
                leadotherdetail                            = SpLeadOther()
                leadotherdetail.last_lead_id                = request.data.get("last_lead_id")
                leadotherdetail.created_by_id                  = request.data.get("created_by_id")
                leadotherdetail.other_production_pitch         = request.data.get("other_production_pitch")
                leadotherdetail.software_or_erp                = request.data.get("software_or_erp")
                leadotherdetail.sales_person                   = request.data.get("sales_person")
                leadotherdetail.visit_date                     = request.data.get("visit_date")
                if request.data.get("other_resource"):
                    leadotherdetail.other_resource             = request.data.get("other_resource")
                leadotherdetail.reminder                       = request.data.get("reminder")
                leadotherdetail.remark                         = request.data.get("remark")
                leadotherdetail.status  = 1
                leadotherdetail.save()
                context = {
                    
                    'message': 'Lead Other saved successfully',
                    'last_lead_id': leadotherdetail.id,
                    'created_by_id': leadotherdetail.created_by_id,
                    'response_code': HTTP_200_OK
                }
                return Response(context, status=HTTP_200_OK)

    except Exception as e:
        context = {}
        context['message']                  = str(e)
        context['response_code']            = HTTP_400_BAD_REQUEST
        return Response(context, status = HTTP_400_BAD_REQUEST)

@csrf_exempt
@api_view(["POST"])
def deleteLeadData(request):
    try:
        if request.data.get("form_id") is None or request.data.get("form_id") == '':
            return Response({'message': 'form id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        if request.data.get("last_lead_id") is None or request.data.get("last_lead_id") == '':
            return Response({'message': 'last lead id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        if request.data.get("created_by_id") is None or request.data.get("created_by_id") == '':
            return Response({'message': 'created by id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        if request.data.get("form_id") == 1:
            basic_lead =  SpLeadBasic.objects.filter(created_by_id=request.data.get("created_by_id"),id=request.data.get("last_lead_id"))
            basic_lead.delete()
            context = {
                    'check':1,
                    'response_code': HTTP_200_OK
                }
            return Response(context, status=HTTP_200_OK)
        if request.data.get("form_id") == 2:
            iso_lead_id_basic = SpLeadIsoSave.objects.filter(created_by_id=request.data.get("created_by_id"),id=request.data.get("last_lead_id")).values_list('last_lead_id',flat=True)
            basic_lead =  SpLeadBasic.objects.filter(created_by_id=request.data.get("created_by_id"),id__in=iso_lead_id_basic)
            iso_lead = SpLeadIsoSave.objects.filter(created_by_id=request.data.get("created_by_id"),id=request.data.get("last_lead_id"))
            basic_lead.delete()
            iso_lead.delete()
            context = {
                    'check':2,
                    'response_code': HTTP_200_OK
                }
            return Response(context, status=HTTP_200_OK)
    except Exception as e:
        context = {}
        context['message']                  = str(e)
        context['response_code']            = HTTP_400_BAD_REQUEST
        return Response(context, status = HTTP_400_BAD_REQUEST)

from django.utils import timezone
@csrf_exempt
@api_view(["POST"])
def leadDashboardData(request):
    try:
        if request.data.get("user_id") is None or request.data.get("user_id") == '':
            return Response({'message': 'user id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        current_month_start = timezone.now().replace(day=1, hour=0, minute=0, second=0, microsecond=0)
        current_month_end = current_month_start.replace(month=current_month_start.month + 1) - timezone.timedelta(microseconds=1)
       

        expairy_lead_count = SpLeadIso.objects.filter(
            models.Q(date_of_survilance1__range=(current_month_start, current_month_end)) |
            models.Q(date_of_survilance2__range=(current_month_start, current_month_end)) |
            models.Q(date_of_expiry__range=(current_month_start, current_month_end))
        ).count()
        today = date.today()
        current_month = today.month
        current_year = today.year
        month_name = today.strftime("%B")
        last = SpLeadLedger.objects.filter(created_by_id = request.data.get("user_id")).last()
        user = SpUsers.objects.get(id=request.data.get("user_id"))
        emp_lead_count =  SpLeadBasic.objects.filter(created_by_id=request.data.get("user_id"),created_at__month=current_month,created_at__year=current_year,status=1).count()
        generated_orgn_sales_target =  SpLeadBasic.objects.filter(created_at__month=current_month,created_at__year=current_year,status=1).count()

        total_leads_punched_count =  SpLeadBasic.objects.filter(created_by_id=request.data.get("user_id"),created_at__month=current_month,created_at__year=current_year,phase=1,status=1).count()
        total_converted_leads_count =  SpLeadBasic.objects.filter(created_by_id=request.data.get("user_id"),created_at__month=current_month,created_at__year=current_year,phase=2,status=1).count()
        
        total_orgn_sales_target = 200 - generated_orgn_sales_target
        generated_orgn_sales_target = generated_orgn_sales_target
        # orgn percentage 
        orgn_percentage =int((generated_orgn_sales_target/total_orgn_sales_target)*100)
        # Total employee sales target
        if orgn_percentage < 100:
            reamin_orgn_percentage = 100 - orgn_percentage
        else:
            reamin_orgn_percentage = 0
        generated_emp_sales_target = emp_lead_count
        if last:
            total_emp_sales_target = last.balance
            # emp percentage 
            emp_percentage=int((generated_emp_sales_target/total_emp_sales_target)*100)
            if emp_percentage < 100:
                reamin_emp_percentage = 100 - emp_percentage
            else:
                reamin_emp_percentage = 0
        else:
            reamin_emp_percentage = 0
            total_emp_sales_target = 0 
            emp_percentage = 0 
            
        # 
        master_iso = SpIsoMaster.objects.filter().values()
        first_last_lead_id  = SpLeadIsoSave.objects.filter(iso_created_status = 0,status = 1).values('iso_created_id','last_lead_id')
        lead_iso = SpLeadIso.objects.filter(status=1).values()
        Second_last_lead_id  = SpLeadIsoSave.objects.filter(iso_created_status = 1,status = 1).values('iso_created_id','last_lead_id')
        current_month = datetime.now().month

        # filtered_first_queryset = [
        #     item for item in master_iso
        #     if (
        #         item['date_of_survilance1'].month == current_month or
        #         item['date_of_survilance2'].month == current_month or
        #         item['date_of_expiry'].month == current_month
        #     )
        # ]
        # iso_ids_to_match = [str(item['id']) for item in filtered_first_queryset]
       
        # filtered_second_queryset = [
        #     item for item in first_last_lead_id
        #     if any(iso_id in item['iso_created_id'] for iso_id in iso_ids_to_match)
        # ]
        # last_lead_ids = [item['last_lead_id'] for item in filtered_second_queryset]
        # first_basic_iso = SpLeadBasic.objects.filter(id__in=last_lead_ids,status = 1,created_by_id =  request.data.get("user_id")).count()
        # Second When 1
        # sec_filtered_first_queryset = [
        #     item for item in lead_iso
        #     if (
        #         item['date_of_survilance1'].month == current_month or
        #         item['date_of_survilance2'].month == current_month or
        #         item['date_of_expiry'].month == current_month
        #     )
        # ]

        
        # sec_iso_ids_to_match = [str(item['id']) for item in sec_filtered_first_queryset]
        
        # sec_filtered_second_queryset = [
        #     item for item in Second_last_lead_id
        #     if any(iso_id in item['iso_created_id'] for iso_id in sec_iso_ids_to_match)
        # ]
        # sec_last_lead_ids = [item['last_lead_id'] for item in sec_filtered_second_queryset]
        # merged_last_lead_ids = last_lead_ids
      
      
        # distinct_last_lead_ids = set(merged_last_lead_ids)
       
        # sec_basic_iso = SpLeadBasic.objects.filter(id__in=sec_last_lead_ids,status = 1,created_by_id =  request.data.get("user_id")).count()
        
        # combined_basic_iso = sec_basic_iso + first_basic_iso
            

        # Use expiry_iso_count in your calculations
        # expairy_lead_count = combined_basic_iso
        
        
       
        total_leads_punched = total_leads_punched_count
        
        total_converted_leads = total_converted_leads_count
        try:
            SpUsers.objects.filter(id = request.data.get("user_id")).update(web_auth_token = request.data.get('device_info'))
        except:
            pass
        total_commission = 6
        contry_codes   = SpCountryCodes.objects.filter().values()
        sales_person   = SpUsers.objects.filter(status=1).values('id','first_name','last_name','emp_sap_id')
        service_list   = TtrackService.objects.filter().values()
        currency_code  = SpCurrencyCode.objects.filter().values().order_by('currency_code')
        date_frequency = getModelColumnById(Configuration, 1, 'date_frequency')
        context = {
                'month_name':month_name,
                'total_orgn_sales_target':total_orgn_sales_target,
                'generated_orgn_sales_target':generated_orgn_sales_target,
                'orgn_percentage':orgn_percentage,
                'reamin_orgn_percentage':reamin_orgn_percentage,
                'total_emp_sales_target':total_emp_sales_target,
                'generated_emp_sales_target':generated_emp_sales_target,
                'emp_percentage':emp_percentage,
                'reamin_emp_percentage':reamin_emp_percentage,
                'currency_code':currency_code,
                'total_leads_punched':total_leads_punched,
                'total_converted_leads':total_converted_leads,
                'total_commission':total_commission,
                'sales_person':sales_person,
                'service_list':service_list,
                'contry_codes':contry_codes,
                'date_frequency':date_frequency,
                'lead_code':"TTRACK",
                'response_code': HTTP_200_OK
            }
        return Response(context, status=HTTP_200_OK)
    except Exception as e:
        context = {}
        context['message']                  = str(e)
        context['response_code']            = HTTP_400_BAD_REQUEST
        return Response(context, status = HTTP_400_BAD_REQUEST)
        
@csrf_exempt
@api_view(["POST"])
def leadExpiryList(request):
    try:
        if request.data.get("user_id") is None or request.data.get("user_id") == '':
            return Response({'message': 'user id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        master_iso = SpIsoMaster.objects.filter(status=1).values()
        first_last_lead_id  = SpLeadIsoSave.objects.filter(iso_created_status = 0,status = 1).values('iso_created_id','last_lead_id')
        lead_iso = SpLeadIso.objects.filter(status=1).values()
        Second_last_lead_id  = SpLeadIsoSave.objects.filter(iso_created_status = 1,status = 1).values('iso_created_id','last_lead_id')
        current_month = datetime.now().month

        filtered_first_queryset = [
            item for item in master_iso
            if (
                item['date_of_survilance1'].month == current_month or
                item['date_of_survilance2'].month == current_month or
                item['date_of_expiry'].month == current_month
            )
        ]
        iso_ids_to_match = [str(item['id']) for item in filtered_first_queryset]
       
        filtered_second_queryset = [
            item for item in first_last_lead_id
            if any(iso_id in item['iso_created_id'] for iso_id in iso_ids_to_match)
        ]
        last_lead_ids = [item['last_lead_id'] for item in filtered_second_queryset]
        first_basic_iso = SpLeadBasic.objects.filter(id__in=last_lead_ids,status = 1,created_by_id =  request.data.get("user_id")).values()
        # Second When 1
        sec_filtered_first_queryset = [
            item for item in lead_iso
            if (
                item['date_of_survilance1'].month == current_month or
                item['date_of_survilance2'].month == current_month or
                item['date_of_expiry'].month == current_month
            )
        ]

        
        sec_iso_ids_to_match = [str(item['id']) for item in sec_filtered_first_queryset]
        
        sec_filtered_second_queryset = [
            item for item in Second_last_lead_id
            if any(iso_id in item['iso_created_id'] for iso_id in sec_iso_ids_to_match)
        ]
        sec_last_lead_ids = [item['last_lead_id'] for item in sec_filtered_second_queryset]
        # merged_last_lead_ids = last_lead_ids
      
      
        # distinct_last_lead_ids = set(merged_last_lead_ids)
        
        sec_basic_iso = SpLeadBasic.objects.filter(id__in=sec_last_lead_ids,status = 1,created_by_id =  request.data.get("user_id")).values()
        combined_basic_iso = list(chain(first_basic_iso, sec_basic_iso))
        context = {}
        context['expiry_iso_count'] = len(combined_basic_iso)
        context['expiry_iso'] = combined_basic_iso
        return Response(context, status=HTTP_200_OK)
    except Exception as e:
        context = {}
        context['message']                  = str(e)
        context['response_code']            = HTTP_400_BAD_REQUEST
        return Response(context, status = HTTP_400_BAD_REQUEST)


@csrf_exempt
@api_view(["POST"])
def updateFollowUp(request):
    if request.data.get("lead_id")is None or request.data.get("lead_id") == '':
        return Response({'message': 'Lead Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("lead_status")is None or request.data.get("lead_status") == '':
        return Response({'message': 'lead status field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("latitude")is None or request.data.get("latitude") == '':
        return Response({'message': 'latitude field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("longitude")is None or request.data.get("longitude") == '':
        return Response({'message': 'longitude field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    
    try:
        if request.data.get("lead_status") == 2:
            if request.data.get("remark")is None or request.data.get("remark") == '':
                return Response({'message': 'remark field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
            if request.data.get("next_followup_date")is None or request.data.get("next_followup_date") == '':
                return Response({'message': 'next followup date field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
            
            sfu = SpFollowUp()
            sfu.lead_status         = request.data.get("lead_status")
            sfu.remark              = request.data.get("remark")
            sfu.next_followup_date  = request.data.get("next_followup_date")
            if request.data.get("reminder_date"):
                sfu.reminder_date       = request.data.get("reminder_date")
            
            sfu.lead_id             = request.data.get("lead_id")
            sfu.latitude            = request.data.get("latitude")
            sfu.longitude           = request.data.get("longitude")
            sfu.created_by          = request.user.id
            sfu.type                = 'Progress'
            sfu.save()
            SpLeadBasic.objects.filter(id=request.data.get("lead_id")).update(status=2)
            # cls.status = 2
            # cls.save()
            context = {}
            context['message']      = 'Follow-Up details has been saved successfully.'
            context['response_code']    = HTTP_200_OK
            return Response(context, status=HTTP_200_OK)      
        elif  request.data.get("lead_status") == 3:
            if request.data.get("remark")is None or request.data.get("remark") == '':
                return Response({'message': 'remark field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
            if request.data.get("deal_amount")is None or request.data.get("deal_amount") == '':
                return Response({'message': 'deal amount field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
            
            sfu = SpFollowUp()
            sfu.lead_status         = request.data.get("lead_status")
            sfu.remark              = request.data.get("remark")
            sfu.deal_amount         = request.data.get("deal_amount")
            if request.data.get("currency_code"):
                sfu.currency_code   = getModelColumnById(SpCurrencyCode,request.data.get("currency_code"),'currency_code')
            sfu.lead_id             = request.data.get("lead_id")
            sfu.latitude            = request.data.get("latitude")
            sfu.longitude           = request.data.get("longitude")
            sfu.created_by          = request.user.id
            sfu.type                = 'Win'
            sfu.save()
            spleadbasic             = SpLeadBasic.objects.get(id=request.data.get("lead_id"))
            spleadbasic.status      = 3
            spleadbasic.deal_amount = request.data.get("deal_amount")
            if request.data.get("currency_code"):
                spleadbasic.deal_currency_code = getModelColumnById(SpCurrencyCode,request.data.get("currency_code"),'currency_code')
            spleadbasic.deal_date_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S') 
            spleadbasic.save()
            # cls = SpLeadBasic.objects.get(id = request.data.get("lead_id") )
            # cls.status = 3
            # cls.save()
            context = {}
            context['message']                  = 'Follow-Up details has been saved successfully.'
            context['response_code']            = HTTP_200_OK
            return Response(context, status=HTTP_200_OK)  
        elif request.data.get("lead_status") == 4:
            if request.data.get("remark")is None or request.data.get("remark") == '':
                return Response({'message': 'remark field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
            if request.data.get("reason_id")is None or request.data.get("reason_id") == '':
                return Response({'message': 'reason id is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
            sfu = SpFollowUp()
            sfu.lead_status         = request.data.get("lead_status")
            sfu.remark              = request.data.get("remark")
            sfu.reason_id            = request.data.get("reason_id")
            sfu.lead_id             = request.data.get("lead_id")
            sfu.latitude            = request.data.get("latitude")
            sfu.longitude           = request.data.get("longitude")
            sfu.created_by          = request.user.id
            sfu.type                = 'Lost'
            sfu.save()
            SpLeadBasic.objects.filter(id=request.data.get("lead_id")).update(status=4)
            
            context = {}
            context['message']                  = 'Follow-Up details has been saved successfully.'
            context['response_code']            = HTTP_200_OK
            return Response(context, status=HTTP_200_OK)  
    except Exception as e:
        context = {}
        context['message']                  = str(e)
        context['response_code']            = HTTP_400_BAD_REQUEST
        return Response(context, status = HTTP_400_BAD_REQUEST)
        
@csrf_exempt
@api_view(["GET"])
def get_fy_year(request):
    try:
        fy_years = SpFinancialYears.objects.values('id','financial_year','start_month','start_month_name','start_year','end_month','end_month_name' ,'end_year',).order_by('-id')
        if not fy_years:
            fy_years = []
            message = 'There are no created financial years.'
        else:
            message = 'Financial years fetched successfully.'
        
        context = {
            'message': message,
            'fy_years': fy_years,
            'response_code': HTTP_200_OK
        }
        return Response(context, status=HTTP_200_OK)
    except Exception as e:
        context = {
            'message': str(e),
            'response_code': HTTP_400_BAD_REQUEST
        }
        return Response(context, status=HTTP_400_BAD_REQUEST)
        
        
@csrf_exempt
@api_view(["GET"])
def lead_target_achieve(request):
    # try:
    user_id = request.GET.get("user_id")
    fy_year = request.GET.get("fy_year")
    quarter_id = request.GET.get("quarter") or "1"

    if user_id is None or user_id == '':
        return Response({'message': 'user_id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    
    # if fy_year is None or fy_year == '':
    #     return Response({'message': 'fy_year field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    
    # if quarter_id is None or quarter_id == '' or (quarter_id != '' and int(quarter_id) > 4):
    #     return Response({'message': 'quarter field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

    try:
        user = SpUsers.objects.get(id=user_id)
    except SpUsers.DoesNotExist:
        return Response({'message': 'User does not exist', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if fy_year:
        try:
            fy = SpFinancialYears.objects.get(id=fy_year)
        except SpFinancialYears.DoesNotExist:
            return Response({'message': 'Financial year does not exist', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    else:
        fy_data = FinancialYearData.objects.filter(user_id=user_id).order_by('FY__start_year').first()
        if not fy_data:
            return Response({'message': f'Target  has not been created', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        fy = fy_data.FY


    fy_year    = fy.financial_year
    start_year = fy.start_year
    end_year   = fy.end_year
    current_financial_year = financial_year(datetime.now())
    quarters = {'1': [0, 3], '2': [3, 6], '3': [6, 9], '4': [9, 13]}
    if not quarter_id:
        if str(current_financial_year[0]) == str(start_year) and   str(current_financial_year[1]) == str(fy.end_year):
            quarter_id = str(current_quarter(datetime.now()))

    id_range = quarters[quarter_id]
    financial_data = FinancialMonthly.objects.filter(
        fy__user=user,
        fy__FY=fy
    ).order_by('id')[id_range[0]:id_range[1]]

    qt_range  = quarter_start_dates(start_year, end_year,quarter_id)

        
    months         = [data.month_year for data in financial_data]
    lead_target    = financial_data.values_list('lead_target', flat=True)
    revenue_target = financial_data.values_list('revenue_target', flat=True)
    lead_count     = [SpLeadBasic.objects.filter(created_by_id=user_id, created_at__icontains=i.strftime("%Y-%m")).count() for i in qt_range]
    lead_win       = [SpLeadBasic.objects.filter(created_by_id=user_id, deal_date_time__icontains=i.strftime("%Y-%m")).count() for i in qt_range]
    revenue_achievement = [SpLeadBasic.objects.filter(created_by_id=user_id, deal_date_time__icontains=i.strftime("%Y-%m")).aggregate(Sum('deal_amount'))['deal_amount__sum'] or 0 for i in qt_range]

    response_data = []
    for month, lead, revenue,lead_count,lead_win,revenue_achievement in zip(months, lead_target, revenue_target,lead_count,lead_win,revenue_achievement):
        response_data.append({
            'month': month,
            'target': lead or 0,
            'revenue_target': revenue or 0,
            'acheivement': lead_count or 0,
            'lead_win':lead_win or 0,
            'revenue_achievement':revenue_achievement or 0,
        })

    
    context = {
        'financial_data': response_data,
        'fy_id':fy.id,
        'quarter_id':quarter_id,
        'response_code': HTTP_200_OK
    }
    print(context)
    return Response(context, status=HTTP_200_OK)
    # except Exception as e:
    #     context = {
    #         'message': str(e),
    #         'response_code': HTTP_400_BAD_REQUEST
    #     }
    return Response(context, status=HTTP_400_BAD_REQUEST)

@csrf_exempt
@api_view(["GET"])
def lead_revenue(request):
    user_id = request.GET.get("user_id")
    fy_year = request.GET.get("fy_year")

    if not user_id:
        return Response({'message': 'User ID field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

    # if not fy_year:
    #     return Response({'message': 'Financial year field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

    try:
        user = SpUsers.objects.get(id=user_id)
    except SpUsers.DoesNotExist:
        return Response({'message': 'User does not exist', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

    if fy_year:
        try:
            financial_year = SpFinancialYears.objects.get(id=fy_year)
        except SpFinancialYears.DoesNotExist:
            financial_year = None
        try:
            fy_data = FinancialYearData.objects.get(user_id=user_id,FY=financial_year)
        except FinancialYearData.DoesNotExist:
            return Response({'message': f'Target for financial year has not been saved', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    else:
        fy_data = FinancialYearData.objects.filter(user_id=user_id).order_by('FY__start_year').first()
        if not fy_data:
            return Response({'message': f'Target  has not been created', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        financial_year = fy_data.FY
    current_month = datetime.now()

    financial_data = FinancialMonthly.objects.filter(fy__user=user, fy__FY=financial_year)
    total_lead_target   = financial_data.aggregate(Sum('lead_target'))['lead_target__sum'] or 0
    total_revenu_target = financial_data.aggregate(Sum('revenue_target'))['revenue_target__sum'] or 0

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

    lead_win_total = sum(SpLeadBasic.objects.filter(created_by_id=user_id, deal_date_time__icontains=i).count() for i in month_list)
    # rvenue_win_total = sum(SpLeadBasic.objects.filter(created_by_id=user_id, deal_date_time__icontains=i).aggreagte('deal_amount')for i in month_list)

    rvenue_win_total = 0

    # Iterate over month_list
    for month in month_list:
        # Filter the queryset based on user_id and month
        leads = SpLeadBasic.objects.filter(created_by_id=user_id, deal_date_time__icontains=month)
        # Aggregate the deal amounts for the filtered queryset
        month_revenue = leads.aggregate(total_amount=Sum('deal_amount'))['total_amount']
        # If month_revenue is not None, add it to the total revenue
        if month_revenue is not None:
            rvenue_win_total += month_revenue
    query = Q()
    for month_str in month_str_list:
        query |= Q(month_year__icontains=month_str)

    projected_lead_target = financial_data.filter(query).aggregate(Sum('lead_target'))['lead_target__sum'] or 0
    projected_revenue_target = financial_data.filter(query).aggregate(Sum('revenue_target'))['revenue_target__sum'] or 0


    context = {
        'response_code': HTTP_200_OK,
        'fy_year_id':financial_year.id,
        'total_lead_target': total_lead_target or 0,
        'lead_win_total': lead_win_total ,
        'projected_lead_target': projected_lead_target or 0,
        'total_revenu_target':total_revenu_target or 0,
        'rvenue_win_total':rvenue_win_total,
        'projected_revenue_target':projected_revenue_target or 0,
        'month_list':month_list,
        'month_str_list':month_str_list,
        
    }
    return Response((context), status=HTTP_200_OK)


