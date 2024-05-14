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
from rest_framework.response import Response
from ...models import *
from django.forms.models import model_to_dict
from django.core import serializers
from utils import *
from datetime import datetime,date
from datetime import timedelta
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password, check_password
from math import sin, cos, sqrt, atan2, radians
from sorl.thumbnail import get_thumbnail, delete
from django.conf import settings
from django.db.models import Count
from django.core.mail import send_mail
from PIL import Image, ExifTags
baseurl = settings.BASE_URL
from django.utils.timezone import now
from django.db.models import Q

def date_diff_in_seconds(dt2, dt1):
  timedelta = dt2 - dt1
  return timedelta.days * 24 * 3600 + timedelta.seconds

def dhms_from_seconds(seconds):
	minutes, seconds = divmod(seconds, 60)
	hours, minutes = divmod(minutes, 60)
	days, hours = divmod(hours, 24)
    #return (hours, minutes, seconds)
	return (hours)
	



@api_view(["GET"])
@permission_classes((AllowAny,))
def mappLeadLedegr(request):
    # today = date.today()
    today = date(2023, 12, 31)
    last_day_of_month = (today + timedelta(days=32 - today.day)).replace(day=1) - timedelta(days=1)
    if today == last_day_of_month:
        users = SpUsers.objects.filter(status = 1,user_type = 1).exclude(id = 1)
        for user in users:
            mapUserLeadLedger(user.role_id,user.id)
        context = {}
        context['message']    = 'Lead ledger update successfully'
        context['response_code']    = HTTP_200_OK
        return Response(context, status=HTTP_200_OK)
    else:
        return Response(status=HTTP_400_BAD_REQUEST)


def mapUserLeadLedger(role_id,user_id):
    
    user_lead_count = SpUsers.objects.get(id = user_id)
    last = SpLeadLedger.objects.filter(created_by_id = user_id).last()
    leadLedger = SpLeadLedger()
    leadLedger.created_by_id = user_id
    leadLedger.credit = user_lead_count.lead_count
    if last:
        if last.balance:
            balance = float(user_lead_count.lead_count) + float(last.balance)
        else:
            balance = float(user_lead_count.lead_count)
    else:
        balance = float(user_lead_count.lead_count)
    leadLedger.balance = round(balance,1)
    leadLedger.save()
    context = {}
    context['message']    = 'Lead ledger created successfully'
    context['response_code']    = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)
   
@api_view(["GET"])
@permission_classes((AllowAny,))
def mappLeavePolicyToLeaveLedegr(request):
    today = date(2024, 1, 31)
    # today = date.today()
    last_day_of_month = (today + timedelta(days=32 - today.day)).replace(day=1) - timedelta(days=1)
    if today == last_day_of_month:
        users = SpUsers.objects.filter(status = 1,user_type = 1).exclude(id = 1)
        for user in users:
            mapUserLeaves(user.role_id,user.id)
        context = {}
        context['message']    = 'Leave ledger update successfully'
        context['response_code']    = HTTP_200_OK
        return Response(context, status=HTTP_200_OK)
    else:
        return Response(status=HTTP_400_BAD_REQUEST)


def mapUserLeaves(role_id,user_id):
    date_of_joining = SpBasicDetails.objects.filter(user_id=user_id).values_list('date_of_joining', flat=True).first()
    if date_of_joining:
        today = date.today()
        months_difference = (today.year - date_of_joining.year) * 12 + today.month - date_of_joining.month
        if months_difference > 5:
            
            try:
                leave_policy_id = SpRoleEntityMapping.objects.get(role_id = role_id , entity_type = "leave_policy")
                leave_policy_id = leave_policy_id.entity_id
            except SpRoleEntityMapping.DoesNotExist:
                leave_policy_id = None
            if leave_policy_id:
                leave_policy_dettail = SpLeavePolicyDetails.objects.filter(leave_policy_id = leave_policy_id)
                for policy_detail in leave_policy_dettail:
                    leave_polcy_ledger = SpUserLeavePolicyLedger()
                    leave_polcy_ledger.user_id = user_id
                    leave_polcy_ledger.leave_policy_id = leave_policy_id
                    leave_polcy_ledger.leave_type_id = policy_detail.leave_type_id
                    # current_month = datetime.today().strftime('%m')
                    current_month = 1
                    if int(current_month) == 1:
                        leave_polcy_ledger.month_leave_count = policy_detail.month_leave_count
                    else:   
            
                        leave_polcy_ledger.month_leave_count = policy_detail.month_leave_count
                    leave_polcy_ledger.year_leave_count = policy_detail.year_leave_count
                    leave_polcy_ledger.leave_date =  today
                    leave_polcy_ledger.consecutive_leave = policy_detail.consecutive_leave 
                    leave_polcy_ledger.credit = policy_detail.month_leave_count
                    last = SpUserLeavePolicyLedger.objects.filter(user_id = user_id,leave_type_id = policy_detail.leave_type_id).last()
                    if policy_detail.is_carry_forward == 0:
                        if last:
                            if last.balance:
                                balance = float(policy_detail.month_leave_count) + float(last.balance)
                            else:
                                balance = policy_detail.month_leave_count
                        else:
                            balance = policy_detail.month_leave_count
                    else:
                        balance = policy_detail.month_leave_count
        
                    leave_polcy_ledger.balance = round(balance,1)
                    leave_polcy_ledger.save()
                    

@api_view(["GET"])
@permission_classes((AllowAny,))
def getFollowupDataReminder(request):
    context     = {}
    today       = date.today()
    lead_lists  = SpLeadOther.objects.filter(visit_date__gte = today.strftime("%Y-%m-%d"),reminder__gte = today.strftime("%Y-%m-%d"))
    for lead_list in lead_lists:
        try:
            userFirebaseToken = getModelColumnById(SpUsers,lead_list.created_by_id,'firebase_token')
            contact_person_name = getModelColumnById(SpLeadBasic,lead_list.last_lead_id,'contact_person_name')
            employee_name     = getUserName(lead_list.created_by_id)
            message_title     = "Lead Follow-up reminder!"
            user_name         = "Admin"
            from_user_id      = 1
            firsts_date        = datetime.strptime(str(lead_list.visit_date),'%Y-%m-%d').strftime('%d/%m/%Y')
            message_body      = f"You have a scheduled follow-up meeting with {contact_person_name} on {firsts_date} for (TTRACK{lead_list.last_lead_id})."
            notification_image = ""
            if userFirebaseToken is not None and userFirebaseToken != "" :
                registration_ids = []
                registration_ids.append(userFirebaseToken)
                data_message = {}
                data_message['id'] = 1
                data_message['status'] = 'notification'
                data_message['click_action'] = 'FLUTTER_NOTIFICATION_CLICK'
                data_message['image'] = notification_image
                send_android_notification(message_title,message_body,data_message,registration_ids)
                #-----------------------------notify android block-------------------------------#
    
            #-----------------------------save notification block----------------------------#
            saveNotification(lead_list.last_lead_id,'Lead Management','Lead Management','Lead Follow-up reminder!',message_title,message_body,notification_image,from_user_id,user_name,lead_list.created_by_id,employee_name,'profile.png',2,'app.png',1,1)
        except:
            pass
    context['message']    = 'Reminder send successfully.'
    context['response_code']    = HTTP_200_OK
    context['count']    = len(lead_lists)
    return Response(context, status=HTTP_200_OK)
    

@api_view(["GET"])
@permission_classes((AllowAny,))
def getExpairyDataReminder(request):
    context     = {}
    today       = now().date()
    start_range = today + timedelta(days=20)
    # Fetch leads where any of the surveillance or expiry dates are within the next 20 days
    leads = SpLeadIso.objects.filter(
        Q(date_of_survilance1__range=(today, start_range)) |
        Q(date_of_survilance2__range=(today, start_range)) |
        Q(date_of_expiry__range=(today, start_range))
    )
    for lead in leads:
        try:
            matched_dates = []
            # Check each date field to see if it matches the condition
            if lead.date_of_survilance1 and today <= lead.date_of_survilance1 <= start_range:
                matched_dates.append(('Surveillance 1', lead.date_of_survilance1,0))
            if lead.date_of_survilance2 and today <= lead.date_of_survilance2 <= start_range:
                matched_dates.append(('Surveillance 2', lead.date_of_survilance2,1))
            if lead.date_of_expiry and today <= lead.date_of_expiry <= start_range:
                matched_dates.append(('Expiry', lead.date_of_expiry,2))
                
            # Sort by date to get the earliest matching date
            matched_dates.sort(key=lambda x: x[1])
    
            # Print or process the first matched date
            if matched_dates:
                first_matched_column, first_date,iso_type  = matched_dates[0]
                first_dates        = first_date
                first_date        = datetime.strptime(str(first_date),'%Y-%m-%d').strftime('%d/%m/%Y')
                userFirebaseToken = getModelColumnById(SpUsers,lead.created_by_id,'firebase_token')
                employee_name     = getUserName(lead.created_by_id)
                message_title     = "ISO Renewal alert!"
                user_name         = "Admin"
                from_user_id      = 1
                message_body      = f"{first_matched_column} of ISO - {lead.master_iso_id} is due on {first_date} for (TTRACK{lead.last_lead_id})."
                notification_image = ""
                if userFirebaseToken is not None and userFirebaseToken != "" :
                    registration_ids = []
                    registration_ids.append(userFirebaseToken)
                    data_message = {}
                    data_message['id'] = 1
                    data_message['status'] = 'notification'
                    data_message['click_action'] = 'FLUTTER_NOTIFICATION_CLICK'
                    data_message['image'] = notification_image
                    send_android_notification(message_title,message_body,data_message,registration_ids)
                    #-----------------------------notify android block-------------------------------#
        
                #-----------------------------save notification block----------------------------#
                saveNotification(lead.last_lead_id,'Lead Management','Lead Management','Renewal alert!',message_title,message_body,notification_image,from_user_id,user_name,lead.created_by_id,employee_name,'profile.png',2,'app.png',1,1,iso_type,first_dates)
        except:
            pass
    context['message']    = 'Renewal data send successfully.'
    context['response_code']    = HTTP_200_OK
    context['count']    = len(leads)
    return Response(context, status=HTTP_200_OK)
    

@api_view(["GET"])
@permission_classes((AllowAny,))
def getExpairyDocumentReminder(request):
    context = {}
    today = now().date()
    start_range = today + timedelta(days=20)

    # Fetch leads where any of the document expiry dates are within the next 20 days
    leads = SpUserDocuments.objects.filter(
        Q(qatar_id_expairy__range=(today, start_range)) |
        Q(passport_card_expairy__range=(today, start_range)) |
        Q(resume_expairy__range=(today, start_range)) |
        Q(educationaldoc_expairy__range=(today, start_range)) |
        Q(offerletter_expairy__range=(today, start_range)) |
        Q(visaletter_expairy__range=(today, start_range))
    )

    for lead in leads:
        matched_dates = []
        # Check each date field to see if it matches the condition and is not None
        if lead.qatar_id_expairy and today <= lead.qatar_id_expairy <= start_range:
            matched_dates.append(('Qatar id', lead.qatar_id_expairy))
        if lead.passport_card_expairy and today <= lead.passport_card_expairy <= start_range:
            matched_dates.append(('Passport id', lead.passport_card_expairy))
        if lead.resume_expairy and today <= lead.resume_expairy <= start_range:
            matched_dates.append(('Resume', lead.resume_expairy))
        if lead.educationaldoc_expairy and today <= lead.educationaldoc_expairy <= start_range:
            matched_dates.append(('Educational document', lead.educationaldoc_expairy))
        if lead.offerletter_expairy and today <= lead.offerletter_expairy <= start_range:
            matched_dates.append(('Offer letter', lead.offerletter_expairy))
        if lead.visaletter_expairy and today <= lead.visaletter_expairy <= start_range:
            matched_dates.append(('Visa', lead.visaletter_expairy))

        # Sort by date to get the earliest matching date
        matched_dates.sort(key=lambda x: x[1])

        if matched_dates:
            first_matched_column, first_date = matched_dates[0]
            formatted_first_date = first_date.strftime('%d/%m/%Y')
            userFirebaseToken = getModelColumnById(SpUsers, lead.user_id, 'firebase_token')
            employee_name = getUserName(lead.user_id)
            message_title = "Document Renewal alert!"
            user_name = "Admin"
            from_user_id = 1
            message_body = f"Your {first_matched_column} will expire on {formatted_first_date}. Kindly do the needful."
            notification_image = ""

            if userFirebaseToken and userFirebaseToken != "":
                registration_ids = [userFirebaseToken]
                data_message = {
                    'id': 1,
                    'status': 'notification',
                    'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                    'image': notification_image
                }
                send_android_notification(message_title, message_body, data_message, registration_ids)

            saveNotification(lead.user_id, 'SpUsers', 'User Management', 'Document Renewal alert!', message_title, message_body, notification_image, from_user_id, user_name, lead.user_id, employee_name, 'profile.png', 2, 'app.png', 1, 1)

    context['message'] = 'Renewable data sent successfully.'
    context['response_code'] = 200  # HTTP_200_OK
    context['count'] = len(leads)
    return Response(context, status=200)



    
    
    