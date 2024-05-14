import simplejson, json
import time,timeago
from django.contrib.auth import authenticate
from django.views.decorators.csrf import csrf_exempt
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
import decimal
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

from datetime import datetime, date
from django.conf import settings

from datetime import timedelta
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password, check_password
from django.template.loader import render_to_string
from django.core.mail import EmailMultiAlternatives
from math import sin, cos, sqrt, atan2, radians
import ast
import threading
from django.http import JsonResponse


# @csrf_exempt
# @api_view(["POST"])
# @permission_classes((AllowAny,))
# def login(request):
   
#     if request.data.get("mobile_no") == '':  
#         return Response({'message': 'Please provide mobile no.', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 

#     if request.data.get("otp") == '':
#         return Response({'message': 'Please provide otp', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)     

#     if request.data.get("mobile_no") is None or request.data.get("otp") is None:
#         return Response({'message': 'Please provide both mobile no. and otp', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

#     try:
#         user_details = SpUserOtp.objects.filter(mobile_no=request.data.get("mobile_no"), otp=request.data.get("otp"), user_type=request.data.get("type")).first()

#     except SpUserOtp.DoesNotExist:
#         user_details = None

#     if user_details:   
#         user_details = SpUsers.objects.get(id=user_details.user_id)
#     else:        
#         user_details = None
    
#     user = user_details

#     if user_details:
#         if user_details.status == 0:
#             return Response({'message': 'You account has been blocked, So please contact administrator', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_404_NOT_FOUND)

#     if not user_details:
#         return Response({'message': 'Invalid Credentials', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_404_NOT_FOUND)

#     if user.user_type == '1':
#         if request.data.get("device_id") != '' and user.device_id is not None :
#             if request.data.get("device_id") != getModelColumnById(SpUsers, user.id, 'device_id'):
#                 return Response({'message': 'You have already login in another device', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_404_NOT_FOUND) 

#     SpUserOtp.objects.filter(mobile_no=request.data.get("mobile_no"), otp=request.data.get("otp"), user_type=request.data.get("type")).delete()        
#     token, _ = Token.objects.get_or_create(user=user)
#     user_details = SpUsers.objects.filter(status=1, id=user.id).values()
#     try:
#         user_basic_details = model_to_dict(SpBasicDetails.objects.get(user_id=user.id))
#     except SpBasicDetails.DoesNotExist:
#         user_basic_details = []
#     try:
#         user_correspondence_details = model_to_dict(SpAddresses.objects.get(user_id=user.id,type='correspondence'))
#     except SpAddresses.DoesNotExist:
#         user_correspondence_details = []
#     try:
#         user_permanent_details = model_to_dict(SpAddresses.objects.get(user_id=user.id,type='permanent'))
#     except SpAddresses.DoesNotExist:
#         user_permanent_details = []
#     user_name   = user.first_name+' '+user.middle_name+' '+user.last_name
#     heading     = user_name+' has been logged In'
#     activity    = user_name+' has been logged In on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p') 
    
#     saveActivity('Login', 'Login', heading, activity, user.id, user_name, 'noti.png', '2', 'mobile.png')
    
#     if request.data.get("device_id") != '' :
#         current_user = SpUsers.objects.get(id=user.id)
#         current_user.device_id = request.data.get("device_id")
#         current_user.last_login = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
#         current_user.save()
    
#     if getModelColumnById(SpUsers, user.id, 'latitude')is None or getModelColumnById(SpUsers, user.id, 'latitude') == '':
#         latitude = '' 
#     else:
#         latitude = getModelColumnById(SpUsers, user.id, 'latitude')

#     if getModelColumnById(SpUsers, user.id, 'longitude')is None or getModelColumnById(SpUsers, user.id, 'longitude') == '':
#         longitude = ''
#     else:
#         longitude = getModelColumnById(SpUsers, user.id, 'longitude')

#     if getModelColumnById(SpUsers, user.id, 'periphery')is None or getModelColumnById(SpUsers, user.id, 'periphery') == '':
#         periphery = ''
#     else:
#         periphery = getModelColumnById(SpUsers, user.id, 'periphery')

#     if getModelColumnById(SpUsers, user.id, 'timing')is None or getModelColumnById(SpUsers, user.id, 'timing') == '':
#         timing = ''
#     else:
#         timing = getModelColumnById(SpUsers, user.id, 'timing')
    
#     #update
#     SpUsers.objects.filter(id=user.id).update(firebase_token=request.data.get("firebase_token"))
  
#     context = {}
#     context['token']                    = token.key
#     context['user_details']             = user_details
#     context['basic_details']            = user_basic_details
#     context['correspondence_address']   = user_correspondence_details
#     context['permanent_address']        = user_permanent_details
#     context['state_list']               = SpStates.objects.all().values('id', 'state').order_by('state')
#     context['city_list']                = TblNewDistrict.objects.all().values('id', 'state_id', 'district_name').order_by('district_name')
#     context['latitude']                 = latitude
#     context['longitude']                = longitude
#     context['periphery']                = periphery
#     context['timing']                   = timing
#     context['message']                  = 'Login successfully'
#     context['tracking_time']            = getModelColumnById(Configuration, 1, 'user_tracking_time')
#     context['response_code']            = HTTP_200_OK
#     return Response(context, status=HTTP_200_OK)

@csrf_exempt
@api_view(["POST"])
@permission_classes((AllowAny,))
def login(request):
    # user_type = request.data.get("user_type")
    if request.data.get("username") == '':  
        return Response({'message': 'Please provide username', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("password") == '':
        return Response({'message': 'Please provide password', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)     
    if request.data.get("username") is None or request.data.get("password") is None:
        return Response({'message': 'Please provide both username and password', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    # if not user_type:
    #     return Response({'message': 'User type field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_404_NOT_FOUND)

    # if user_type == '0':
    try:
        user_details = SpUsers.objects.filter(status=1, emp_sap_id=request.data.get("username")).first()
    except SpUsers.DoesNotExist:
        user_details = None
    if user_details:
        username = user_details.emp_sap_id
    else:        
        username = None
    error_msg = 'Invalid Employee Code.'
    if not user_details:
        return Response({'message': error_msg, 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_404_NOT_FOUND)
 
    username = username
    password = request.data.get("password")
 
    if check_password(password, user_details.password):
        user = user_details
    else:    
        user = None

    if not user:
        return Response({'message': 'Invalid Credentials', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_404_NOT_FOUND)
    token, _ = Token.objects.get_or_create(user=user)
    user_details = SpUsers.objects.filter(status=1, id=user.id).values()
    try:
        user_basic_details = model_to_dict(SpBasicDetails.objects.get(user_id=user.id))
    except SpBasicDetails.DoesNotExist:
        user_basic_details = []
    try:
        user_correspondence_details = model_to_dict(SpAddresses.objects.get(user_id=user.id,type='correspondence'))
    except SpAddresses.DoesNotExist:
        user_correspondence_details = []
    try:
        user_permanent_details = model_to_dict(SpAddresses.objects.get(user_id=user.id,type='permanent'))
    except SpAddresses.DoesNotExist:
        user_permanent_details = []
    user_name   = user.first_name+' '+user.middle_name+' '+user.last_name
    heading     = user_name+' has been logged In'
    activity    = user_name+' has been logged In on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p') 
    
    saveActivity('Login', 'Login', heading, activity, user.id, user_name, 'login.png', '2', 'app.png')
    
    if request.data.get("device_id") != '' :
        current_user = SpUsers.objects.get(id=user.id)
        current_user.device_id = request.data.get("device_id")
        current_user.save()
    
    if getModelColumnById(SpUsers, user.id, 'latitude')is None or getModelColumnById(SpUsers, user.id, 'latitude') == '':
        latitude = '' 
    else:
        latitude = getModelColumnById(SpUsers, user.id, 'latitude')

    if getModelColumnById(SpUsers, user.id, 'longitude')is None or getModelColumnById(SpUsers, user.id, 'longitude') == '':
        longitude = ''
    else:
        longitude = getModelColumnById(SpUsers, user.id, 'longitude')

    if getModelColumnById(SpUsers, user.id, 'periphery')is None or getModelColumnById(SpUsers, user.id, 'periphery') == '':
        periphery = ''
    else:
        periphery = getModelColumnById(SpUsers, user.id, 'periphery')

    if getModelColumnById(SpUsers, user.id, 'timing')is None or getModelColumnById(SpUsers, user.id, 'timing') == '':
        timing = ''
    else:
        timing = getModelColumnById(SpUsers, user.id, 'timing')
    
    #update
    SpUsers.objects.filter(id=user.id).update(firebase_token=request.data.get("firebase_token"))
    
    context = {}
    context['token']                    = token.key
    context['user_details']             = user_details
    context['basic_details']            = user_basic_details
    context['correspondence_address']   = user_correspondence_details
    context['permanent_address']        = user_permanent_details
    context['state_list']               = SpStates.objects.all().values('id', 'state').order_by('state')
    context['city_list']                = TblNewDistrict.objects.all().values('id', 'state_id', 'district_name').order_by('district_name')
    context['latitude']                 = latitude
    context['longitude']                = longitude
    context['periphery']                = periphery
    context['timing']                   = timing
    context['message']                  = 'Login successfully'
    context['tracking_time']            = getModelColumnById(Configuration, 1, 'user_tracking_time')
    context['response_code']            = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)


@csrf_exempt
@api_view(["POST"])
@permission_classes((AllowAny,))
def sendOtp(request):
        if request.data.get("mobile_no")is None or request.data.get("mobile_no") == '':
            return Response({'message': 'Please provide mobile no.', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        if request.data.get("type")is None or request.data.get("type") == '':
            return Response({'message': 'Please provide type.', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)    
        try:
            user_details = SpUsers.objects.filter(primary_contact_number=request.data.get("mobile_no"), status=1).first()

        except SpUsers.DoesNotExist:
            user_details = None
        
        if request.data.get("mobile_no") == '9898989898':
            otp = '1234'
        else:
            otp = generateOTP()
        if user_details:
            try:
                user_otp = SpUserOtp.objects.filter(mobile_no=request.data.get("mobile_no"), user_type=request.data.get("type")).first()
            except SpUserOtp.DoesNotExist:
                user_otp = None
    
            if user_otp:
                SpUserOtp.objects.filter(user_id=user_details.id, user_type=request.data.get("type")).delete()
            
                
            user_otp            = SpUserOtp()
            user_otp.mobile_no  = request.data.get("mobile_no")
            user_otp.user_id    = user_details.id
            user_otp.otp        = otp
            user_otp.user_type  = request.data.get("type")
            user_otp.save()
    
            message = "OTP for login verification "+str(otp)+"."
            # try:
            #     sendSMS('SMPAL', user_details.primary_contact_number, message, '1707167230071843813')
            # except:
            #     return Response({'message': 'Unable to send otp', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
            context = {}
            context['message']  = 'OTP sent successfully'
            context['otp']      = message
            context['response_code'] = HTTP_200_OK
            return Response(context, status=HTTP_200_OK)
        else:
            return Response({'message': 'Invalid Mobile No.', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
            
   

@csrf_exempt
@api_view(["POST"])
@permission_classes((AllowAny,))

def verifyIdPin(request):
    id_card_pin = request.data.get("id_card_pin")
    if not id_card_pin:
        return Response({'message': 'ID Card pin is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_404_NOT_FOUND)

    if TblStudents.objects.filter(id_card_pin=id_card_pin).exists():
        student = TblStudents.objects.raw(''' SELECT tbl_students.*,tbl_colleges.college_name,tbl_colleges.alias,tbl_branch.branch FROM tbl_students
        LEFT JOIN tbl_colleges on tbl_colleges.id = tbl_students.college_id 
        LEFT JOIN tbl_branch on tbl_branch.id = tbl_students.branch_id
        WHERE tbl_students.id_card_pin=%s ''',[id_card_pin])

        # update 
        TblStudents.objects.filter(id_card_pin=id_card_pin).update(is_id_card_pin_verified=1)

        student_name   = student[0].first_name+' '
        if student[0].middle_name is not None:
            student_name   += student[0].middle_name+' '
        if student[0].last_name is not None:
            student_name   += student[0].last_name

        heading     = 'ID Card Pin Verification.'
        activity    = student_name+' ('+ student[0].reg_no +')  has verified his/her id card at '+datetime.now().strftime('%d/%m/%Y | %I:%M %p') 
        saveActivity('Student', 'ID Card Pin Verification', heading, activity, student[0].id, student_name, 'add.png', '2', 'app.png')

        student_details = {}
        student_details['id'] = student[0].id
        student_details['name'] = student_name
        student_details['registration_number'] = student[0].reg_no
        student_details['college'] = student[0].alias
        student_details['course'] = student[0].branch
        student_details['contact_number'] = student[0].primary_contact_no
        student_details['father_name'] = student[0].father_name

        if student[0].college_id == 1:
            if student[0].profile_image is not None:
                student_details['profile_image'] = "http://bipe.sortstring.co.in/"+student[0].profile_image
            else:
                student_details['profile_image'] = "https://sansthaa.sortstring.co.in/static/img/png/default_icon.png"

            student_details['college_logo'] = "http://bipe.sortstring.co.in/public/assets/images/bipe-logo.png"
        elif student[0].college_id == 2:
            if student[0].profile_image is not None:
                student_details['profile_image'] = "http://bite.sortstring.co.in/"+student[0].profile_image
            else:
                student_details['profile_image'] = "https://sansthaa.sortstring.co.in/static/img/png/default_icon.png"

            student_details['college_logo'] = "http://bipe.sortstring.co.in/public/assets/images/bipe-logo.png"
        
        elif student[0].college_id == 3:
            if student[0].profile_image is not None:
                student_details['profile_image'] = "http://bip.sortstring.co.in/"+student[0].profile_image
            else:
                student_details['profile_image'] = "https://sansthaa.sortstring.co.in/static/img/png/default_icon.png"

            student_details['college_logo'] = "http://bipe.sortstring.co.in/public/assets/images/bip-logo.png"

        
        tmp = student[0].semester_id.split('_')
        suffix = ""
        if tmp[1] == "1":
            suffix = "st"
        elif tmp[1] == "2":
            suffix = "nd"
        elif tmp[1] == "3":
            suffix = "rd"
        elif tmp[1] == "4" or tmp[1] == "5" or tmp[1] == "6":
            suffix = "th"

        if tmp[0] == "sem":
            student_details['semester_year'] = str(tmp[1])+suffix+" Sem"
        else:
            student_details['semester_year'] = str(tmp[1])+suffix+" Year"


        context = {}
        
        context['message']                  = 'ID Card pin verified successfully'
        context['response_code']            = HTTP_200_OK
        context['student']                  = student_details

        return Response(context, status=HTTP_200_OK)
    else:
        return Response({'message': 'Invalid ID Card pin', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_404_NOT_FOUND)
   

#for approvalRequests
@csrf_exempt
@api_view(["POST"])
def approvalRequests(request):    
    data = {}
    if request.user.role_id == 0:
        #all leave policies only excluding approved one with policy status 3
        leave_policy_data = []
        leave_policies = SpLeavePolicies.objects.exclude(policy_status=3).order_by('-id')
        for leave_policy in leave_policies:
            leave_policy_data.append(model_to_dict(leave_policy))

        #all holiday only excluding approved one with holiday status 3
        holiday_data = []
        holidays = SpHolidays.objects.exclude(holiday_status=3).order_by('-id')
        for holiday in holidays:
            holiday_data.append(model_to_dict(holiday))
        
        data['leave_policies'] = leave_policy_data
        data['holidays'] = holiday_data

        return Response({'message':"approval request","approval_requests":data, 'response_code': HTTP_200_OK}, status=HTTP_200_OK)
    
    else:
        #will show leaves on behalf of user logged in and excluding leave with status 3
        leave_policy_data = []
        leave_policies = SpLeavePolicies.objects.raw('''SELECT sp_leave_policies.*, sp_approval_status.level_id, sp_approval_status.level, sp_approval_status.status, sp_approval_status.final_status_user_id, sp_approval_status.final_status_user_name
        FROM sp_leave_policies left join sp_approval_status on sp_approval_status.row_id = sp_leave_policies.id 
        where sp_leave_policies.policy_status != 3 and  sp_approval_status.user_id = %s and sp_approval_status.model_name = 'SpLeavePolicyDetails' order by id desc ''',[19])#[request.user.id]
        for leave_policy in leave_policies:
            leave_policy_data.append(model_to_dict(leave_policy))

        #will show holidays on behalf of user logged in and excluding holiday with status 3
        holiday_data = []
        holidays = SpHolidays.objects.raw('''SELECT sp_holidays.*, sp_approval_status.level_id, sp_approval_status.level, sp_approval_status.status, sp_approval_status.final_status_user_id, sp_approval_status.final_status_user_name
        FROM sp_holidays left join sp_approval_status on sp_approval_status.row_id = sp_holidays.id 
        where sp_holidays.holiday_status != 3 and  sp_approval_status.user_id = %s and sp_approval_status.model_name = 'SpHolidays' order by id desc ''',[19])#[request.user.id]

        for holiday in holidays:
            holiday_data.append(model_to_dict(holiday))

        
        data['leave_policies'] = leave_policy_data
        data['holidays'] = holiday_data
            
        return Response({'message':"approval request","approval_requests":data, 'response_code': HTTP_200_OK}, status=HTTP_200_OK)
    

#for updatePolicyStatus
@csrf_exempt
@api_view(["POST"])
def updatePolicyStatus(request):
    response = {}
    uploaded_file_url = ''
    policyID = request.POST.getlist('policyId')
    if bool(request.FILES.get('document', False)) == True:
        document = request.FILES['document']
        fs = FileSystemStorage(location="media/approval_documents")
        filename = fs.save(document.name, document)
        uploaded_file_url = fs.url(filename)
        uploaded_file_url = uploaded_file_url.split("media/")[1]
        uploaded_file_url = "media/approval_documents/"+uploaded_file_url
        
    policyID = str(policyID).replace("'","")
    policyID = str(policyID).replace("[","")
    policyID = str(policyID).replace("]","")
    policyID = policyID.split(",")
    if policyID:
        for policy_id in policyID:
            updatePolicyStatus = SpLeavePolicies.objects.get(id=policy_id)
            updatePolicyStatus.policy_status = request.POST['statusId']
            updatePolicyStatus.approval_description = request.POST['description']
            updatePolicyStatus.document = uploaded_file_url
            updatePolicyStatus.save()
        response['error'] = False
        response['message'] = "Record has been updated successfully."
        return Response(response)
    else:
        response['error'] = True
        response['message'] = "Record has Not been updated successfully."
        return Response(response)


#for updatePolicyStatus
@csrf_exempt
@api_view(["POST"])
def updateHolidayStatus(request):
    response = {}
    uploaded_file_url = ''
    if bool(request.FILES.get('document', False)) == True:
        document = request.FILES['document']
        fs = FileSystemStorage(location="media/approval_documents")
        filename = fs.save(document.name, document)
        uploaded_file_url = fs.url(filename)
        uploaded_file_url = uploaded_file_url.split("media/")[1]
        uploaded_file_url = "media/approval_documents/"+uploaded_file_url

    holidayID = request.POST.getlist('holidayID')
    holidayID = str(holidayID).replace("'","")
    holidayID = str(holidayID).replace("[","")
    holidayID = str(holidayID).replace("]","")
    holidayID = holidayID.split(",")
    if holidayID:
        for holiday_id in holidayID:
            updateHolidayStatus = SpHolidays.objects.get(id=holiday_id)
            updateHolidayStatus.holiday_status = request.POST['statusId']
            updateHolidayStatus.approval_description = request.POST['description']
            updateHolidayStatus.document = uploaded_file_url
            updateHolidayStatus.save()
        response['error'] = False
        response['message'] = "Record has been updated successfully."
        return Response(response)
    else:
        response['error'] = True
        response['message'] = "Record has Not been updated successfully."
        return Response(response)

        
        

def checkApplyLeaveBefore(date,leave_policy_id,user_id ,leave_type_id):
    try:
        leave_policy_details = SpLeavePolicyDetails.objects.get(leave_policy_id = leave_policy_id,leave_type_id=leave_type_id)
    except SpLeavePolicyDetails.DoesNotExist:
        leave_policy_details = None
    if leave_policy_details:
        if leave_policy_details.apply_leave_before:
            apply_leave_before = int(leave_policy_details.apply_leave_before)
            today               = datetime.strptime(datetime.today().strftime('%Y-%m-%d'), '%Y-%m-%d')
            total_no_of_leave_before_days      = date - today
            total_no_of_leave_before_days      = total_no_of_leave_before_days.days 
            if apply_leave_before > total_no_of_leave_before_days:
                return True
            else:
                return False
        else:
                return False
    else:
        return False
           
def checkAvailAdvance(user_id):
    date_of_joining = getModelColumnByColumnId(SpBasicDetails,'user_id',user_id,'date_of_joining')
    date_of_joining = datetime.strptime(date_of_joining.strftime('%Y-%m-%d'), '%Y-%m-%d')
    today           = datetime.today()
    total_days      = today - date_of_joining
    total_days      = total_days.days 
    if total_days > 365 or total_days > 366:
      return True
    else:
        return False 
        
@csrf_exempt
@api_view(["POST"])
def handOverLeaveRequestList(request):
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("page_limit")is None or request.data.get("page_limit") == '':
        return Response({'message': 'Page limit is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

    page_limit  = int(request.data.get("page_limit"))*10
    offset      = int(page_limit)-10
    page_limit  = 10
    
    leave_list_count = SpNotifications.objects.filter(sub_module = 'Leave request forwarded',to_user_id = request.data.get("user_id"),model_name = 'SpUserLeaves').values('id').count()
        
    if leave_list_count:
        leave_list_count = math.ceil(round(leave_list_count/10, 2))
    else:
        leave_list_count = 0 

        
    leave_request = SpNotifications.objects.filter(sub_module = 'Leave request forwarded',to_user_id = request.data.get("user_id"),model_name = 'SpUserLeaves').order_by('-id')[offset:offset+page_limit]
    request_list = []
    for req in leave_request:
        if SpUserLeaves.objects.filter(id = req.row_id ).exists():
            request_dict = {}
            request_dict['leave_id']                = req.row_id
            request_dict['heading']                 = req.heading
            request_dict['leave_status']            = getModelColumnById(SpUserLeaves,req.row_id,'leave_status')
            request_dict['applied_emp_name']        = req.from_user_name
            request_dict['applied_emp_code']         = getModelColumnById(SpUsers,req.from_user_id,'emp_sap_id')
            request_dict['leave_from_date']         = getModelColumnById(SpUserLeaves,req.row_id,'leave_from_date')
            request_dict['leave_to_date']           = getModelColumnById(SpUserLeaves,req.row_id,'leave_to_date')
            request_dict['is_first_half_day']       = getModelColumnById(SpUserLeaves,req.row_id,'is_first_half_day')
            request_dict['is_last_half_day']        = getModelColumnById(SpUserLeaves,req.row_id,'is_last_half_day')
            request_list.append(request_dict)
            
    context = {}
    context['message']                  = 'Success'
    context['leave_request_list']       = request_list
    context['leave_list_count']         = leave_list_count
    return Response(context, status=HTTP_200_OK)   

 
@csrf_exempt
@api_view(["POST"])
def applyLeave(request):
    today   = date.today()
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    
    if request.data.get("leave_type_id")is None or request.data.get("leave_type_id") == '':
        return Response({'message': 'Leave type id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    
    if request.data.get("leave_from_date")is None or request.data.get("leave_from_date") == '':
        return Response({'message': 'From date field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    
    if request.data.get("leave_to_date")is None or request.data.get("leave_to_date") == '':
        return Response({'message': 'To date field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("description")is None or request.data.get("description") == '':
        return Response({'message': 'Description field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("handover_user_id")is None or request.data.get("handover_user_id") == '':
        return Response({'message': 'handover user field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    
    attachment = None
    year_leave_counts = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = request.data.get("leave_type_id")).last()
    if year_leave_counts.year_leave_count == 0:
        return Response({'message': 'No '+getModelColumnById(SpLeaveTypes,year_leave_counts.leave_type_id ,'leave_type')+' available Kindly contact HR', 'response_code':0}, status=HTTP_200_OK)
        
    leave_from_date             = datetime.strptime(request.data.get("leave_from_date"), '%Y-%m-%d')
    leave_to_date               = datetime.strptime(request.data.get("leave_to_date"), '%Y-%m-%d')
    total_no_of_leave_days      = leave_to_date - leave_from_date
    total_no_of_leave_days      = total_no_of_leave_days.days 
    consecutive_leave_counts     = SpUserLeavePolicyLedger.objects.filter(leave_type_id = request.data.get("leave_type_id"),user_id = request.data.get("user_id")).last() 
    
    # print(consecutive_leave_counts )
    if consecutive_leave_counts.consecutive_leave:
        consecutive_leave_count     = int(consecutive_leave_counts.consecutive_leave)
    else:
        consecutive_leave_count = 0
        
    credit = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = request.data.get("leave_type_id")).aggregate(Sum('credit'))['credit__sum']
    if credit:
        credit = credit
    else:
        credit = 0
    debit = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = request.data.get("leave_type_id")).aggregate(Sum('debit'))['debit__sum']
    if debit:
        debit = debit
    else:
        debit = 0
    leave_count   = float(credit)-float(debit)
        
    
    isLeaveAppliedOrNot  = checkLeaveAppliedOrNot(request.data.get("user_id"), request.data.get("leave_from_date"), request.data.get("leave_to_date"))
    if checkAttendanceMarkedOrNot(request.data.get("user_id"), request.data.get("leave_from_date"), request.data.get("leave_to_date"), today.strftime('%Y-%m-%d')):
        return Response({'message': 'Attendance already marked.', 'response_code':0}, status=HTTP_200_OK)
    elif isLeaveAppliedOrNot['status'] == True:
        return Response({'message': 'You have already marked leave on selected dates.', 'response_code':0}, status=HTTP_200_OK)
    elif consecutive_leave_count <= total_no_of_leave_days:
        return Response({'message': f'You can not apply {consecutive_leave_count} consecutive days.', 'response_code':0}, status=HTTP_200_OK)
    elif leave_count <= total_no_of_leave_days:
        return Response({'message': f'You can apply leave only {leave_count} days.', 'response_code':0}, status=HTTP_200_OK)
    elif checkApplyLeaveBefore(leave_from_date,consecutive_leave_counts.leave_policy_id,request.data.get("user_id"),consecutive_leave_counts.leave_type_id) == True:
        try:
             leave_policy_details = SpLeavePolicyDetails.objects.get(leave_policy_id = consecutive_leave_counts.leave_policy_id,leave_type_id=consecutive_leave_counts.leave_type_id)
        except SpLeavePolicyDetails.DoesNotExist:
            leave_policy_details = None

        
        apply_leave_before = int(leave_policy_details.apply_leave_before)
        return Response({'message': f'You can only apply leaves before {apply_leave_before} days.', 'response_code':0}, status=HTTP_200_OK)
    
    else:
        leave_policy_details = SpLeavePolicyDetails.objects.get(leave_policy_id = consecutive_leave_counts.leave_policy_id,leave_type_id=consecutive_leave_counts.leave_type_id)
        if bool(request.FILES.get('attachment', False)) == True:
            uploaded_attachment = request.FILES['attachment']
            storage = FileSystemStorage()
            timestamp = int(time.time())
            attachment_name = uploaded_attachment.name
            temp = attachment_name.split('.')
            attachment_name = 'leave_attachment_'+str(timestamp)+"."+temp[(len(temp) - 1)]
            
            attachment = storage.save(attachment_name, uploaded_attachment)
            attachment = storage.url(attachment)        
                
        user_name   = request.user.first_name+' '+request.user.middle_name+' '+request.user.last_name
        data = SpUserLeaves()
        data.user_id                = request.data.get("user_id")
        data.user_name              = user_name
        data.leave_type_id          = request.data.get("leave_type_id")
        data.leave_type             = getModelColumnById(SpLeaveTypes,request.data.get("leave_type_id"),'leave_type')
        data.leave_from_date        = request.data.get("leave_from_date")
        data.leave_to_date          = request.data.get("leave_to_date")
        data.handover_user_id          = request.data.get("handover_user_id")
        

        if request.data.get("is_first_half_day") == "1":
            data.is_first_half_day = 1
            leave_policy_detail = SpLeavePolicyDetails.objects.filter(leave_type_id=request.data.get("leave_type_id")).first()
            if str(leave_policy_detail.is_halfday_included) == "0":
                return Response({'message': 'half day not allow', 'response_code':0}, status=HTTP_200_OK)
                
        else:
            data.is_first_half_day = 0
        if request.data.get("is_last_half_day") == "1":
            data.is_last_half_day = 1
            leave_policy_detail = SpLeavePolicyDetails.objects.filter(leave_type_id=request.data.get("leave_type_id")).first()
            if str(leave_policy_detail.is_halfday_included) == "0":
                return Response({'message': 'half day not allow', 'response_code':0}, status=HTTP_200_OK)
        else:
            data.is_last_half_day = 0
        data.leave_detail           = request.data.get('description')
        data.leave_status           = 1
        data.attachment             = attachment
        data.save()
        user_leave_id  = data.id
        
        if request.data.get("handover_user_id"):
            userFirebaseToken = getModelColumnById(SpUsers,request.data.get("handover_user_id"),'firebase_token')
            employee_name = getUserName(request.data.get("handover_user_id"))

            message_title = "Leave Request Forwarded"
            message_body = "Leave Handover request has been sent by "+user_name
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
            saveNotification(user_leave_id,'SpUserLeaves','Users Management','Leave request forwarded',message_title,message_body,notification_image,request.data.get("user_id"),user_name,request.data.get("handover_user_id"),employee_name,'profile.png',2,'app.png',1,1)
        #-----------------------------save notification block----------------------------#
        document_id  = request.data.get('document_id')
        document_id = document_id.split(',')
        
        if bool(request.FILES.get('document', False)) == True:
            for i,document in enumerate(request.FILES.getlist('document')):
                # uploaded_attachment = request.FILES['attachment']
                
                storage = FileSystemStorage()
                timestamp = int(time.time())
                attachment_name = document.name
                temp = attachment_name.split('.')
                attachment_name = 'leave-document/leave_attachment_'+str(timestamp)+"."+temp[(len(temp) - 1)]
                
                attachment = storage.save(attachment_name, document)
                attachment = storage.url(attachment)  
                
                doc = SpUserLeaveDocument()  
                doc.user_id = request.data.get("user_id")
                doc.user_leave_id = user_leave_id
                doc.leave_type_document_id = document_id[i]
                doc.document = attachment
                doc.save()
        sendFocNotificationToUsers(data.id, '', 'add', 38, request.user.id, user_name, 'SpUserLeaves',request.user.role_id)
        
        heading     = 'New Leave Request has been initiated'
        activity    = 'New Leave Request has been initiated by '+user_name+' on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p') 
        
        saveActivity('Leave Management', 'Leave Request', heading, activity, request.user.id, user_name, 'add.png', '2', 'app.png')
        context = {}
        context['message']       = 'Leave Request has been successfully sent.'
        context['response_code'] = 1
        return Response(context, status=HTTP_200_OK)  
 
@csrf_exempt
@api_view(["POST"])
def appliedLeaves(request):
    if request.data.get("page_limit")is None or request.data.get("page_limit") == '':
        return Response({'message': 'Page limit is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)   
    page_limit  = int(request.data.get("page_limit"))*10
    offset      = int(page_limit)-10
    page_limit  = 10
    leave_list_count = SpUserLeaves.objects.filter(user_id=request.data.get("user_id")).values('id').count()
        
    if leave_list_count:
        leave_list_count = math.ceil(round(leave_list_count/10, 2))
        leave_status     = SpUserLeaves.objects.filter(user_id=request.data.get("user_id")).order_by('-id').first()
        leave_status     = leave_status.leave_status 
    else:
        leave_list_count = 0 
        leave_status     = 0
    leave_list = SpUserLeaves.objects.filter(user_id=request.data.get("user_id")).values('id','user_id','handover_user_id','user_name','leave_type_id','leave_type','leave_from_date','leave_to_date','leave_detail','leave_status','is_first_half_day','is_last_half_day','is_document_required','is_document_required_count').order_by('-id')[offset:offset+page_limit]
    for leave in leave_list:
        leave['handover_user_name'] = getUserName(leave['handover_user_id'])
        alias = getModelColumnById(SpLeaveTypes,leave['leave_type_id'],'alias')
        leave['leave_type'] = leave['leave_type']+" ("+ alias +")"
        uploaded_document_id = SpUserLeaveDocument.objects.filter(user_leave_id = leave['id']).values_list('leave_type_document_id',flat=True)
        pending_documents_list = SpLeaveTypeDocuments.objects.filter(leave_type_id  = leave['leave_type_id']).exclude(id__in  = uploaded_document_id).values('id','document')
        leave['pending_documents_list'] = list(pending_documents_list)
        
    basic_details_obj=SpBasicDetails.objects.filter(user_id=request.data.get("user_id")).first()
    if basic_details_obj:
        if basic_details_obj.week_of_day:
            week_off_day=basic_details_obj.week_of_day
        else:
            week_off_day=""
    else:
        week_off_day=""
        
        
    leave_type                      = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id")).values('leave_type_id').distinct()
    
    for leave in leave_type:
        try:
            leave_policy_id = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = leave['leave_type_id']).first()
            is_half_day = SpLeavePolicyDetails.objects.get(leave_policy_id = leave_policy_id.leave_policy_id,leave_type_id =leave['leave_type_id'] )
            is_half_day = is_half_day.is_halfday_included
        except SpLeavePolicyDetails.DoesNotExist:
            is_half_day  = None
        year_leave_count = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = leave['leave_type_id']).last()
        credit = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = leave['leave_type_id']).aggregate(Sum('credit'))['credit__sum']
        if credit:
            credit = credit
        else:
            credit = 0
        debit = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = leave['leave_type_id']).aggregate(Sum('debit'))['debit__sum']
        if debit:
            debit = debit
        else:
            debit = 0
        leave_count   = float(credit)-float(debit)
        leave['leave_type']                 = getModelColumnById(SpLeaveTypes,leave_policy_id.leave_type_id ,'leave_type') + ' (' +  str(leave_count) + ')'
        
        #leave['leave_type']                 = getModelColumnById(SpLeaveTypes,leave_policy_id.leave_type_id ,'leave_type') + ' (' +  str(year_leave_count.credit) + ')'
        leave['is_halfday_included']        = is_half_day
        leave['leave_count']                = leave_count
        leave['year_leave_count']           = year_leave_count.credit
        leave['leave_policy_id']            = leave_policy_id.leave_policy_id
        leave['required_document_list']     =  list(SpLeaveTypeDocuments.objects.filter(leave_type_id = leave['leave_type_id']).values('id','document'))
        
        
    year_leave_count = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id")).last()
    if year_leave_count:
       year_leave_count =  year_leave_count.balance
    else:
        year_leave_count = 0
    context = {}
    context['message']              = 'Success'
    context['leave_list']           = list(leave_list)
    
    context['leave_list_count']     = leave_list_count
    context['leave_type_list']      = list(leave_type)
    context['leave_count']          = year_leave_count
    context['leave_status']         = leave_status
    context['week_off_day']    = week_off_day
    
    context['response_code']        = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)

@csrf_exempt
@api_view(["POST"])
def saveUserTracking(request):

    today   = date.today()
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
   
    if request.data.get("latitude")is None or request.data.get("latitude") == '' or request.data.get("longitude")is None or request.data.get("longitude") == '':
        return Response({'message': 'Coordinates is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)  
    if SpUserTracking.objects.filter(user_id=request.data.get("user_id"), sync_date_time__icontains=today.strftime("%Y-%m-%d")).exists():
       
     
        user_data                       = SpUserTracking()
        user_data.user_id               = request.data.get("user_id")
        user_data.latitude              = request.data.get("latitude")
        user_data.longitude             = request.data.get("longitude")
        user_data.accuracy              = request.data.get("accuracy")
  
        user_data.distance_travelled    = 0
    
        user_data.travel_charges        = 0
        if request.data.get("created_at"):
            user_data.sync_date_time        = request.data.get("created_at")
            user_data.flag              = 1
        else:    
            user_data.sync_date_time        = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            user_data.flag              = 0
        user_data.save()
    else:
        user_data                       = SpUserTracking()
        user_data.user_id               = request.data.get("user_id")
        user_data.latitude              = request.data.get("latitude")
        user_data.longitude             = request.data.get("longitude")
        user_data.accuracy              = request.data.get("accuracy")
        user_data.distance_travelled    = 0
        user_data.flag                  = 0
 
        user_data.travel_charges        = 0
        user_data.sync_date_time        = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        user_data.save()
    start_data  = SpUserAttendance.objects.filter(start_time__isnull=False, attendance_date_time__icontains=today.strftime("%Y-%m-%d"), user_id=request.data.get("user_id")).count()
    end_data    = SpUserAttendance.objects.filter(end_time__isnull=False, attendance_date_time__icontains=today.strftime("%Y-%m-%d"), user_id=request.data.get("user_id")).count()
    if start_data == 0:
        attendance_status = 0
    elif int(start_data)!=int(end_data):
        attendance_status = 1
    else:
        attendance_status = 0
    context = {}
    context['attendance_status']        = attendance_status
    context['message']       = 'Tracking data saved successfully'
    context['response_code'] = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)
        

def send_email(subject, html_content, text_content=None, from_email=None, recipients=[], attachments=[], bcc=[], cc=[]):
    # send email to user with attachment
    if not from_email:
        from_email = settings.DEFAULT_FROM_EMAIL
    if not text_content:
        text_content = ''
    email = EmailMultiAlternatives(
        subject, text_content, from_email, recipients, bcc=bcc, cc=cc
    )
    email.attach_alternative(html_content, "text/html")
    for attachment in attachments:
        # Example: email.attach('design.png', img_data, 'image/png')
        email.attach(*attachment)
    email.send()

def get_rendered_html(template_name, context={}):
    html_content = render_to_string(template_name, context)
    return html_content

def send_mass_mail(data_list):
    for data in data_list:
        template = data.pop('template')
        context = data.pop('context')
        html_content = get_rendered_html(template, context)
        data.update({'html_content': html_content})
        send_email(**data)  


@csrf_exempt
@api_view(["POST"])
def updateUserLocation(request):
    
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("latitude")is None or request.data.get("latitude") == '':
        return Response({'message': 'Latitude field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("longitude")is None or request.data.get("longitude") == '':
        return Response({'message': 'Longitude field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)  


    user                = SpUsers.objects.get(id=request.data.get("user_id"))
    user.latitude       = request.data.get("latitude")
    user.longitude      = request.data.get("longitude")
    user.periphery      = '500'
    user.timing         = '6:00 AM'
    user.save()

    user_name   = request.user.first_name+' '+request.user.middle_name+' '+request.user.last_name
    heading     = 'Location has been updated'
    activity    = 'Location has been updated by '+user_name+' on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p') 
    
    saveActivity('Location', 'Location updated', heading, activity, request.user.id, user_name, 'UserCredentialChange.png', '2', 'app.png')

    context = {}
    context['latitude']     = request.data.get("latitude")
    context['longitude']    = request.data.get("longitude")
    context['periphery']    = '500'
    context['timing']       = '6:00 AM'
    context['message']      = 'Location has been successfully updated'
    context['response_code'] = HTTP_200_OK
    
    return Response(context, status=HTTP_200_OK)

@csrf_exempt
@api_view(["POST"])
def logout(request):
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
        
    if request.data.get("user_id")!="62":
        AuthtokenToken.objects.filter(user_id=request.user.id).delete()
        # clear firebase token
        SpUsers.objects.filter(id=request.user.id).update(firebase_token=None)
        user = SpUsers.objects.get( id= request.data.get("user_id"))
        user.device_id = None
        user.firebase_token = None
        user.save()
    
    user_name   = request.user.first_name+' '+request.user.middle_name+' '+request.user.last_name
    heading     = user_name+' has been logout'
    activity    = user_name+' has been logout on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p') 
    
    saveActivity('Logout', 'Logout', heading, activity, request.user.id, user_name, 'add.png', '2', 'app.png')
    context = {}
    context['message'] = 'Logout successfully'
    context['response_code'] = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)



@csrf_exempt
@api_view(["POST"])
def userAttendance(request):
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("type")is None or request.data.get("type") == '':
        return Response({'message': 'Attendance type is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("attendance_date_time")is None or request.data.get("attendance_date_time") == '':
        return Response({'message': 'Attendance DateTime field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
     
    
    data = SpUserAttendance()
    data.user_id = request.data.get("user_id")
    data.attendance_date_time = request.data.get("attendance_date_time")
    now = datetime.now().strftime('%H:%M:%S')
    if request.data.get("type") == '1':
        data.start_time = now
        data.end_time = None
    else:
        data.start_time = None
        data.end_time = now
    
    if int(request.data.get("type")) == 1:
        data.dis_ss_id = request.data.get("user_id")

    if request.data.get("latitude") is None or request.data.get("latitude") == '':
        data.latitude = None
    else:
        data.latitude = request.data.get("latitude")
    
    if request.data.get("longitude") is None or request.data.get("longitude") == '':
        data.longitude = None
    else:
        data.longitude = request.data.get("longitude")
    
    data.attendance_type = 1
 
    if bool(request.FILES.get('attendance_image', False)) == True:
        uploaded_attendance_image = request.FILES['attendance_image']
        storage = FileSystemStorage()
        timestamp = int(time.time())
        attendance_image_name = uploaded_attendance_image.name
        temp = attendance_image_name.split('.')
        attendance_image_name = 'attendance'+str(timestamp)+"."+temp[(len(temp) - 1)]
        
        attendance_image = storage.save(attendance_image_name, uploaded_attendance_image)
        attendance_image = storage.url(attendance_image)
    
        data.attendance_img = attendance_image 
    if request.data.get("Eod"):
        data.Eod = request.data.get("Eod")
    else:
        data.Eod = None
    data.status = 1
    data.save()
    
    # save tracking

    if (request.data.get("latitude") is not None and request.data.get("latitude") != '') and (request.data.get("longitude") is not None and request.data.get("longitude") != ''):

        if TblClUserTracking.objects.filter(user_id=request.data.get("user_id")).exists():
            
            user_last_data = TblClUserTracking.objects.filter(user_id=request.data.get("user_id")).order_by('-id').first()
            
            R = 6373.0
            lat1 = radians(float(user_last_data.latitude))
            lon1 = radians(float(user_last_data.longitude))
            lat2 = radians(float(request.data.get("latitude")))
            lon2 = radians(float(request.data.get("longitude")))
            dlon = lon2 - lon1
            dlat = lat2 - lat1
            a = sin(dlat / 2)**2 + cos(lat1) * cos(lat2) * sin(dlon / 2)**2
            c = 2 * atan2(sqrt(a), sqrt(1 - a))
            distance = R * c
            meter_distance = float(distance * 1000)
            if meter_distance > 15 :
                user_data                       = SpUserTracking()
                user_data.user_id               = request.data.get("user_id")
                user_data.latitude              = request.data.get("latitude")
                user_data.longitude             = request.data.get("longitude")
                user_data.distance_travelled    = 0
                user_data.travel_charges        = getModelColumnById(Configuration, 1, 'travel_amount')
                user_data.save()
        else:
            user_data                       = SpUserTracking()
            user_data.user_id               = request.data.get("user_id")
            user_data.latitude              = request.data.get("latitude")
            user_data.longitude             = request.data.get("longitude")
            user_data.distance_travelled    = 0
            user_data.travel_charges        = getModelColumnById(Configuration, 1, 'travel_amount')
            user_data.save()
            
    user_name   = request.user.first_name+' '+request.user.middle_name+' '+request.user.last_name
    
    heading     = 'Attendance'
    if request.data.get("type") == '1':
        activity    = "Day started"
    else:
        activity    = "Day end" 
        
    saveActivity('User Attendance', 'User Attendance', heading, activity, request.user.id, user_name, 'markedAtten.png', '2', 'app.png')


    context = {}
    context['message'] = 'Attendance marked successfully'
    context['response_code'] = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)
       


@csrf_exempt
@api_view(["POST"])
def checkAttendances(request):
    today   = date.today()
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    context = {}
    if SpUserAttendance.objects.filter(attendance_date_time__icontains=today.strftime("%Y-%m-%d"), user_id=request.data.get("user_id")).exists():
        start_data      = SpUserAttendance.objects.filter(start_time__isnull=False,attendance_date_time__icontains=today.strftime("%Y-%m-%d"),user_id=request.data.get("user_id")).order_by('id').first()
        end_data        = SpUserAttendance.objects.filter(end_time__isnull=False,attendance_date_time__icontains=today.strftime("%Y-%m-%d"),user_id=request.data.get("user_id")).order_by('-id').first()
        user_attendance = SpUserAttendance.objects.filter(attendance_date_time__icontains=today.strftime("%Y-%m-%d"), user_id=request.data.get("user_id")).order_by('-id').first()
        if user_attendance.start_time is not None and user_attendance.end_time is None:
            context['status'] = 1
        elif user_attendance.start_time is None and user_attendance.end_time is not None:
            context['status'] = 0
        else:
            context['status'] = 0
        now = datetime.now().strftime('%Y-%m-%d')
        start_datetime = now + ' '+start_data.start_time
        if context['status'] == 0:
            end_datetime = now + ' '+end_data.end_time
        else:
            end_datetime = now = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        start_datetime = datetime.strptime(start_datetime, '%Y-%m-%d %H:%M:%S')
        end_datetime = datetime.strptime(end_datetime, '%Y-%m-%d %H:%M:%S')
        time_delta = (end_datetime - start_datetime)
        # total_seconds = time_delta.total_seconds()
        # hours = (total_seconds/60)/60
        time_delta = str(time_delta).split(':')
        time_delta = time_delta[0]+':'+time_delta[1]
        context['working_hours'] = str(time_delta) + ' hours'
    else:
        context['status'] = 0
        context['working_hours'] = ''
        
    if getModelColumnById(SpUsers, request.data.get("user_id"), 'periphery')is None or getModelColumnById(SpUsers, request.data.get("user_id"), 'periphery') == '':
        periphery = '500'
    else:
        periphery = getModelColumnById(SpUsers, request.data.get("user_id"), 'periphery')

   

    current_time = datetime.now().strftime("%H:%M:%S")
   

    working_shift_timing = TblClWorkingShifts.objects.filter(id=getModelColumnByColumnId(SpBasicDetails, 'user_id', request.data.get("user_id"), 'working_shift_id')).values('id','start_timing','end_timing').first()
    
    holidays = SpHolidays.objects.filter(start_date__month = date.today().strftime('%m'),start_date__year = date.today().strftime('%Y'))
    holiday_lists= []
    
    for holiday in holidays:
        holiday_list = getHoilydayDates(holiday.start_date,holiday.end_date)
        holiday_dict = {}
        current_date = date.today().strftime('%Y-%m-%d')
        if str(current_date) in holiday_list:
            holiday_dict['holiday_name'] = holiday.holiday
            holiday_lists.append(holiday_dict)
            
    week_of_day_list = getModelColumnByColumnId(SpBasicDetails,'user_id',request.data.get("user_id"),'week_of_day')
    week_of_day_list  = week_of_day_list.split(',')
    
    context['periphery']     = periphery
    context['week_of_day_list']     = week_of_day_list
    context['holiday_lists'] = holiday_lists
    context['geofence']      = getModelColumnByColumnId(SpBasicDetails, "user_id", request.data.get("user_id"), "geofencing")
    context['timing']        = working_shift_timing  
    context['response_code'] = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)



@api_view(['POST'])
def getDashboardData(request):
    if request.method == 'POST':
        if request.data.get("user_id") is None or request.data.get("user_id") == '':
            return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 

        _user_id = request.data.get('user_id')
        _current_date = date.today()

        total_present       = 0
        total_leaves        = 0
        total_absent        = 0
        # activity_type_name  = ''
        # distributor_name    = ''
        # beat_name           = ''
        start_time          = ''
        end_time            = ''
        hours_worked        = ''
        total_retail_time   = datetime.strptime('00:00:00', '%H:%M:%S')
        monthly_retail_time = datetime.strptime('00:00:00', '%H:%M:%S')

        # try:
        total_present       = SpUserAttendance.objects.filter(start_time__isnull=False, user_id = _user_id).filter(attendance_date_time__month = _current_date.month).filter(attendance_date_time__year = _current_date.year).count()
        
    
        new_outlets         = SpUsers.objects.filter(created_by = _user_id,created_at__contains = _current_date)
        
        monthly_outlets     = SpUsers.objects.filter(created_by = _user_id, created_at__month = _current_date.month, created_at__year = _current_date.year)
       
        on_leave            = 0

        all_month_date = days_cur_month(_current_date.day, _current_date.month, _current_date.year)

        now_leaves_list             = []
        total_leaves_list           = []
        total_no_of_weekoff_list    = []
        total_days = []
        for i in range(len(all_month_date)):
            total_leaves  = get_user_month_leave_count(_user_id, all_month_date[i])
            if i<int(_current_date.strftime("%d")):
                total_days.append(1)
                total_no_of_weekoff = get_total_no_of_weekoff(_user_id, all_month_date[i])
                total_no_of_weekoff_list.append(total_no_of_weekoff)
                now_leaves_list.append(total_leaves)
                
            total_leaves_list.append(total_leaves)

        total_no_of_weekoff = sum(total_no_of_weekoff_list)     
        total_leaves        = sum(total_leaves_list)
        now_total_leaves    = sum(now_leaves_list)
        
        leave_date_day      = datetime.strptime(str(_current_date.strftime("%Y-%m-%d")), '%Y-%m-%d').strftime('%A')
        user_week_off_day   = SpBasicDetails.objects.filter(user_id=_user_id).values('week_of_day').first()

        if get_user_leave(_user_id,_current_date.strftime("%Y-%m-%d")):
            on_leave = 2
        elif str(user_week_off_day['week_of_day']) == str(leave_date_day): 
            on_leave = 1
        else:
            on_leave = 0    

        today_attendance   = SpUserAttendance.objects.filter(start_time__isnull=False,user_id = _user_id).filter(attendance_date_time__icontains=_current_date.strftime("%Y-%m-%d")).count()
        total_absent = (int(sum(total_days))-int(total_no_of_weekoff))-float(now_total_leaves)
        
        if int(today_attendance) == 0:
            total_absent = (float(total_absent)-int(total_present))-1
        else:
            total_absent = float(total_absent)-int(total_present)
        working_hours = SpUserAttendance.objects.filter(user_id = _user_id).filter(attendance_date_time__contains = _current_date)

        for each_time in working_hours:
            if each_time.start_time is None or each_time.start_time == '':
                pass
            else:
                start_time  = each_time.start_time
            if each_time.end_time == '' or each_time.end_time is None:
                pass
            else:
                end_time    = each_time.end_time
            
        if end_time == '' or end_time is None or start_time == '' or start_time is None:
            hours_worked = ''
        else:
            hours_worked = str(datetime.strptime(end_time, '%H:%M:%S') - datetime.strptime(start_time, '%H:%M:%S'))

        
        last_seven_date_from_current = _current_date - timedelta(days=6)
        graph_data=[]

       
        
        if getModelColumnById(SpUsers, request.data.get("user_id"), 'periphery')is None or getModelColumnById(SpUsers, request.data.get("user_id"), 'periphery') == '':
            periphery = '500'
        else:
            periphery = getModelColumnById(SpUsers, request.data.get("user_id"), 'periphery')
    
       
                
                
                
        holidays = SpHolidays.objects.filter(start_date__month = date.today().strftime('%m'),start_date__year = date.today().strftime('%Y'))
        holiday_lists= []
        
        for holiday in holidays:
            holiday_list = getHoilydayDates(holiday.start_date,holiday.end_date)
            holiday_dict = {}
            current_date = date.today().strftime('%Y-%m-%d')
            applicable_to = holiday.applicable_to.split(',')
            role_id = getModelColumnById(SpUsers, request.data.get("user_id"), 'role_id')
            if str(current_date) in holiday_list and str(role_id) in applicable_to:
                holiday_dict['holiday_name'] = holiday.holiday
                holiday_lists.append(holiday_dict)
                
                
        week_of_day_list = getModelColumnByColumnId(SpBasicDetails,'user_id',request.data.get("user_id"),'week_of_day')
        week_of_day_list  = week_of_day_list.split(',')
        
        
        if holiday_lists:
            is_holiday = 1
            
        else:
            is_holiday = 0
            
            
        if date.today().strftime('%A') in week_of_day_list:
            is_week_of = 1
            
        else:
            is_week_of = 0
        
        
        
        
        
        
        
        total_presentss   = 0
        total_leave     = 0
        total_absent    = 0
        
        total_week_of    = 0
        total_holiday    = 0
        
        user_id = request.data.get('user_id')
        current_date  = datetime.today()
        all_month_date  = days_cur_month(current_date.day, current_date.month, current_date.year)

        user_week_off_day   = SpBasicDetails.objects.filter(user_id=user_id).first()
        user_week_off_day = user_week_off_day.week_of_day.split(',')

        role_id = getModelColumnById(SpUsers,user_id,'role_id')
        
        for i in range(len(all_month_date)):
            attendance_dict = {}
            leave_date_day      = datetime.strptime(str(all_month_date[i]), '%Y-%m-%d').strftime('%A')
            total_presents   = SpUserAttendance.objects.filter(start_time__isnull=False, user_id=user_id).filter(attendance_date_time__icontains=all_month_date[i]).count()
            if total_presents > 0:
                attendance_dict['attendance'] = 1  
                total_presentss+=1
            elif checkHoliday(all_month_date[i],role_id):
                total_holiday+=1
            elif str(leave_date_day) in user_week_off_day: 
                total_week_of+=1
            elif get_user_leave(user_id,all_month_date[i]) :
                total_leave+=1
            else:
                total_presents   = SpUserAttendance.objects.filter(start_time__isnull=False, user_id=user_id).filter(attendance_date_time__icontains=all_month_date[i]).count()
                if total_presents > 0 and isHalfDay(user_id, all_month_date[i]) == True:
                    pass
                elif total_presents > 0:
                    pass
                else:
                    if checkDateIsFutureDate(all_month_date[i]):
                        if isHalfDay(user_id, all_month_date[i]):
                            pass
                        else:
                            pass 
                    else:
                        if isHalfDay(user_id, all_month_date[i]):    
                            pass
                        else:
                            total_absent+=1
                            
                   
        context = {}
        context['is_holiday']       = is_holiday
        context['is_week_of']       = is_week_of
        
        context['periphery']        = periphery
        # context['timing']           = timing 
        # context['check_in_periphery']  = getModelColumnById(Configuration, 1, 'check_in_periphery')
        context['graph_data']       = graph_data
        context['total_present']    = total_presentss
        context['total_leave']      = total_leave
        context['total_absent']     = total_absent
        context['start_time']       = start_time
        context['end_time']         = end_time
        context['working_hours']    = hours_worked
        context['on_leave']         = on_leave
      
        context['new_calls']        = len(new_outlets)
        context['monthly_new_calls']= len(monthly_outlets)
        context['avg_new_calls']    = round(len(monthly_outlets)/len(all_month_date), 2)

       

        context['total_retail_time']  = total_retail_time
        context['montly_retail_time'] = monthly_retail_time
        context['attendance_type']    = SpUsers.objects.filter(id=request.data.get("user_id")).values_list('attendence_mode',flat=True).first()
        context['regularization_list']  = SpRegularization.objects.filter().values('id','regularization_type').order_by('regularization_type')
        context['reasons_list']     = SpReasons.objects.filter(status = 1).values('id','reason').order_by('reason')
        context['message']          = "Dashboard Data attained successfully"
        context['status']           = HTTP_200_OK

        return Response(context)
        




def checkHoliday(date,role_id):
    if SpHolidays.objects.filter(start_date__month = datetime.strptime(str(date), '%Y-%m-%d').strftime('%m'),start_date__year = datetime.strptime(str(date), '%Y-%m-%d').strftime('%Y'),holiday_status=3,status = 1).exists():
        holiday_id = SpHolidays.objects.filter(start_date__month = datetime.strptime(str(date), '%Y-%m-%d').strftime('%m'),start_date__year = datetime.strptime(str(date), '%Y-%m-%d').strftime('%Y'),holiday_status=3,status = 1).values_list('id',flat=True)
        holiday_ids = SpRoleEntityMapping.objects.filter(role_id = role_id,entity_type = 'holiday',entity_id__in = holiday_id).values_list('entity_id',flat=True)
        count = 0
        holiday_name_list = []
        for holiday_id in holiday_ids:
            last_date = getModelColumnById(SpHolidays,holiday_id,'end_date')
            last_date = last_date.strftime('%Y-%m-%d')
            last_date = datetime.strptime(str(last_date), '%Y-%m-%d')
            from_date = datetime.strptime(str(date), '%Y-%m-%d')#.strftime('%Y-%m-%d')
            delta = last_date - from_date
            start_date = getModelColumnById(SpHolidays,holiday_id,'start_date')
            start_date = start_date.strftime('%Y-%m-%d')
            start_date = datetime.strptime(str(start_date), '%Y-%m-%d')
            current_date = datetime.strptime(str(date), '%Y-%m-%d')
            if current_date>=start_date:
                if delta.days >= 0:
                    count+=1
                    holiday_name_list.append(getModelColumnById(SpHolidays,holiday_id,'holiday'))
        if count > 0:
            holi_list = []
            for x in holiday_name_list:
                if x not in holi_list:
                    holi_list.append(x)
            return holi_list
        else:
            return False 
    else:
        return False 
        
        
        

@csrf_exempt
@api_view(['POST'])
def getAttendanceData(request):
    if request.method == 'POST':
        if request.data.get("user_id")is None or request.data.get("user_id") == '':
            return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
        if request.data.get("current_date")is None or request.data.get("current_date") == '':
            return Response({'message': 'Date field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
        
        LEAVE_FLAG      = 0
        PRESENT_FLAG    = 1
        FUTURE_FLAG     = 2
        WEEK_OFF_FLAG   = 3
        ABSENT_FLAG     = 4
        
        today           = date.today()
        attendance_list = []
        
        total_presentss   = 0
        total_leave     = 0
        total_absent    = 0
        
        total_week_of    = 0
        total_holiday    = 0
        
        total_travelled = 0
        today_travelled = 0
        user_id         = request.data.get('user_id')
        current_date    = datetime.strptime(request.data.get('current_date'), "%Y-%m-%d")
        total_present   = SpUserAttendance.objects.filter(start_time__isnull=False, user_id=user_id).filter(attendance_date_time__month=current_date.month).filter(attendance_date_time__year=current_date.year).count()
        
        all_month_date  = days_cur_month(current_date.day, current_date.month, current_date.year)

        
        user_week_off_day   = SpBasicDetails.objects.filter(user_id=user_id).first()
        user_week_off_day = user_week_off_day.week_of_day.split(',')

        now_leaves_list             = []
        total_leaves_list           = []
        total_no_of_weekoff_list    = []
        total_days                  = []
        total_distance_travel       = []
        
        role_id = getModelColumnById(SpUsers,user_id,'role_id')
        
        for i in range(len(all_month_date)):
            attendance_dict = {}
            leave_date_day      = datetime.strptime(str(all_month_date[i]), '%Y-%m-%d').strftime('%A')
            total_presents   = SpUserAttendance.objects.filter(start_time__isnull=False, user_id=user_id).filter(attendance_date_time__icontains=all_month_date[i]).count()
            if total_presents > 0:
                attendance_dict['attendance'] = 1  
                total_presentss+=1
            elif checkHoliday(all_month_date[i],role_id):
                attendance_dict['attendance'] = 7
                attendance_dict['holiday_list'] = checkHoliday(all_month_date[i],role_id)
                total_holiday+=1
            elif str(leave_date_day) in user_week_off_day: 
                attendance_dict['attendance'] = 3
                
                total_week_of+=1
            elif get_user_leave(user_id,all_month_date[i]) :
                attendance_dict['attendance'] = 0
                total_leave+=1
            else:
                total_presents   = SpUserAttendance.objects.filter(start_time__isnull=False, user_id=user_id).filter(attendance_date_time__icontains=all_month_date[i]).count()
                if total_presents > 0 and isHalfDay(user_id, all_month_date[i]) == True:
                    attendance_dict['attendance'] = 6
                elif total_presents > 0:
                    # attendance_dict['attendance'] = 1  
                    # total_presentss+=1
                    pass
                else:
                    if checkDateIsFutureDate(all_month_date[i]):
                        if isHalfDay(user_id, all_month_date[i]):
                            attendance_dict['attendance'] = 5
                        else:
                            attendance_dict['attendance'] = 2   
                    else:
                        if isHalfDay(user_id, all_month_date[i]):    
                            attendance_dict['attendance'] = 5
                        else:
                            attendance_dict['attendance'] = 4  
                            total_absent+=1
            
            
            attendance_dict['date']                 = all_month_date[i]
            attendance_data = getAttendanceStartEndTime(user_id, all_month_date[i])
            if attendance_data['starting_time']:
                # attendance_dict['distance_travelled']   = getUserTravelData(user_id, all_month_date[i])
                attendance_dict['starting_time']        = attendance_data['starting_time']
                attendance_dict['ending_time']          = attendance_data['ending_time']
                attendance_dict['working_hours']        = attendance_data['working_hours']
                 
            attendance_list.append(attendance_dict)

            total_leaves  = get_user_month_leave_count(user_id, all_month_date[i])
            
            if (str(current_date.strftime("%m")) == str(today.strftime("%m"))) and (str(current_date.strftime("%Y")) == str(today.strftime("%Y"))):
                if i<int(today.strftime("%d")):
                    total_days.append(1)
                    now_leaves_list.append(total_leaves)
            else:
                total_days.append(1)
                now_leaves_list.append(total_leaves)

            if i<=int(today.strftime("%d")):                          
                total_no_of_weekoff = get_total_no_of_weekoff(user_id, all_month_date[i])    
                total_no_of_weekoff_list.append(total_no_of_weekoff)
            total_leaves_list.append(total_leaves)
        
        total_no_of_weekoff = sum(total_no_of_weekoff_list)     
        total_leave         = sum(total_leaves_list)
        now_total_leaves    = sum(now_leaves_list)
        
        today_attendance   = SpUserAttendance.objects.filter(start_time__isnull=False, user_id = user_id).filter(attendance_date_time__icontains=today.strftime("%Y-%m-%d")).count()
       
        context = {}
        
        
        context['total_present']    = total_presentss
        context['total_leave']      = total_leave
        context['total_absent']     = total_absent
        context['total_week_of']     = total_week_of
        context['total_holiday']     = total_holiday
        
        # context['today_travelled']  = getUserTravelData(user_id, today.strftime("%Y-%m-%d"))
        # context['total_travelled']  = round(sum(total_distance_travel),2)
        context['attendance']       = attendance_list
        context['message']          = "Attendance Data has been received successfully"
        context['status']           = HTTP_200_OK
        return Response(context)




def convert(seconds):
    seconds = seconds % (24 * 3600)
    hour = seconds // 3600
    seconds %= 3600
    minutes = seconds // 60
    seconds %= 60
      
    return "%d:%02d:%02d" % (hour, minutes, seconds)

def getAttendanceStartEndTime(user_id, month_date):
    start_data      = SpUserAttendance.objects.filter(start_time__isnull=False,attendance_date_time__icontains=month_date,user_id=user_id).order_by('id').first()
    end_data        = SpUserAttendance.objects.filter(end_time__isnull=False,attendance_date_time__icontains=month_date,user_id=user_id).order_by('-id').first()
    
    try:
        user_attendance = SpUserAttendance.objects.filter(attendance_date_time__icontains=month_date, user_id=user_id).order_by('-id').first()
    except SpUserAttendance.DoesNotExist:
        user_attendance = None

    start_datetime  = ''
    end_datetime    = ''
    working_hours   = ''
    if user_attendance:
        if user_attendance.start_time is not None and user_attendance.end_time is None:
            status = 1
        elif user_attendance.start_time is None and user_attendance.end_time is not None:
            status = 0
        else:
            status = 0
        now = datetime.now().strftime('%Y-%m-%d')
        start_datetime = now + ' '+start_data.start_time
        if status == 0:
            end_datetime = now + ' '+end_data.end_time

            start_datetime = datetime.strptime(start_datetime, '%Y-%m-%d %H:%M:%S')
            end_datetime = datetime.strptime(end_datetime, '%Y-%m-%d %H:%M:%S')
            time_delta = (end_datetime - start_datetime)
            total_seconds = time_delta.total_seconds()
            hours = convert(total_seconds)
            working_hours = str(hours)

            start_datetime = datetime.strptime(str(start_datetime), '%Y-%m-%d %H:%M:%S').strftime('%H:%M:%S')
            end_datetime   = datetime.strptime(str(end_datetime), '%Y-%m-%d %H:%M:%S').strftime('%H:%M:%S')
        else:
            end_datetime = ''
            start_datetime = datetime.strptime(str(start_datetime), '%Y-%m-%d %H:%M:%S').strftime('%H:%M:%S')

    attendance_timing = {}
    attendance_timing['starting_time']  = start_datetime
    attendance_timing['ending_time']    = end_datetime
    attendance_timing['working_hours']  = working_hours

    return attendance_timing  

@csrf_exempt
@api_view(["POST"])
def userLocationLog(request):
    if request.data.get("user_id") is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("status") is None or request.data.get("status") == '':
        return Response({'message': 'Status field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("date_time") is None or request.data.get("status") == '':
        return Response({'message': 'Date Time field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    user_id = request.data.get("user_id")
    status = request.data.get("status")
    today = datetime.now()
    try:
        email = SpUsers.objects.get(id=user_id)
    except SpUsers.DoesNotExist:
        email = None
    try:
        user_tracking = SpUserTracking.objects.filter(
            user_id=user_id).order_by('-id').count()
        if user_tracking > 1:
            user_tracking = SpUserTracking.objects.filter(
                user_id=user_id).order_by('-id')[1]
        else:
            user_tracking = SpUserTracking.objects.filter(
                user_id=user_id).order_by('-id')[0]
    except SpUserTracking.DoesNotExist:
        user_tracking = None
    if status == '1':
        pre_date_time = datetime.strptime(
            request.data.get("date_time"), '%Y-%m-%d %H:%M:%S')
        if email.official_email:
            user_email = email.official_email
            user_name = email.first_name
            location_log = SpUserLocationLogs.objects.filter(
                user_id=user_id, created_at__icontains=today.strftime("%Y-%m-%d"), status=1).last()
            if location_log:
                diff = today - location_log.created_at
                diff_minutes = (diff.days * 24 * 60) + (diff.seconds/60)
            else:
                diff_minutes = 3
            if user_tracking:
                latitude = user_tracking.latitude
                longitude = user_tracking.longitude
                last_loc_date = user_tracking.created_at
            date_time = datetime.now()
            message = {
                'subject': f'Employee App Notification - App not reachable ({user_name})',
                'text_content': 'Here is the message',
                'from_email'    : 'balineemilk@outlook.com',
                'recipients'    : ['mohdsubhani33143@gmail.com'
 
                              ],
                'template': "email-templates/user-notification.html",
                'context': {
                    "user_name":   user_name,
                    "date_time":   date_time,
                    "pre_date_time":   pre_date_time,
                    "latitude":   latitude,
                    "longitude":   longitude,
                    "last_loc_date":   last_loc_date,
                    "status":   1,
                }
            }

            user_message = {
                'subject': 'Employee App Notification - App not reachable',
                'text_content': 'Here is the message',
                'from_email': 'balineemilk@outlook.com',
                'recipients': [user_email],
                'template': "email-templates/users-notification.html",
                'context': {
                    "user_name":   user_name,
                    "date_time":   date_time,
                    "pre_date_time":   pre_date_time,
                    "status":   1,
                }
            }
        else:
            return Response({'message': 'E-mail Id Not Exist', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        if diff_minutes > 2:
            send_mass_mail([message])
            send_mass_mail([user_message])
            user_location_log = SpUserLocationLogs()
            user_location_log.user_id = user_id
            user_location_log.particular = 'Internet data is off'
            user_location_log.status = 1
            user_location_log.save()
    else:
        if email.official_email:
            location_log = SpUserLocationLogs.objects.filter(
                user_id=user_id, created_at__icontains=today.strftime("%Y-%m-%d"), status=0).last()
            if location_log:
                diff = today - location_log.created_at
                diff_minutes = (diff.days * 24 * 60) + (diff.seconds/60)
            else:
                diff_minutes = 3
            user_email = email.official_email
            user_name = email.first_name
            if user_tracking:
                latitude = user_tracking.latitude
                longitude = user_tracking.longitude
            date_time = datetime.now()
            message = {
                'subject': f'Employee App Notification - GPS Off ({user_name})',
                'text_content': '',
                'from_email'    : 'balineemilk@outlook.com',
                'recipients'    : ['mohdsubhani33143@gmail.com'
                              ],
                'template': "email-templates/user-notification.html",
                'context': {
                    "user_name":   user_name,
                    "date_time":   date_time,
                    "latitude":   latitude,
                    "longitude":   longitude,
                    "status":   0,
                }
            }

            user_message = {
                'subject': 'Employee App Notification - GPS Off',
                'text_content': '',
                'from_email': 'balineemilk@outlook.com',
                'recipients': [user_email],
                'template': "email-templates/users-notification.html",
                'context': {"user_name":   user_name,
                            "date_time":   date_time,
                            "status":   0,
                            }
            }

        else:
            return Response({'message': 'E-mail Id Not Exist', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
     
        if diff_minutes > 2:
            # send_mass_mail([user_message])
            send_mass_mail([message])
            user_location_log = SpUserLocationLogs()
            user_location_log.user_id = user_id
            user_location_log.particular = 'GPS Location is off'
            user_location_log.status = 0
            user_location_log.save()
    context = {}
    context['response_code'] = HTTP_200_OK
    context['message'] = 'Success'
    return Response(context, status=HTTP_200_OK)






@csrf_exempt
@api_view(["POST"])
def saveUserRegularizationData(request):
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("to_date"):
        is_exists = checkRegularizationAppliedOrNot(request.data.get("user_id"), request.data.get("from_date"), request.data.get("to_date"))
        isLeaveAppliedOrNot  = checkLeaveAppliedOrNot(request.data.get("user_id"), request.data.get("from_date"), request.data.get("to_date"))
    else:
        is_exists = checkRegularizationAppliedOrNot(request.data.get("user_id"), request.data.get("from_date"), request.data.get("from_date"))
        isLeaveAppliedOrNot  = checkLeaveAppliedOrNot(request.data.get("user_id"), request.data.get("from_date"), request.data.get("from_date"))
    
    if is_exists['status'] == True:
        return Response({'message': 'You have already request on selected dates, kindly select another date', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if isLeaveAppliedOrNot['status'] == True:
        return Response({'message': 'You have already marked leave on selected dates, kindly select another date', 'response_code':HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    else:    
        user                                = SpUserRegularization()
        user.user_id                        = request.data.get("user_id") 
        user.user_name                      = getUserName(request.data.get("user_id"))  
        user.regularization_type_id         = request.data.get("regularization_type_id")
        user.regularization_type_name       = getModelColumnById(SpRegularization, request.data.get("regularization_type_id"), 'regularization_type')
        user.from_date                      = request.data.get("from_date")
        user.from_time                      = request.data.get("from_time")
        user.to_date                        = request.data.get("to_date")
        user.to_time                        = request.data.get("to_time")
        user.mobile_no                      = request.data.get("mobile_no")
        user.place                          = request.data.get("place")
        user.reason_for_leave               = request.data.get("reason_for_leave")
        user.manager                        = request.data.get("manager")
        user.hod                            = request.data.get("hod")
        user.save()

        user_name   = getUserName(request.user.id)
        heading     = 'Regularization request has been generated'
        activity    = 'Regularization request has been generated by '+user_name+' on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p') 
        
        saveActivity('Regularization', 'Regularization request', heading, activity, request.user.id, user_name, 'UserCredentialChange.png', '2', 'app.png')
        sendRegularizationNotificationToUsers(user.id,'', 'add', 0, request.user.id, user_name, 'SpUserRegularization',request.user.role_id)
        
        context = {}
        context['message']      = 'Data has been successfully saved'
        context['response_code'] = HTTP_200_OK
        
        return Response(context, status=HTTP_200_OK)

@csrf_exempt
@api_view(["POST"])
def appliedRegularizations(request):
    if request.data.get("page_limit")is None or request.data.get("page_limit") == '':
        return Response({'message': 'Page limit is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)   
    page_limit  = int(request.data.get("page_limit"))*10
    offset      = int(page_limit)-10
    page_limit  = 10
    regularization_list_count = SpUserRegularization.objects.filter(user_id=request.data.get("user_id")).values('id').count()
        
    if regularization_list_count:
        regularization_list_count = math.ceil(round(regularization_list_count/10, 2))
        regularization_status     = SpUserRegularization.objects.filter(user_id=request.data.get("user_id")).order_by('-id').first()
        regularization_status     = regularization_status.regularization_status 
    else:
        regularization_list_count = 0 
        regularization_status     = 0
    regularization_list = SpUserRegularization.objects.filter(user_id=request.data.get("user_id")).values('id','user_id','user_name','regularization_type_id','regularization_type_name','from_date','to_date','mobile_no','place','reason_for_leave','regularization_status','from_time','to_time').order_by('-id')[offset:offset+page_limit]
  
 
    context = {}
    context['message']                      = 'Success'
    context['regularization_list']                   = list(regularization_list)
    context['regularization_list_count']    = regularization_list_count
    context['response_code']                = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)
        

@csrf_exempt
@api_view(["POST"])
def leaveForword(request):    
    if request.data.get("leave_id")is None or request.data.get("leave_id") == '':
        return Response({'message': 'Leave id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("leave_status")is None or request.data.get("leave_status") == '':
        return Response({'message': 'Leave id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    
    try:
        leave  = SpUserLeaves.objects.get(id = request.data.get("leave_id"))
        leave.leave_status = request.data.get("leave_status")
        leave.save()
        user_id  = leave.user_id
        user_name   = request.user.first_name+' '+request.user.middle_name+' '+request.user.last_name
        userFirebaseToken = getModelColumnById(SpUsers,user_id,'firebase_token')
        employee_name = getUserName(user_id)

        
        if request.data.get("leave_status") == '2':
            message_title = "Leave Request has been accepted"
            message_body = 'Leave Request has been accepted by '+user_name+' on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p') 
        else:
            message_title = "Leave Request has been declined"
            message_body = 'Leave Request has been declined by '+user_name+' on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p')
        notification_image = ""
        if request.data.get("leave_status") == '2':
                msg = 'Handover request has been accepted'
        else:
            msg = 'Handover request has been declined'
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
        saveNotification(leave.id,'SpUserLeaves','Users Management',msg,message_title,message_body,notification_image,request.user.id,user_name,user_id,employee_name,'profile.png',2,'app.png',1,1)
        #-----------------------------save notification block----------------------------#
    except SpUserLeaves.DoesNotExist:
        leave  = None
    context = {}
    if leave:
        if request.data.get("leave_status") == '2':
            context['message']                  = 'Handover request has been accepted'
        else:
            context['message']                  = 'Handover request has been declined'
    else:
         context['message']                  = 'Leave Request has been failed'
    return Response(context, status=HTTP_200_OK) 



@csrf_exempt
@api_view(["POST"])       
def uploadPendingUserLeaveDocument(request):
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("user_leave_id")is None or request.data.get("user_leave_id") == '':
        return Response({'message': 'User Leave Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("document")is None or request.data.get("document") == '':
        return Response({'message': 'Document field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("document_id")is None or request.data.get("document") == '':
        return Response({'message': 'document id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    
    document_id  = request.data.get('document_id')
    document_id = document_id.split(',')
    
    if bool(request.FILES.get('document', False)) == True:
        for i,document in enumerate(request.FILES.getlist('document')):
            # uploaded_attachment = request.FILES['attachment']
            
            storage = FileSystemStorage()
            timestamp = int(time.time())
            attachment_name = document.name
            temp = attachment_name.split('.')
            attachment_name = 'leave-document/leave_attachment_'+str(timestamp)+"."+temp[(len(temp) - 1)]
            
            attachment = storage.save(attachment_name, document)
            attachment = storage.url(attachment)  
            
            doc = SpUserLeaveDocument()  
            doc.user_id = request.data.get("user_id")
            doc.user_leave_id = request.data.get("user_leave_id")
            doc.leave_type_document_id = document_id[i]
            doc.document = attachment
            doc.save()
    context = {}
    context['message']              = 'Document has been uploaded successfully'
    context['response_code']        = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)
        


def sendRegularizationNotificationToUsers(row_id, row_code, permission_slug, sub_module_id, user_id, user_name, model_name, role_id):
    user_wf_level = SpRoleWorkflowPermissions.objects.filter(permission_slug=permission_slug, sub_module_id=sub_module_id, role_id=role_id).values('level_id').distinct().count()
    user_role_wf_permission = SpUserRoleWorkflowPermissions.objects.filter(permission_slug=permission_slug, sub_module_id=sub_module_id, user_id=user_id, status=1).exclude(level_id=1).order_by('level_id')
    
    for wf_permission in user_role_wf_permission:
        user_details = SpUsers.objects.filter(status=1, role_id=wf_permission.workflow_level_role_id)
        if user_wf_level != 1:
            for user_detail in user_details:
                data                    = SpApprovalStatus()
                data.row_id             = row_id
                data.model_name         = model_name
                data.initiated_by_id    = user_id
                data.initiated_by_name  = user_name
                data.user_id            = user_detail.id
                if user_detail.middle_name:
                    data.user_name          = user_detail.first_name+' '+user_detail.middle_name+' '+user_detail.last_name
                else:
                    data.user_name          = user_detail.first_name+' '+user_detail.last_name
                data.role_id            = wf_permission.workflow_level_role_id
                data.sub_module_id      = wf_permission.sub_module_id
                data.permission_id      = wf_permission.permission_id
                data.permission_slug    = wf_permission.permission_slug
                data.level_id           = wf_permission.level_id
                data.level              = wf_permission.level
                data.status             = 0
                data.save()
  
    if user_wf_level == 1:
        model                 = SpUserRegularization.objects.get(id=row_id)   
        model.regularization_status   = 1
        model.save()
    else:
        model                 = SpUserRegularization.objects.get(id=row_id)   
        model.regularization_status   = 1
        model.save()





def saveAttendanceData(id):
    regularizations = SpUserRegularization.objects.get(id=id)
    if regularizations.from_date and regularizations.to_date:
        no_of_days = days_between(str(regularizations.from_date), str(regularizations.to_date))
    else:
        no_of_days = days_between(str(regularizations.from_date), str(regularizations.from_date))  

    for i in range(0, int(no_of_days)):
        start_date      = (datetime.strptime(str(regularizations.from_date), '%Y-%m-%d')+timedelta(days=i)).strftime('%Y-%m-%d')
        end_date        = (datetime.strptime(str(regularizations.from_date), '%Y-%m-%d')+timedelta(days=i)).strftime('%Y-%m-%d')
        start_date_day  = datetime.strptime(str(start_date), '%Y-%m-%d').strftime('%A')
        if start_date_day != 'Sunday':
            if regularizations.regularization_type_id == 1:
                start_date_time = str(start_date)+' '+str(getConfigurationResult('office_start_time'))
                end_date_time   = str(end_date)+' '+str(getConfigurationResult('office_end_time'))
                #start time
                data                        = SpUserAttendance()
                data.user_id                = regularizations.user_id
                data.attendance_date_time   = start_date_time
                data.start_time             = getConfigurationResult('office_start_time')
                data.end_time               = None
                data.dis_ss_id              = regularizations.user_id
                data.latitude               = None
                data.longitude              = None
                
                data.attendance_type        = 1
                data.status                 = 1
                data.save()

                #end time
                data                        = SpUserAttendance()
                data.user_id                = regularizations.user_id
                data.attendance_date_time   = end_date_time
                data.end_time               = getConfigurationResult('office_end_time')
                data.start_time               = None
                data.dis_ss_id              = regularizations.user_id
                data.latitude               = None
                data.longitude              = None
                
                data.attendance_type    = 1
                data.status             = 1
                data.save()
            else:
                start_time = str(regularizations.from_time)+':00'
                start_date_time = str(start_date)+' '+str(start_time)
                #start time
                data                        = SpUserAttendance()
                data.user_id                = regularizations.user_id
                data.attendance_date_time   = start_date_time
                data.start_time             = start_time
                data.end_time               = None
                data.dis_ss_id              = regularizations.user_id
                data.latitude               = None
                data.longitude              = None
                
                data.attendance_type    = 1
                data.status             = 1
                data.save()
         
    return True  



def date_diff_in_seconds(dt2, dt1):
  timedelta = dt2 - dt1
  return timedelta.days * 24 * 3600 + timedelta.seconds

def dhms_from_seconds(seconds):
	minutes, seconds = divmod(seconds, 60)
	hours, minutes = divmod(minutes, 60)
	days, hours = divmod(hours, 24)
    #return (hours, minutes, seconds)
	return (hours)

#user day out
@api_view(["GET"])
@permission_classes((AllowAny,))
def userDayOut(request):
    today   = date.today()
    context = {}
    
    user_attendance = SpUserAttendance.objects.filter(attendance_date_time__icontains=today.strftime("%Y-%m-%d")).order_by('user_id').values('user_id').distinct()
    for attendance in user_attendance:
        user_attendance = SpUserAttendance.objects.filter(attendance_date_time__icontains=today.strftime("%Y-%m-%d"), user_id=attendance['user_id']).order_by('-id').first()
        if user_attendance.start_time is not None and user_attendance.end_time is None:
            start_time      = user_attendance.created_at
            start_time      = datetime.strptime(str(start_time), '%Y-%m-%d %H:%M:%S')
            end_time        = datetime.now()
            
            second = date_diff_in_seconds(end_time,start_time)
            diff   = dhms_from_seconds(second)
            if diff >= 8.5:
                now  = datetime.now().strftime('%H:%M:%S')
                data                        = SpUserAttendance()
                data.user_id                = attendance['user_id']
                data.attendance_date_time   = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                data.start_time             = None
                data.end_time               = now
                data.dis_ss_id              = None
                data.attendance_type        = 2
                data.latitude               = None
                data.longitude              = None
                data.status                 = 1
                data.save()

                AuthtokenToken.objects.filter(user_id=attendance['user_id']).delete()

    context['response_code']    = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)



@api_view(["GET"])
@permission_classes((AllowAny,))
def mappLeavePolicyToLeaveLedegr(request):
    users = SpUsers.objects.filter(status = 1,user_type = 1)
    for user in users:
        mapUserLeaves(user.role_id,user.id)
    context = {}
    context['message']    = 'Leave ledger update successfully'
    context['response_code']    = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)

def mapUserLeaves(role_id,user_id):
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
            current_month = datetime.today().strftime('%m')
            if int(current_month) == 1:
                month_leave_count = policy_detail.year_leave_count / 12
                leave_polcy_ledger.year_leave_count = policy_detail.year_leave_count
                leave_polcy_ledger.month_leave_count = round(month_leave_count,1)
            else:   
                current_month = 12 - int(current_month)
                sub_leave_count = policy_detail.year_leave_count / 12
                year_leave_count = sub_leave_count*current_month
                month_leave_count = year_leave_count  / current_month
                leave_polcy_ledger.year_leave_count = year_leave_count
                leave_polcy_ledger.month_leave_count = round(month_leave_count,1)
                
            #year_leave_count = policy_detail.year_leave_count
            #leave_polcy_ledger.consecutive_leave = policy_detail.consecutive_leave 
            #leave_polcy_ledger.credit = round(year_leave_count,1)
            year_leave_counts = policy_detail.year_leave_count
            leave_polcy_ledgers = round(year_leave_counts,1)
            leave_polcy_ledger.year_leave_count=leave_polcy_ledgers
           
            leave_polcy_ledger.consecutive_leave = policy_detail.consecutive_leave 
            leave_polcy_ledger.credit = year_leave_count 
            last = SpUserLeavePolicyLedger.objects.filter(user_id = user_id).last()
           
            if last:
                if last.balance:
                    balance = float(year_leave_count) + float(last.balance)
                else:
                    balance = year_leave_count
            else:
                balance = year_leave_count

            leave_polcy_ledger.balance = round(balance,1)
            leave_polcy_ledger.save()


 
@csrf_exempt
@api_view(["POST"])  
def attendanceCount(request):
    context = {}
    today   = date.today()
    staffs = SpUsers.objects.raw('''SELECT DISTINCT sp_users.id, sp_users.* FROM sp_users LEFT JOIN sp_user_attendance on
    sp_user_attendance.user_id = sp_users.id WHERE sp_users.status = 1 AND sp_users.role_id !=0 AND sp_users.role_id !=1 AND sp_users.user_type = 1
    ORDER BY sp_users.id DESC ''')
   
    present_count = 0
    absent_count = 0
    week_off_count = 0
    for staff in staffs:
        if request.data.get('date'):
            today_date                = datetime.strptime(str(request.data.get('date')), '%d/%m/%Y').strftime('%Y-%m-%d')
            if checkAttendance(today_date, staff.id):
                present_count = present_count +1
            elif checkLeave(today_date, staff.id):
                absent_count = absent_count +1
            elif checkWeekOfDay(today_date,staff.id):
                week_off_count = week_off_count + 1
            else:
                absent_count = absent_count +1
        else:
            if checkAttendance(today, staff.id):
                present_count = present_count +1
            elif checkLeave(today, staff.id):
                absent_count = absent_count +1
            elif checkWeekOfDay(today,staff.id):
                week_off_count = week_off_count + 1
            else:
                absent_count = absent_count +1
       
    
    context['total_employee'] = SpUsers.objects.filter(status = 1, user_type= 1).exclude(role_id = 1).exclude(role_id=  0).count()
    context['present_count'] = present_count
    context['absent_count'] = absent_count
    context['week_off_count'] = week_off_count
    context['message']       = 'success'
    context['response_code'] = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)   
 
    
       
@csrf_exempt
@api_view(["POST"])  
def attendanceDetails(request):
    context = {}
    today   = date.today()
    if request.data.get("type") is None or request.data.get("type") == '':
        return Response({'message': 'Type field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
        
    if request.data.get("date") is None or request.data.get("date") == '':
        return Response({'message': 'Date field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
        
    if request.data.get("page_limit") is None or request.data.get("page_limit") == '':
        return Response({'message': 'Page Limit field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 

    page_limit  = int(request.data.get("page_limit"))*10
    offset      = int(page_limit)-10
    page_limit  = 10
    
    staffs = SpUsers.objects.raw('''SELECT DISTINCT sp_users.id, sp_users.* FROM sp_users LEFT JOIN sp_user_attendance on
    sp_user_attendance.user_id = sp_users.id WHERE sp_users.status = 1 AND sp_users.role_id !=0 AND sp_users.role_id !=1 AND sp_users.user_type = 1
    ORDER BY sp_users.id DESC ''')
    condition = ""
    if request.data.get("search"):
        condition += "CONCAT_WS( ' ',sp_users.first_name, sp_users.middle_name, sp_users.last_name ) like '%%" + str(request.data.get('search')) + "%%' "
        
        staffs = SpUsers.objects.raw('''SELECT DISTINCT sp_users.id, sp_users.* FROM sp_users LEFT JOIN sp_user_attendance on
        sp_user_attendance.user_id = sp_users.id WHERE sp_users.status = 1 AND sp_users.role_id !=0 AND sp_users.role_id !=1 AND sp_users.user_type = 1 and {condition}
        ORDER BY sp_users.id DESC '''.format(condition=condition))
        
    staff_details = []
    count = 0
    for staffs in staffs:
        staff = {}
        if request.data.get('type') == '0':
            count =count +1 
            staff['employee_code'] = getModelColumnById(SpUsers, staffs.id, 'emp_sap_id')
            staff['employee_name'] = getUserName(staffs.id)
            staff['department'] = getModelColumnById(SpUsers, staffs.id, 'department_name')
            staff['role'] = getModelColumnById(SpUsers, staffs.id, 'role_name')
            staff['profile_image'] = getModelColumnById(SpUsers, staffs.id, 'profile_image')
            staff_details.append(staff)
            
        if request.data.get('type') == '1':
            if request.data.get('date'):
               
                today_date                = datetime.strptime(str(request.data.get('date')), '%d/%m/%Y').strftime('%Y-%m-%d')
                
                if SpUserAttendance.objects.filter(user_id=staffs.id,attendance_date_time__contains=today_date).exists():
                    count =count +1 
                    staff['employee_code'] = getModelColumnById(SpUsers, staffs.id, 'emp_sap_id')
                    staff['employee_name'] = getUserName(staffs.id)
                    staff['department'] = getModelColumnById(SpUsers, staffs.id, 'department_name')
                    staff['role'] = getModelColumnById(SpUsers, staffs.id, 'role_name')
                    staff['profile_image'] = getModelColumnById(SpUsers, staffs.id, 'profile_image')
                    staff_details.append(staff)
           
        weekoff = 0       
        if request.data.get('type') == '2':
            if request.data.get('date'):
                today_date                = datetime.strptime(str(request.data.get('date')), '%d/%m/%Y').strftime('%Y-%m-%d')
                if checkWeekOfDay(today_date,staffs.id):
                    count =count +1 
                    weekoff = weekoff + 1
                    staff['employee_code'] = getModelColumnById(SpUsers, staffs.id, 'emp_sap_id')
                    staff['employee_name'] = getUserName(staffs.id)
                    staff['department'] = getModelColumnById(SpUsers, staffs.id, 'department_name')
                    staff['role'] = getModelColumnById(SpUsers, staffs.id, 'role_name')
                    staff['profile_image'] = getModelColumnById(SpUsers, staffs.id, 'profile_image')
                    staff_details.append(staff)
                    
        if request.data.get('type') == '3':
            if request.data.get('date'):
                today_date                = datetime.strptime(str(request.data.get('date')), '%d/%m/%Y').strftime('%Y-%m-%d')
                if SpUserAttendance.objects.filter(user_id=staffs.id,attendance_date_time__contains=today_date).exists():
                    pass
                elif checkWeekOfDay(today_date,staffs.id):
                    pass
                else:
                    count =count +1
                    staff['employee_code'] = getModelColumnById(SpUsers, staffs.id, 'emp_sap_id')
                    staff['employee_name'] = getUserName(staffs.id)
                    staff['department'] = getModelColumnById(SpUsers, staffs.id, 'department_name')
                    staff['role'] = getModelColumnById(SpUsers, staffs.id, 'role_name')
                    staff['profile_image'] = getModelColumnById(SpUsers, staffs.id, 'profile_image')
                    staff_details.append(staff)
    
       
    

    if len(staff_details)>0:
        staff_details_count = math.ceil(round(len(staff_details)/10, 2))
    else:
        staff_details_count = 0
    context['staff_details'] = staff_details[offset:offset+page_limit]
    context['staff_details_count'] = staff_details_count
    context['attendance_count'] =  count
    context['message']       = 'success'
    context['response_code'] = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)   
 

def checkWeekOfDay(date,user_id):
    user_week_of_day = getModelColumnByColumnId(SpBasicDetails,'user_id',user_id,'week_of_day')
    if user_week_of_day:
        user_week_of_day = user_week_of_day.split(',')
        week_day = datetime.strptime(str(date), '%Y-%m-%d').strftime('%A')
        if week_day in user_week_of_day:
            return True
        else:
            return False
#done
def checkLeave(date, user_id):
    try:
        leaves = SpUserLeaves.objects.filter(leave_from_date__lte=date, leave_to_date__gte=date,leave_status=3,user_id=user_id).first()
    except SpUserLeaves.DoesNotExist:
        leaves = None
    if leaves:
        return getModelColumnById(SpLeaveTypes, leaves.leave_type_id, 'alias')
    else:
        return False

#done
def checkAttendance(date,user_id):
    if SpUserAttendance.objects.filter(user_id=user_id,attendance_date_time__contains=date).exists():
        return True
    else:
        return False
    
def checkAbsent(date,user_id):
    if SpUserAttendance.objects.filter(user_id=user_id,attendance_date_time__contains=date).exists():
        return False
    else:
        return True
#done
@csrf_exempt
@api_view(["POST"])
def SavetaRequestDetails(request):
    # Check if required fields are present and not empty
    required_fields = ["user_id", "visit_place", "visit_from_date", "visit_to_date", "total_expenses", "company_paid"]
    
    for field in required_fields:
        if not request.data.get(field):
            return Response({'message': f'{field} field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    try:
        tadata = SpTaRequest()
        tadata.user_id         = int(request.data.get("user_id"))
        tadata.visit_place     = request.data.get("visit_place")
        tadata.visit_from_date = request.data.get("visit_from_date")
        tadata.visit_to_date   = request.data.get("visit_to_date")
        tadata.total_expenses  = float(request.data.get("total_expenses"))
        tadata.company_paid    = float(request.data.get('company_paid'))
        tadata.status          = 0
        tadata.balance         = request.data.get('balance')
        tadata.save()
        user_name            = getUserName(request.data.get('user_id'))
        ta_request_ids         = tadata.id
        
        attachment_list = []
        attachments             = request.FILES.getlist('Stay_details_bill_image')
        
        for id, Stay_details_bill_image in enumerate(attachments):
            folder                  ='media/grievance/attachments/' 
            storage                 = FileSystemStorage(location=folder)
            timestamp               = int(time.time())
            attachment_name         = Stay_details_bill_image.name
            temp                    = attachment_name.split('.')
            attachment_name         = 'attachment_'+str(timestamp)+"_"+str(id)+"."+temp[(len(temp) - 1)]
            uploaded_attachment     = storage.save(attachment_name, Stay_details_bill_image)
            Stay_details_bill_image = folder + attachment_name       
            attachment_list.append(Stay_details_bill_image)
      
        stay_details_string = request.data.get('stay_details')
        stay_details_data = stay_details_string
        stay_details_datas = json.loads(stay_details_data)
        list1=[]
        list2=[]
       
        for index, stay_detail in enumerate(stay_details_datas):
            list1.append(stay_detail["hotel_name"])
            tarequestdetails = SpTaRequestDetails()
            tarequestdetails.ta_request_id = ta_request_ids
            tarequestdetails.hotel_name = stay_detail["hotel_name"]
            tarequestdetails.amount = stay_detail["amount"]
            tarequestdetails.ta_details_type = 0
            tarequestdetails.bill_image =attachment_list[index]
            if index < len(attachment_list):
                tarequestdetails.bill_image = attachment_list[index]
            else:
                tarequestdetails.bill_image = None
            tarequestdetails.save()
       
        
        # # -----------------------------travelling-----------------------------
        attachment_list2 = []
        attachments2  = request.FILES.getlist('Travelling_details_bill_image')
        for id, attachment2 in enumerate(attachments2):
            folder  ='media/attachments2/' 
            storage = FileSystemStorage(location=folder)
            timestamp = int(time.time())
            travelling_attachment_name = attachment2.name
            temp = travelling_attachment_name.split('.')
            travelling_attachment_name = 'attachment_'+str(timestamp)+"_"+str(id)+"."+temp[(len(temp) - 1)]
            uploaded_attachment = storage.save(travelling_attachment_name, attachment2)
            attachment2 = folder + travelling_attachment_name       
            attachment_list2.append(attachment2)
        travelling_detail = request.data.get('travelling_details')
        travelling_data = travelling_detail
        travelling_datas = json.loads(travelling_data)
        for index, travelling_detail in enumerate(travelling_datas):
            list2.append(travelling_detail["amount"])
            tarequestdetails = SpTaRequestDetails()
            tarequestdetails.ta_request_id = ta_request_ids
            tarequestdetails.ta_date = travelling_detail['taavelling_date']
            tarequestdetails.amount = travelling_detail['amount']
            tarequestdetails.remark = travelling_detail['remark']
            tarequestdetails.payment_type = travelling_detail['payment_type']
            tarequestdetails.ta_details_type = 1
            #tarequestdetails.bill_image = attachment_list2[index]
            if index < len(attachment_list2):
                tarequestdetails.bill_image = attachment_list2[index]
            else:
                tarequestdetails.bill_image = None
            tarequestdetails.save()
            
        # # -------------------------------food details---------------------------
        attachment_list3 = []
        attachments3  = request.FILES.getlist('food_details_bill_image')
        for id, attachment3 in enumerate(attachments3):
            folder  ='media/attachments3/' 
            storage = FileSystemStorage(location=folder)
            timestamp = int(time.time())
            food_attachment_name = attachment3.name
            temp = food_attachment_name.split('.')
            food_attachment_name = 'attachment_'+str(timestamp)+"_"+str(id)+"."+temp[(len(temp) - 1)]
            uploaded_attachment = storage.save(food_attachment_name, attachment3)
            attachment3 = folder + food_attachment_name       
            attachment_list3.append(attachment3)
        food_detail = request.data.get('food_details')
        food_details_data = food_detail
        food_details_datas = json.loads(food_details_data)
        for index, food_detail in enumerate(food_details_datas):
            
            tarequestdetails = SpTaRequestDetails()
            tarequestdetails.ta_request_id = ta_request_ids
            tarequestdetails.ta_date = food_detail['date']
            tarequestdetails.amount = food_detail['amount']
            tarequestdetails.remark = food_detail['remark']
            tarequestdetails.ta_details_type = 2
            #tarequestdetails.bill_image = attachment_list3[index]
            if index < len(attachment_list3):
                tarequestdetails.bill_image = attachment_list3[index]
            else:
                tarequestdetails.bill_image = None
            tarequestdetails.save()
        # #---------------------------------miscellaneous details------------------------------
       
        attachment_list4 = []
        attachments4  = request.FILES.getlist('miscellaneous_details_bill_image')
        for id, attachment4 in enumerate(attachments4):
            folder  ='media/attachments4/' 
            storage = FileSystemStorage(location=folder)
            timestamp = int(time.time())
            miscellaneous_attachment_name = attachment4.name
            temp = miscellaneous_attachment_name.split('.')
            miscellaneous_attachment_name = 'attachment_'+str(timestamp)+"_"+str(id)+"."+temp[(len(temp) - 1)]
            uploaded_attachment = storage.save(miscellaneous_attachment_name, attachment4)
            attachment4 = folder + miscellaneous_attachment_name       
            attachment_list4.append(attachment4)
            
        miscellaneous_detail = request.data.get('miscellaneous_details')
        miscellaneous_details_data = miscellaneous_detail
        miscellaneous_details_datas = json.loads(miscellaneous_details_data)
        for index, miscellaneous_detail in enumerate(miscellaneous_details_datas):
            
            tarequestdetails = SpTaRequestDetails()
            tarequestdetails.ta_request_id = ta_request_ids
           
            tarequestdetails.amount = miscellaneous_detail['amount']
            tarequestdetails.remark = miscellaneous_detail['remark']
            tarequestdetails.ta_details_type = 3
            #tarequestdetails.bill_image = attachment_list4[index]
            if index < len(attachment_list4):
                tarequestdetails.bill_image = attachment_list4[index]
            else:
                tarequestdetails.bill_image = None
            tarequestdetails.save()
    
        heading = 'New Request TA has been initiated'
        activity = f"{user_name} TA has been created."
        saveActivity('TA Management', 'TA Request', heading, activity, request.user.id, user_name, 'add.png', '2', 'app.png')
        context = {}
        context['list1']               = list1
       
        context['list2']                = list2
        
        context['message'] = 'Request TA has been successfully sent.'
        context['response_code'] = HTTP_200_OK
        return Response(context, status=HTTP_200_OK)
    except Exception as e:
        context = {}
        context['message']                          = str(e)
        context['response_code']                    = HTTP_400_BAD_REQUEST
        return Response(context, status=HTTP_400_BAD_REQUEST)



@csrf_exempt
@api_view(["POST"])
def gettaRequestDetails(request):
    if request.data.get("page_limit")is None or request.data.get("page_limit") == '':
        return Response({'message': 'Page limit is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)   
    page_limit  = int(request.data.get("page_limit"))*10
    offset      = int(page_limit)-10
    page_limit  = 10
    ta_list_count = SpTaRequest.objects.filter(user_id=request.data.get("user_id")).values('id').count()
    id = SpTaRequest.objects.filter(user_id=request.data.get("user_id")).values('id')  
    if ta_list_count:
        ta_list_count    = math.ceil(round(ta_list_count/10, 2))
        ta_status     = SpTaRequest.objects.filter(user_id=request.data.get("user_id")).order_by('-id').first()
        ta_status     = ta_status.status 
    else:
        ta_list_count = 0 
        ta_status     = 0
    ta_lists = SpTaRequest.objects.filter(user_id=request.data.get("user_id")).values('id','user_id','visit_place','visit_from_date','visit_to_date','total_expenses','company_paid','balance','status','created_at').order_by('-id')[offset:offset+page_limit]
    context = {}
    context['message']              = 'Success'
    context['ta_list']              = list(ta_lists)
    context['ta_list_count']        = ta_list_count
    context['id']                   = id
    context['response_code']        = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)
    
@csrf_exempt
@api_view(["POST"])
def edittaRequestDetails(request):
    user_id = request.data.get("user_id")
    ta_request_id = request.data.get("ta_request_id")

    if user_id is None or user_id == '' or ta_request_id is None or ta_request_id == '':
        return Response({'message': 'User Id and TA request id fields are required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

    try:
        ta_request = SpTaRequest.objects.get(user_id=user_id, id=ta_request_id)
        stay_details = SpTaRequestDetails.objects.filter(ta_request_id=ta_request_id, ta_details_type=0)
        travelling_details = SpTaRequestDetails.objects.filter(ta_request_id=ta_request_id, ta_details_type=1)
        food_details = SpTaRequestDetails.objects.filter(ta_request_id=ta_request_id, ta_details_type=2)
        miscellaneous_details = SpTaRequestDetails.objects.filter(ta_request_id=ta_request_id, ta_details_type=3)

        # Serialize the list of SpTaRequestDetails
        stay_details_data = []
        for detail in stay_details:
            detail_data = {
                'ta_request_id': detail.ta_request_id,
                'stay_detail_id':detail.id,
                'hotel_name': detail.hotel_name,
                'amount': detail.amount,
                'bill_image': detail.bill_image,
                'created_at': detail.created_at
            }
            stay_details_data.append(detail_data)
        travelling_details_data = []
        for detail in travelling_details:
            trave_detail_data = {
                'ta_request_id': detail.ta_request_id,
                'travelling_id': detail.id,
                'date': detail.ta_date,
                'amount': detail.amount,
                'bill_image': detail.bill_image,
                'remark': detail.remark,
                'payment_type': detail.payment_type,
                'created_at': detail.created_at
            }
            travelling_details_data.append(trave_detail_data)
        
        food_details_data = []
        for detail in food_details:
            food_detail_data = {
                'ta_request_id': detail.ta_request_id,
                'food_id': detail.id,
                'date': detail.ta_date,
                'amount': detail.amount,
                'bill_image': detail.bill_image,
                'remark': detail.remark,
                
                'created_at': detail.created_at
            }
            food_details_data.append(food_detail_data)
        misces_details_data = []
        for detail in miscellaneous_details:
            misce_detail_data = {
                'ta_request_id': detail.ta_request_id,
                'misce_id':  detail.id,
                'amount': detail.amount,
                'bill_image': detail.bill_image,
                'remark': detail.remark,
                
                'created_at': detail.created_at
            }
            misces_details_data.append(misce_detail_data)
        
        context = {
            'TaRequest':[ {
                'id': ta_request.id,
                'visit_place': ta_request.visit_place,
                'visit_from_date': ta_request.visit_from_date,
                'visit_to_date': ta_request.visit_to_date,
                'total_expenses': ta_request.total_expenses,
                'company_paid': ta_request.company_paid,
                'balance': ta_request.balance,
                'status': ta_request.status,
                'created_at': ta_request.created_at
            }],
            'StayDetails': stay_details_data,
            'TravellingDetails': travelling_details_data,
            'FoodDetails': food_details_data,
            'MiscellaneousDetails': misces_details_data,
        }

        context['message'] = 'Success'
        context['response_code'] = HTTP_200_OK

        return Response(context, status=HTTP_200_OK)

    except SpTaRequest.DoesNotExist:
        return Response({'message': 'TA request not found', 'response_code': HTTP_404_NOT_FOUND}, status=HTTP_404_NOT_FOUND)
    except SpTaRequestDetails.DoesNotExist:
        return Response({'message': 'Stay details not found', 'response_code': HTTP_404_NOT_FOUND}, status=HTTP_404_NOT_FOUND)
        

import json
import time,timeago
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

from datetime import datetime, date

from datetime import timedelta
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password, check_password
from django.template.loader import render_to_string
from django.core.mail import EmailMultiAlternatives
from math import sin, cos, sqrt, atan2, radians
from rest_framework.decorators import api_view, parser_classes
from rest_framework.parsers import JSONParser
from rest_framework.response import Response

@csrf_exempt
@api_view(["POST"])
@permission_classes((AllowAny,))

def verifyIdPin(request):
    id_card_pin = request.data.get("id_card_pin")
    if not id_card_pin:
        return Response({'message': 'ID Card pin is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_404_NOT_FOUND)

    if TblStudents.objects.filter(id_card_pin=id_card_pin).exists():
        student = TblStudents.objects.raw(''' SELECT tbl_students.*,tbl_colleges.college_name,tbl_colleges.alias,tbl_branch.branch FROM tbl_students
        LEFT JOIN tbl_colleges on tbl_colleges.id = tbl_students.college_id 
        LEFT JOIN tbl_branch on tbl_branch.id = tbl_students.branch_id
        WHERE tbl_students.id_card_pin=%s ''',[id_card_pin])

        # update 
        TblStudents.objects.filter(id_card_pin=id_card_pin).update(is_id_card_pin_verified=1)

        student_name   = student[0].first_name+' '
        if student[0].middle_name is not None:
            student_name   += student[0].middle_name+' '
        if student[0].last_name is not None:
            student_name   += student[0].last_name

        heading     = 'ID Card Pin Verification.'
        activity    = student_name+' ('+ student[0].reg_no +')  has verified his/her id card at '+datetime.now().strftime('%d/%m/%Y | %I:%M %p') 
        saveActivity('Student', 'ID Card Pin Verification', heading, activity, student[0].id, student_name, 'add.png', '2', 'app.png')

        student_details = {}
        student_details['id'] = student[0].id
        student_details['name'] = student_name
        student_details['registration_number'] = student[0].reg_no
        student_details['college'] = student[0].alias
        student_details['course'] = student[0].branch
        student_details['contact_number'] = student[0].primary_contact_no
        student_details['father_name'] = student[0].father_name

        if student[0].college_id == 1:
            if student[0].profile_image is not None:
                student_details['profile_image'] = "http://bipe.sortstring.co.in/"+student[0].profile_image
            else:
                student_details['profile_image'] = "https://sansthaa.sortstring.co.in/static/img/png/default_icon.png"

            student_details['college_logo'] = "http://bipe.sortstring.co.in/public/assets/images/bipe-logo.png"
        elif student[0].college_id == 2:
            if student[0].profile_image is not None:
                student_details['profile_image'] = "http://bite.sortstring.co.in/"+student[0].profile_image
            else:
                student_details['profile_image'] = "https://sansthaa.sortstring.co.in/static/img/png/default_icon.png"

            student_details['college_logo'] = "http://bipe.sortstring.co.in/public/assets/images/bipe-logo.png"
        
        elif student[0].college_id == 3:
            if student[0].profile_image is not None:
                student_details['profile_image'] = "http://bip.sortstring.co.in/"+student[0].profile_image
            else:
                student_details['profile_image'] = "https://sansthaa.sortstring.co.in/static/img/png/default_icon.png"

            student_details['college_logo'] = "http://bipe.sortstring.co.in/public/assets/images/bip-logo.png"

        
        tmp = student[0].semester_id.split('_')
        suffix = ""
        if tmp[1] == "1":
            suffix = "st"
        elif tmp[1] == "2":
            suffix = "nd"
        elif tmp[1] == "3":
            suffix = "rd"
        elif tmp[1] == "4" or tmp[1] == "5" or tmp[1] == "6":
            suffix = "th"

        if tmp[0] == "sem":
            student_details['semester_year'] = str(tmp[1])+suffix+" Sem"
        else:
            student_details['semester_year'] = str(tmp[1])+suffix+" Year"


        context = {}
        
        context['message']                  = 'ID Card pin verified successfully'
        context['response_code']            = HTTP_200_OK
        context['student']                  = student_details

        return Response(context, status=HTTP_200_OK)
    else:
        return Response({'message': 'Invalid ID Card pin', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_404_NOT_FOUND)
   



#for approvalRequests
@csrf_exempt
@api_view(["POST"])
def approvalRequests(request):    
    data = {}
    if request.user.role_id == 0:
        #all leave policies only excluding approved one with policy status 3
        leave_policy_data = []
        leave_policies = SpLeavePolicies.objects.exclude(policy_status=3).order_by('-id')
        for leave_policy in leave_policies:
            leave_policy_data.append(model_to_dict(leave_policy))

        #all holiday only excluding approved one with holiday status 3
        holiday_data = []
        holidays = SpHolidays.objects.exclude(holiday_status=3).order_by('-id')
        for holiday in holidays:
            holiday_data.append(model_to_dict(holiday))
        
        data['leave_policies'] = leave_policy_data
        data['holidays'] = holiday_data

        return Response({'message':"approval request","approval_requests":data, 'response_code': HTTP_200_OK}, status=HTTP_200_OK)
    
    else:
        #will show leaves on behalf of user logged in and excluding leave with status 3
        leave_policy_data = []
        leave_policies = SpLeavePolicies.objects.raw('''SELECT sp_leave_policies.*, sp_approval_status.level_id, sp_approval_status.level, sp_approval_status.status, sp_approval_status.final_status_user_id, sp_approval_status.final_status_user_name
        FROM sp_leave_policies left join sp_approval_status on sp_approval_status.row_id = sp_leave_policies.id 
        where sp_leave_policies.policy_status != 3 and  sp_approval_status.user_id = %s and sp_approval_status.model_name = 'SpLeavePolicyDetails' order by id desc ''',[19])#[request.user.id]
        for leave_policy in leave_policies:
            leave_policy_data.append(model_to_dict(leave_policy))

        #will show holidays on behalf of user logged in and excluding holiday with status 3
        holiday_data = []
        holidays = SpHolidays.objects.raw('''SELECT sp_holidays.*, sp_approval_status.level_id, sp_approval_status.level, sp_approval_status.status, sp_approval_status.final_status_user_id, sp_approval_status.final_status_user_name
        FROM sp_holidays left join sp_approval_status on sp_approval_status.row_id = sp_holidays.id 
        where sp_holidays.holiday_status != 3 and  sp_approval_status.user_id = %s and sp_approval_status.model_name = 'SpHolidays' order by id desc ''',[19])#[request.user.id]

        for holiday in holidays:
            holiday_data.append(model_to_dict(holiday))

        
        data['leave_policies'] = leave_policy_data
        data['holidays'] = holiday_data
            
        return Response({'message':"approval request","approval_requests":data, 'response_code': HTTP_200_OK}, status=HTTP_200_OK)
    

#for updatePolicyStatus
@csrf_exempt
@api_view(["POST"])
def updatePolicyStatus(request):
    response = {}
    uploaded_file_url = ''
    policyID = request.POST.getlist('policyId')
    if bool(request.FILES.get('document', False)) == True:
        document = request.FILES['document']
        fs = FileSystemStorage(location="media/approval_documents")
        filename = fs.save(document.name, document)
        uploaded_file_url = fs.url(filename)
        uploaded_file_url = uploaded_file_url.split("media/")[1]
        uploaded_file_url = "media/approval_documents/"+uploaded_file_url
        
    policyID = str(policyID).replace("'","")
    policyID = str(policyID).replace("[","")
    policyID = str(policyID).replace("]","")
    policyID = policyID.split(",")
    if policyID:
        for policy_id in policyID:
            updatePolicyStatus = SpLeavePolicies.objects.get(id=policy_id)
            updatePolicyStatus.policy_status = request.POST['statusId']
            updatePolicyStatus.approval_description = request.POST['description']
            updatePolicyStatus.document = uploaded_file_url
            updatePolicyStatus.save()
        response['error'] = False
        response['message'] = "Record has been updated successfully."
        return Response(response)
    else:
        response['error'] = True
        response['message'] = "Record has Not been updated successfully."
        return Response(response)


#for updatePolicyStatus
@csrf_exempt
@api_view(["POST"])
def updateHolidayStatus(request):
    response = {}
    uploaded_file_url = ''
    if bool(request.FILES.get('document', False)) == True:
        document = request.FILES['document']
        fs = FileSystemStorage(location="media/approval_documents")
        filename = fs.save(document.name, document)
        uploaded_file_url = fs.url(filename)
        uploaded_file_url = uploaded_file_url.split("media/")[1]
        uploaded_file_url = "media/approval_documents/"+uploaded_file_url

    holidayID = request.POST.getlist('holidayID')
    holidayID = str(holidayID).replace("'","")
    holidayID = str(holidayID).replace("[","")
    holidayID = str(holidayID).replace("]","")
    holidayID = holidayID.split(",")
    if holidayID:
        for holiday_id in holidayID:
            updateHolidayStatus = SpHolidays.objects.get(id=holiday_id)
            updateHolidayStatus.holiday_status = request.POST['statusId']
            updateHolidayStatus.approval_description = request.POST['description']
            updateHolidayStatus.document = uploaded_file_url
            updateHolidayStatus.save()
        response['error'] = False
        response['message'] = "Record has been updated successfully."
        return Response(response)
    else:
        response['error'] = True
        response['message'] = "Record has Not been updated successfully."
        return Response(response)

        
        

def checkApplyLeaveBefore(date,leave_policy_id,user_id ,leave_type_id):
    try:
        leave_policy_details = SpLeavePolicyDetails.objects.get(leave_policy_id = leave_policy_id,leave_type_id=leave_type_id)
    except SpLeavePolicyDetails.DoesNotExist:
        leave_policy_details = None
    if leave_policy_details:
        if leave_policy_details.apply_leave_before:
            apply_leave_before = int(leave_policy_details.apply_leave_before)
            today               = datetime.strptime(datetime.today().strftime('%Y-%m-%d'), '%Y-%m-%d')
            total_no_of_leave_before_days      = date - today
            total_no_of_leave_before_days      = total_no_of_leave_before_days.days 
            if apply_leave_before > total_no_of_leave_before_days:
                return True
            else:
                return False
        else:
                return False
    else:
        return False
           
def checkAvailAdvance(user_id):
    date_of_joining = getModelColumnByColumnId(SpBasicDetails,'user_id',user_id,'date_of_joining')
    date_of_joining = datetime.strptime(date_of_joining.strftime('%Y-%m-%d'), '%Y-%m-%d')
    today           = datetime.today()
    total_days      = today - date_of_joining
    total_days      = total_days.days 
    if total_days > 365 or total_days > 366:
      return True
    else:
        return False 
        
@csrf_exempt
@api_view(["POST"])
def handOverLeaveRequestList(request):
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("page_limit")is None or request.data.get("page_limit") == '':
        return Response({'message': 'Page limit is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

    page_limit  = int(request.data.get("page_limit"))*10
    offset      = int(page_limit)-10
    page_limit  = 10
    
    leave_list_count = SpNotifications.objects.filter(sub_module = 'Leave request forwarded',to_user_id = request.data.get("user_id"),model_name = 'SpUserLeaves').values('id').count()
        
    if leave_list_count:
        leave_list_count = math.ceil(round(leave_list_count/10, 2))
    else:
        leave_list_count = 0 

        
    leave_request = SpNotifications.objects.filter(sub_module = 'Leave request forwarded',to_user_id = request.data.get("user_id"),model_name = 'SpUserLeaves').order_by('-id')[offset:offset+page_limit]
    request_list = []
    for req in leave_request:
        if SpUserLeaves.objects.filter(id = req.row_id ).exists():
            request_dict = {}
            request_dict['leave_id']                = req.row_id
            request_dict['heading']                 = req.heading
            request_dict['leave_status']            = getModelColumnById(SpUserLeaves,req.row_id,'leave_status')
            request_dict['applied_emp_name']        = req.from_user_name
            request_dict['applied_emp_code']         = getModelColumnById(SpUsers,req.from_user_id,'emp_sap_id')
            request_dict['leave_from_date']         = getModelColumnById(SpUserLeaves,req.row_id,'leave_from_date')
            request_dict['leave_to_date']           = getModelColumnById(SpUserLeaves,req.row_id,'leave_to_date')
            request_dict['is_first_half_day']       = getModelColumnById(SpUserLeaves,req.row_id,'is_first_half_day')
            request_dict['is_last_half_day']        = getModelColumnById(SpUserLeaves,req.row_id,'is_last_half_day')
            request_list.append(request_dict)
            
    context = {}
    context['message']                  = 'Success'
    context['leave_request_list']       = request_list
    context['leave_list_count']         = leave_list_count
    return Response(context, status=HTTP_200_OK)   


@csrf_exempt
@api_view(["POST"])
def applyLeave(request):
    today   = date.today()
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    
    if request.data.get("leave_type_id")is None or request.data.get("leave_type_id") == '':
        return Response({'message': 'Leave type id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    
    if request.data.get("leave_from_date")is None or request.data.get("leave_from_date") == '':
        return Response({'message': 'From date field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    
    if request.data.get("leave_to_date")is None or request.data.get("leave_to_date") == '':
        return Response({'message': 'To date field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("description")is None or request.data.get("description") == '':
        return Response({'message': 'Description field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("handover_user_id")is None or request.data.get("handover_user_id") == '':
        return Response({'message': 'handover user field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    
    attachment = None
    year_leave_counts = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = request.data.get("leave_type_id")).last()
    
    if year_leave_counts.year_leave_count == 0:
        return Response({'message': 'No '+getModelColumnById(SpLeaveTypes,year_leave_counts.leave_type_id ,'leave_type')+' available Kindly contact HR', 'response_code':0}, status=HTTP_200_OK)
        
    leave_from_date             = datetime.strptime(request.data.get("leave_from_date"), '%Y-%m-%d')
    leave_to_date               = datetime.strptime(request.data.get("leave_to_date"), '%Y-%m-%d')
    total_no_of_leave_days      = leave_to_date - leave_from_date
    total_no_of_leave_days      = total_no_of_leave_days.days 
    # consecutive_leave_counts     = SpUserLeavePolicyLedger.objects.filter(leave_type_id = request.data.get("leave_type_id"),user_id = request.data.get("user_id")).last() 
    consecutive_leave_counts     = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = request.data.get("leave_type_id")).first()
    
    if consecutive_leave_counts.consecutive_leave:
        consecutive_leave_count     = int(consecutive_leave_counts.consecutive_leave)
    else:
        consecutive_leave_count = 0
   
    credit = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = request.data.get("leave_type_id")).aggregate(Sum('credit'))['credit__sum']
    if credit:
        credit = credit
    else:
        credit = 0
    debit = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = request.data.get("leave_type_id")).aggregate(Sum('debit'))['debit__sum']
    if debit:
        debit = debit
    else:
        debit = 0
    leave_count   = float(credit)-float(debit)
    
    
    isLeaveAppliedOrNot  = checkLeaveAppliedOrNot(request.data.get("user_id"), request.data.get("leave_from_date"), request.data.get("leave_to_date"))
    if checkAttendanceMarkedOrNot(request.data.get("user_id"), request.data.get("leave_from_date"), request.data.get("leave_to_date"), today.strftime('%Y-%m-%d')):
        return Response({'message': 'Attendance already marked', 'response_code':0}, status=HTTP_200_OK)
    elif isLeaveAppliedOrNot['status'] == True:
        return Response({'message': 'You have already marked leave on selected dates, kindly select another date', 'response_code':0}, status=HTTP_200_OK)
    elif consecutive_leave_count <= total_no_of_leave_days:
        return Response({'message': f'You can apply leave only {consecutive_leave_count} days , kindly select another date', 'response_code':0}, status=HTTP_200_OK)
    elif leave_count <= total_no_of_leave_days:
        return Response({'message': f'You can apply leave only {leave_count} days , kindly select another date', 'response_code':0}, status=HTTP_200_OK)
    elif checkApplyLeaveBefore(leave_from_date,consecutive_leave_counts.leave_policy_id,request.data.get("user_id"),consecutive_leave_counts.leave_type_id) == True:
        try:
             leave_policy_details = SpLeavePolicyDetails.objects.get(leave_policy_id = consecutive_leave_counts.leave_policy_id,leave_type_id=consecutive_leave_counts.leave_type_id)
        except SpLeavePolicyDetails.DoesNotExist:
            leave_policy_details = None

        
        apply_leave_before = int(leave_policy_details.apply_leave_before)
        return Response({'message': f'You can only apply leaves before {apply_leave_before} days, kindly select another date', 'response_code':0}, status=HTTP_200_OK)
    
   
   
    else:
        leave_policy_details = SpLeavePolicyDetails.objects.get(leave_policy_id = consecutive_leave_counts.leave_policy_id,leave_type_id=consecutive_leave_counts.leave_type_id)
        if bool(request.FILES.get('attachment', False)) == True:
            uploaded_attachment = request.FILES['attachment']
            storage = FileSystemStorage()
            timestamp = int(time.time())
            attachment_name = uploaded_attachment.name
            temp = attachment_name.split('.')
            attachment_name = 'leave_attachment_'+str(timestamp)+"."+temp[(len(temp) - 1)]
            
            attachment = storage.save(attachment_name, uploaded_attachment)
            attachment = storage.url(attachment)        
                
        user_name   = request.user.first_name+' '+request.user.middle_name+' '+request.user.last_name
        data = SpUserLeaves()
        data.user_id                = request.data.get("user_id")
        data.user_name              = user_name
        data.leave_type_id          = request.data.get("leave_type_id")
        data.leave_type             = getModelColumnById(SpLeaveTypes,request.data.get("leave_type_id"),'leave_type')
        data.leave_from_date        = request.data.get("leave_from_date")
        data.leave_to_date          = request.data.get("leave_to_date")
        data.handover_user_id          = request.data.get("handover_user_id")
        

        if request.data.get("is_first_half_day") == "1":
            data.is_first_half_day = 1
            leave_policy_detail = SpLeavePolicyDetails.objects.filter(leave_type_id=request.data.get("leave_type_id")).first()
            if str(leave_policy_detail.is_halfday_included) == "0":
                return Response({'message': 'half day not allow', 'response_code':0}, status=HTTP_200_OK)
                
        else:
            data.is_first_half_day = 0
        if request.data.get("is_last_half_day") == "1":
            data.is_last_half_day = 1
            leave_policy_detail = SpLeavePolicyDetails.objects.filter(leave_type_id=request.data.get("leave_type_id")).first()
            if str(leave_policy_detail.is_halfday_included) == "0":
                return Response({'message': 'half day not allow', 'response_code':0}, status=HTTP_200_OK)
        else:
            data.is_last_half_day = 0
        data.leave_detail           = request.data.get('description')
        data.leave_status           = 1
        data.attachment             = attachment
        data.save()
        user_leave_id  = data.id
        
        if request.data.get("handover_user_id"):
            userFirebaseToken = getModelColumnById(SpUsers,request.data.get("handover_user_id"),'firebase_token')
            employee_name = getUserName(request.data.get("handover_user_id"))

            message_title = "Leave Request Forwarded"
            message_body = "Leave Handover request has been sent by "+user_name
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
            saveNotification(user_leave_id,'SpUserLeaves','Users Management','Leave request forwarded',message_title,message_body,notification_image,request.data.get("user_id"),user_name,request.data.get("handover_user_id"),employee_name,'profile.png',2,'app.png',1,1)
        #-----------------------------save notification block----------------------------#
        document_id  = request.data.get('document_id')
        document_id = document_id.split(',')
        
        if bool(request.FILES.get('document', False)) == True:
            for i,document in enumerate(request.FILES.getlist('document')):
                # uploaded_attachment = request.FILES['attachment']
                
                storage = FileSystemStorage()
                timestamp = int(time.time())
                attachment_name = document.name
                temp = attachment_name.split('.')
                attachment_name = 'leave-document/leave_attachment_'+str(timestamp)+"."+temp[(len(temp) - 1)]
                
                attachment = storage.save(attachment_name, document)
                attachment = storage.url(attachment)  
                
                doc = SpUserLeaveDocument()  
                doc.user_id = request.data.get("user_id")
                doc.user_leave_id = user_leave_id
                doc.leave_type_document_id = document_id[i]
                doc.document = attachment
                doc.save()
        sendFocNotificationToUsers(data.id, '', 'add', 38, request.user.id, user_name, 'SpUserLeaves',request.user.role_id)
        
        heading     = 'New Leave Request has been initiated'
        activity    = 'New Leave Request has been initiated by '+user_name+' on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p') 
        
        saveActivity('Leave Management', 'Leave Request', heading, activity, request.user.id, user_name, 'add.png', '2', 'app.png')
        context = {}
        context['message']       = 'Leave Request has been successfully sent.'
        context['response_code'] = 1
        return Response(context, status=HTTP_200_OK)  
 
# @csrf_exempt
# @api_view(["POST"])
# def appliedLeaves(request):
#     if request.data.get("page_limit")is None or request.data.get("page_limit") == '':
#         return Response({'message': 'Page limit is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
#     if request.data.get("user_id")is None or request.data.get("user_id") == '':
#         return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)   
#     page_limit  = int(request.data.get("page_limit"))*10
#     offset      = int(page_limit)-10
#     page_limit  = 10
#     leave_list_count = SpUserLeaves.objects.filter(user_id=request.data.get("user_id")).values('id').count()
        
#     if leave_list_count:
#         leave_list_count = math.ceil(round(leave_list_count/10, 2))
#         leave_status     = SpUserLeaves.objects.filter(user_id=request.data.get("user_id")).order_by('-id').first()
#         leave_status     = leave_status.leave_status 
#     else:
#         leave_list_count = 0 
#         leave_status     = 0
#     leave_list = SpUserLeaves.objects.filter(user_id=request.data.get("user_id")).values('id','user_id','handover_user_id','user_name','leave_type_id','leave_type','leave_from_date','leave_to_date','leave_detail','leave_status','is_first_half_day','is_last_half_day','is_document_required','is_document_required_count').order_by('-id')[offset:offset+page_limit]
#     for leave in leave_list:
#         leave['handover_user_name'] = getUserName(leave['handover_user_id'])
#         alias = getModelColumnById(SpLeaveTypes,leave['leave_type_id'],'alias')
#         leave['leave_type'] = leave['leave_type']+" ("+ alias +")"
#         uploaded_document_id = SpUserLeaveDocument.objects.filter(user_leave_id = leave['id']).values_list('leave_type_document_id',flat=True)
#         pending_documents_list = SpLeaveTypeDocuments.objects.filter(leave_type_id  = leave['leave_type_id']).exclude(id__in  = uploaded_document_id).values('id','document')
#         leave['pending_documents_list'] = list(pending_documents_list)
        
#     basic_details_obj=SpBasicDetails.objects.filter(user_id=request.data.get("user_id")).first()
#     if basic_details_obj:
#         if basic_details_obj.week_of_day:
#             week_off_day=basic_details_obj.week_of_day
#         else:
#             week_off_day=""
#     else:
#         week_off_day=""
        
        
#     leave_type                      = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id")).values('leave_type_id').distinct()
#     for leave in leave_type:
#         try:
#             leave_policy_id = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = leave['leave_type_id']).first()
#             is_half_day = SpLeavePolicyDetails.objects.get(leave_policy_id = leave_policy_id.leave_policy_id,leave_type_id =leave['leave_type_id'] )
#             is_half_day = is_half_day.is_halfday_included
#         except SpLeavePolicyDetails.DoesNotExist:
#             is_half_day  = None
#         year_leave_count = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = leave['leave_type_id']).last()
#         credit = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = leave['leave_type_id']).aggregate(Sum('credit'))['credit__sum']
#         if credit:
#             credit = credit
#         else:
#             credit = 0
#         debit = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = leave['leave_type_id']).aggregate(Sum('debit'))['debit__sum']
#         if debit:
#             debit = debit
#         else:
#             debit = 0
#         leave_count   = float(credit)-float(debit)
#         leave['leave_type']                 = getModelColumnById(SpLeaveTypes,leave_policy_id.leave_type_id ,'leave_type') + ' (' +  str(leave_count) + ')'
#         leave['is_halfday_included']        = is_half_day
#         leave['year_leave_count']           = year_leave_count.credit
#         leave['leave_policy_id']            = leave_policy_id.leave_policy_id
#         leave['required_document_list']     =  list(SpLeaveTypeDocuments.objects.filter(leave_type_id = leave['leave_type_id']).values('id','document'))
        
        
#     year_leave_count = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id")).last()
#     if year_leave_count:
#       year_leave_count =  year_leave_count.balance
#     else:
#         year_leave_count = 0
#     context = {}
#     context['message']              = 'Success'
#     context['leave_list']           = list(leave_list)
#     context['leave_list_count']     = leave_list_count
#     context['leave_type_list']      = list(leave_type)
#     context['leave_count']          = year_leave_count
#     context['leave_status']         = leave_status
#     context['week_off_day']    = week_off_day
    
#     context['response_code']        = HTTP_200_OK
#     return Response(context, status=HTTP_200_OK)

        


@csrf_exempt
@api_view(["POST"])
def saveUserTracking(request):
    
    today   = date.today()
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
   
    if request.data.get("latitude")is None or request.data.get("latitude") == '' or request.data.get("longitude")is None or request.data.get("longitude") == '':
        return Response({'message': 'Coordinates is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)  
    if SpUserTracking.objects.filter(user_id=request.data.get("user_id"), sync_date_time__icontains=today.strftime("%Y-%m-%d")).exists():
        
        user_data                       = SpUserTracking()
        user_data.user_id               = request.data.get("user_id")
        user_data.latitude              = request.data.get("latitude")
        user_data.longitude             = request.data.get("longitude")
        user_data.accuracy              = request.data.get("accuracy")
        #user_data.distance_travelled    = meter_distance
        user_data.distance_travelled    = 0
        # user_data.travel_charges        = getModelColumnByColumnId(SpEmployeePayrollMaster, 'user_id', request.data.get("user_id"), 'emp_ta')
        user_data.travel_charges        = 0
        if request.data.get("created_at"):
            user_data.sync_date_time        = request.data.get("created_at")
            user_data.flag              = 1
        else:    
            user_data.sync_date_time        = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            user_data.flag              = 0
        user_data.save()
    else:
        user_data                       = SpUserTracking()
        user_data.user_id               = request.data.get("user_id")
        user_data.latitude              = request.data.get("latitude")
        user_data.longitude             = request.data.get("longitude")
        user_data.accuracy              = request.data.get("accuracy")
        user_data.distance_travelled    = 0
        user_data.flag                  = 0
        # user_data.travel_charges        = getModelColumnByColumnId(SpEmployeePayrollMaster, 'user_id', request.data.get("user_id"), 'emp_ta')
        user_data.travel_charges        = 0
        user_data.sync_date_time        = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        user_data.save()
    start_data  = SpUserAttendance.objects.filter(start_time__isnull=False, attendance_date_time__icontains=today.strftime("%Y-%m-%d"), user_id=request.data.get("user_id")).count()
    end_data    = SpUserAttendance.objects.filter(end_time__isnull=False, attendance_date_time__icontains=today.strftime("%Y-%m-%d"), user_id=request.data.get("user_id")).count()
    if start_data == 0:
        attendance_status = 0
    elif int(start_data)!=int(end_data):
        attendance_status = 1
    else:
        attendance_status = 0
    context = {}
    context['attendance_status']        = attendance_status
    context['message']       = 'Tracking data saved successfully successfully'
    context['response_code'] = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)
        

def send_email(subject, html_content, text_content=None, from_email=None, recipients=[], attachments=[], bcc=[], cc=[]):
    # send email to user with attachment
    if not from_email:
        from_email = settings.DEFAULT_FROM_EMAIL
    if not text_content:
        text_content = ''
    email = EmailMultiAlternatives(
        subject, text_content, from_email, recipients, bcc=bcc, cc=cc
    )
    email.attach_alternative(html_content, "text/html")
    for attachment in attachments:
        # Example: email.attach('design.png', img_data, 'image/png')
        email.attach(*attachment)
    email.send()

def get_rendered_html(template_name, context={}):
    html_content = render_to_string(template_name, context)
    return html_content

def send_mass_mail(data_list):
    for data in data_list:
        template = data.pop('template')
        context = data.pop('context')
        html_content = get_rendered_html(template, context)
        data.update({'html_content': html_content})
        send_email(**data)  



@csrf_exempt
@api_view(["POST"])
def updateUserLocation(request):
    
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("latitude")is None or request.data.get("latitude") == '':
        return Response({'message': 'Latitude field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("longitude")is None or request.data.get("longitude") == '':
        return Response({'message': 'Longitude field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)  


    user                = SpUsers.objects.get(id=request.data.get("user_id"))
    user.latitude       = request.data.get("latitude")
    user.longitude      = request.data.get("longitude")
    user.periphery      = '500'
    user.timing         = '6:00 AM'
    user.save()

    user_name   = request.user.first_name+' '+request.user.middle_name+' '+request.user.last_name
    heading     = 'Location has been updated'
    activity    = 'Location has been updated by '+user_name+' on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p') 
    
    saveActivity('Location', 'Location updated', heading, activity, request.user.id, user_name, 'UserCredentialChange.png', '2', 'app.png')

    context = {}
    context['latitude']     = request.data.get("latitude")
    context['longitude']    = request.data.get("longitude")
    context['periphery']    = '500'
    context['timing']       = '6:00 AM'
    context['message']      = 'Location has been successfully updated'
    context['response_code'] = HTTP_200_OK
    
    return Response(context, status=HTTP_200_OK)

@csrf_exempt
@api_view(["POST"])
def logout(request):
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
        
    if request.data.get("user_id")!="62":
        AuthtokenToken.objects.filter(user_id=request.user.id).delete()
        # clear firebase token
        SpUsers.objects.filter(id=request.user.id).update(firebase_token=None)
        user = SpUsers.objects.get( id= request.data.get("user_id"))
        user.device_id = None
        user.save()
    
    user_name   = request.user.first_name+' '+request.user.middle_name+' '+request.user.last_name
    heading     = user_name+' has been logout'
    activity    = user_name+' has been logout on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p') 
    
    saveActivity('Logout', 'Logout', heading, activity, request.user.id, user_name, 'add.png', '2', 'app.png')
    context = {}
    context['message'] = 'Logout successfully'
    context['response_code'] = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)




#get master data
@csrf_exempt
@api_view(["POST"])
def getMasterData(request):
    if request.data.get("user_id") is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    
    leave_type                      = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id")).values('leave_type_id').distinct()
    for leave in leave_type:
        try:
            leave_policy_id = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = leave['leave_type_id']).first()
            is_half_day = SpLeavePolicyDetails.objects.get(leave_policy_id = leave_policy_id.leave_policy_id,leave_type_id =leave['leave_type_id'] )
            is_half_day = is_half_day.is_halfday_included
        except SpLeavePolicyDetails.DoesNotExist:
            is_half_day  = None
        year_leave_count = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = leave['leave_type_id']).last()
        leave['leave_type']                 = getModelColumnById(SpLeaveTypes,leave_policy_id.leave_type_id ,'leave_type') 
        leave['is_halfday_included']        = is_half_day
        leave['year_leave_count']           = year_leave_count.month_leave_count
        leave['leave_policy_id']            = leave_policy_id.leave_policy_id
        leave['required_document_list']     =  list(SpLeaveTypeDocuments.objects.filter(leave_type_id = leave['leave_type_id']).values('id','document'))

    # department_id                   = getModelColumnById(SpUsers,request.data.get("user_id"),'department_id')
    handover_emp_list               = SpUsers.objects.filter(status=1).exclude(id__in=[request.data.get("user_id"),0]).values('id','first_name','middle_name','last_name')
    
    context = {}
    context['state_list']               = TblStates.objects.all().values('id', 'state')
    context['city_list']                = TblNewDistrict.objects.all().values('id', 'state_id', 'district_name')
    context['leave_type_list']          = list(leave_type)
    context['handover_emp_list']        = list(handover_emp_list)
    context['message']                  = 'Success'
    context['response_code']            = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)




# New Api Added By Sushil


@csrf_exempt
@api_view(["POST"])
def userAttendance(request):
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("type")is None or request.data.get("type") == '':
        return Response({'message': 'Attendance type is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("attendance_date_time")is None or request.data.get("attendance_date_time") == '':
        return Response({'message': 'Attendance DateTime field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    # if int(request.data.get("type")) == 1:
        
    #     if request.data.get("dis_ss_id") is None or request.data.get("dis_ss_id") == '':
    #         return Response({'message': 'Dis/SS id is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)      
    
    data = SpUserAttendance()
    data.user_id = request.data.get("user_id")
    data.attendance_date_time = request.data.get("attendance_date_time")
    now = datetime.now().strftime('%H:%M:%S')
    if request.data.get("type") == '1':
        data.start_time = now
        data.end_time = None
    else:
        data.start_time = None
        data.end_time = now
    
    if int(request.data.get("type")) == 1:
        data.dis_ss_id = request.data.get("user_id")

    if request.data.get("latitude") is None or request.data.get("latitude") == '':
        data.latitude = None
    else:
        data.latitude = request.data.get("latitude")
    
    if request.data.get("longitude") is None or request.data.get("longitude") == '':
        data.longitude = None
    else:
        data.longitude = request.data.get("longitude")
    
    data.attendance_type = 1
 
    if bool(request.FILES.get('attendance_image', False)) == True:
        uploaded_attendance_image = request.FILES['attendance_image']
        storage = FileSystemStorage()
        timestamp = int(time.time())
        attendance_image_name = uploaded_attendance_image.name
        temp = attendance_image_name.split('.')
        attendance_image_name = 'attendance'+str(timestamp)+"."+temp[(len(temp) - 1)]
        
        attendance_image = storage.save(attendance_image_name, uploaded_attendance_image)
        attendance_image = storage.url(attendance_image)
    
        data.attendance_img = attendance_image 
    if request.data.get("Eod"):
        data.Eod = request.data.get("Eod")
    else:
        data.Eod = None
    data.status = 1
    data.save()
    
    # save tracking

    if (request.data.get("latitude") is not None and request.data.get("latitude") != '') and (request.data.get("longitude") is not None and request.data.get("longitude") != ''):

        if TblClUserTracking.objects.filter(user_id=request.data.get("user_id")).exists():
            
            user_last_data = TblClUserTracking.objects.filter(user_id=request.data.get("user_id")).order_by('-id').first()
            
            R = 6373.0
            lat1 = radians(float(user_last_data.latitude))
            lon1 = radians(float(user_last_data.longitude))
            lat2 = radians(float(request.data.get("latitude")))
            lon2 = radians(float(request.data.get("longitude")))
            dlon = lon2 - lon1
            dlat = lat2 - lat1
            a = sin(dlat / 2)**2 + cos(lat1) * cos(lat2) * sin(dlon / 2)**2
            c = 2 * atan2(sqrt(a), sqrt(1 - a))
            distance = R * c
            meter_distance = float(distance * 1000)
            if meter_distance > 15 :
                user_data                       = SpUserTracking()
                user_data.user_id               = request.data.get("user_id")
                user_data.latitude              = request.data.get("latitude")
                user_data.longitude             = request.data.get("longitude")
                user_data.distance_travelled    = 0
                user_data.travel_charges        = getModelColumnById(Configuration, 1, 'travel_amount')
                user_data.save()
        else:
            user_data                       = SpUserTracking()
            user_data.user_id               = request.data.get("user_id")
            user_data.latitude              = request.data.get("latitude")
            user_data.longitude             = request.data.get("longitude")
            user_data.distance_travelled    = 0
            user_data.travel_charges        = getModelColumnById(Configuration, 1, 'travel_amount')
            user_data.save()
            
    user_name   = request.user.first_name+' '+request.user.middle_name+' '+request.user.last_name
    
    heading     = 'Attendance'
    if request.data.get("type") == '1':
        activity    = "Day started"
    else:
        activity    = "Day end" 
        
    saveActivity('User Attendance', 'User Attendance', heading, activity, request.user.id, user_name, 'markedAtten.png', '2', 'app.png')


    context = {}
    context['message'] = 'Attendance marked successfully'
    context['response_code'] = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)
       


@csrf_exempt
@api_view(["POST"])
def checkAttendances(request):
    today   = date.today()
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    context = {}
    if SpUserAttendance.objects.filter(attendance_date_time__icontains=today.strftime("%Y-%m-%d"), user_id=request.data.get("user_id")).exists():
        start_data      = SpUserAttendance.objects.filter(start_time__isnull=False,attendance_date_time__icontains=today.strftime("%Y-%m-%d"),user_id=request.data.get("user_id")).order_by('id').first()
        end_data        = SpUserAttendance.objects.filter(end_time__isnull=False,attendance_date_time__icontains=today.strftime("%Y-%m-%d"),user_id=request.data.get("user_id")).order_by('-id').first()
        user_attendance = SpUserAttendance.objects.filter(attendance_date_time__icontains=today.strftime("%Y-%m-%d"), user_id=request.data.get("user_id")).order_by('-id').first()
        if user_attendance.start_time is not None and user_attendance.end_time is None:
            context['status'] = 1
        elif user_attendance.start_time is None and user_attendance.end_time is not None:
            context['status'] = 0
        else:
            context['status'] = 0
        now = datetime.now().strftime('%Y-%m-%d')
        start_datetime = now + ' '+start_data.start_time
        if context['status'] == 0:
            end_datetime = now + ' '+end_data.end_time
        else:
            end_datetime = now = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        start_datetime = datetime.strptime(start_datetime, '%Y-%m-%d %H:%M:%S')
        end_datetime = datetime.strptime(end_datetime, '%Y-%m-%d %H:%M:%S')
        time_delta = (end_datetime - start_datetime)
        # total_seconds = time_delta.total_seconds()
        # hours = (total_seconds/60)/60
        time_delta = str(time_delta).split(':')
        time_delta = time_delta[0]+':'+time_delta[1]
        context['working_hours'] = str(time_delta) + ' hours'
    else:
        context['status'] = 0
        context['working_hours'] = ''
        
    if getModelColumnById(SpUsers, request.data.get("user_id"), 'periphery')is None or getModelColumnById(SpUsers, request.data.get("user_id"), 'periphery') == '':
        periphery = '500'
    else:
        periphery = getModelColumnById(SpUsers, request.data.get("user_id"), 'periphery')

    


    current_time = datetime.now().strftime("%H:%M:%S")
    

    working_shift_timing = TblClWorkingShifts.objects.filter(id=getModelColumnByColumnId(SpBasicDetails, 'user_id', request.data.get("user_id"), 'working_shift_id')).values('id','start_timing','end_timing').first()
    
    holidays = SpHolidays.objects.filter(start_date__month = date.today().strftime('%m'),start_date__year = date.today().strftime('%Y'))
    holiday_lists= []
    
    for holiday in holidays:
        holiday_list = getHoilydayDates(holiday.start_date,holiday.end_date)
        holiday_dict = {}
        current_date = date.today().strftime('%Y-%m-%d')
        if str(current_date) in holiday_list:
            holiday_dict['holiday_name'] = holiday.holiday
            holiday_lists.append(holiday_dict)
            
    week_of_day_list = getModelColumnByColumnId(SpBasicDetails,'user_id',request.data.get("user_id"),'week_of_day')
    week_of_day_list  = week_of_day_list.split(',')
    
    context['periphery']     = periphery
    context['week_of_day_list']     = week_of_day_list
    context['holiday_lists'] = holiday_lists
    context['geofence']      = getModelColumnByColumnId(SpBasicDetails, "user_id", request.data.get("user_id"), "geofencing")
    context['timing']        = working_shift_timing  
    context['response_code'] = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)



@api_view(['POST'])
def getDashboardData(request):
    if request.method == 'POST':
        if request.data.get("user_id") is None or request.data.get("user_id") == '':
            return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 

        _user_id = request.data.get('user_id')
        _current_date = date.today()

        total_present       = 0
        total_leaves        = 0
        total_absent        = 0
        # activity_type_name  = ''
        # distributor_name    = ''
        # beat_name           = ''
        start_time          = ''
        end_time            = ''
        hours_worked        = ''
        total_retail_time   = datetime.strptime('00:00:00', '%H:%M:%S')
        monthly_retail_time = datetime.strptime('00:00:00', '%H:%M:%S')

        # try:
        total_present       = SpUserAttendance.objects.filter(start_time__isnull=False, user_id = _user_id).filter(attendance_date_time__month = _current_date.month).filter(attendance_date_time__year = _current_date.year).count()
        
        # productivity_call   = SpSalesQuotation.objects.filter(user_id = _user_id, quotation_datetime__contains = _current_date)
        # monthly_productivity= SpSalesQuotation.objects.filter(user_id = _user_id, quotation_datetime__month = _current_date.month, quotation_datetime__year = _current_date.year)
        new_outlets         = SpUsers.objects.filter(created_by = _user_id,created_at__contains = _current_date)
        
        monthly_outlets     = SpUsers.objects.filter(created_by = _user_id, created_at__month = _current_date.month, created_at__year = _current_date.year)
        # new_visits          = SpVisits.objects.filter(user_id = _user_id,checkin_datetime__contains = _current_date)
        
        # monthly_visits      = SpVisits.objects.filter(user_id = _user_id, checkin_datetime__month = _current_date.month, checkin_datetime__year = _current_date.year)
        # beat_plan           = SpBeatPlan.objects.filter(employee_id = _user_id, scheduled_beat_date__contains = _current_date)
        # todays_todo         = SpSalesTodo.objects.filter(user_id = _user_id, todo_schedule_datetime__contains = _current_date)
        
        on_leave            = 0

        all_month_date = days_cur_month(_current_date.day, _current_date.month, _current_date.year)

        now_leaves_list             = []
        total_leaves_list           = []
        total_no_of_weekoff_list    = []
        total_days = []
        for i in range(len(all_month_date)):
            total_leaves  = get_user_month_leave_count(_user_id, all_month_date[i])
            if i<int(_current_date.strftime("%d")):
                total_days.append(1)
                total_no_of_weekoff = get_total_no_of_weekoff(_user_id, all_month_date[i])
                total_no_of_weekoff_list.append(total_no_of_weekoff)
                now_leaves_list.append(total_leaves)
                
            total_leaves_list.append(total_leaves)

        total_no_of_weekoff = sum(total_no_of_weekoff_list)     
        total_leaves        = sum(total_leaves_list)
        now_total_leaves    = sum(now_leaves_list)
        
        leave_date_day      = datetime.strptime(str(_current_date.strftime("%Y-%m-%d")), '%Y-%m-%d').strftime('%A')
        user_week_off_day   = SpBasicDetails.objects.filter(user_id=_user_id).values('week_of_day').first()

        if get_user_leave(_user_id,_current_date.strftime("%Y-%m-%d")):
            on_leave = 2
        elif str(user_week_off_day['week_of_day']) == str(leave_date_day): 
            on_leave = 1
        else:
            on_leave = 0    

        today_attendance   = SpUserAttendance.objects.filter(start_time__isnull=False,user_id = _user_id).filter(attendance_date_time__icontains=_current_date.strftime("%Y-%m-%d")).count()
        total_absent = (int(sum(total_days))-int(total_no_of_weekoff))-float(now_total_leaves)
        
        if int(today_attendance) == 0:
            total_absent = (float(total_absent)-int(total_present))-1
        else:
            total_absent = float(total_absent)-int(total_present)
        working_hours = SpUserAttendance.objects.filter(user_id = _user_id).filter(attendance_date_time__contains = _current_date)

        for each_time in working_hours:
            if each_time.start_time is None or each_time.start_time == '':
                pass
            else:
                start_time  = each_time.start_time
            if each_time.end_time == '' or each_time.end_time is None:
                pass
            else:
                end_time    = each_time.end_time
            
        if end_time == '' or end_time is None or start_time == '' or start_time is None:
            hours_worked = ''
        else:
            hours_worked = str(datetime.strptime(end_time, '%H:%M:%S') - datetime.strptime(start_time, '%H:%M:%S'))

        
        last_seven_date_from_current = _current_date - timedelta(days=6)
        graph_data=[]

       
        
        if getModelColumnById(SpUsers, request.data.get("user_id"), 'periphery')is None or getModelColumnById(SpUsers, request.data.get("user_id"), 'periphery') == '':
            periphery = '500'
        else:
            periphery = getModelColumnById(SpUsers, request.data.get("user_id"), 'periphery')
    
       
                
                
                
        holidays = SpHolidays.objects.filter(start_date__month = date.today().strftime('%m'),start_date__year = date.today().strftime('%Y'))
        holiday_lists= []
        
        for holiday in holidays:
            holiday_list = getHoilydayDates(holiday.start_date,holiday.end_date)
            holiday_dict = {}
            current_date = date.today().strftime('%Y-%m-%d')
            applicable_to = holiday.applicable_to.split(',')
            role_id = getModelColumnById(SpUsers, request.data.get("user_id"), 'role_id')
            if str(current_date) in holiday_list and str(role_id) in applicable_to:
                holiday_dict['holiday_name'] = holiday.holiday
                holiday_lists.append(holiday_dict)
                
                
        week_of_day_list = getModelColumnByColumnId(SpBasicDetails,'user_id',request.data.get("user_id"),'week_of_day')
        week_of_day_list  = week_of_day_list.split(',')
        
        
        if holiday_lists:
            is_holiday = 1
            
        else:
            is_holiday = 0
            
            
        if date.today().strftime('%A') in week_of_day_list:
            is_week_of = 1
            
        else:
            is_week_of = 0
        
        
        
        
        
        
        
        total_presentss   = 0
        total_leave     = 0
        total_absent    = 0
        
        total_week_of    = 0
        total_holiday    = 0
        
        user_id = request.data.get('user_id')
        current_date  = datetime.today()
        all_month_date  = days_cur_month(current_date.day, current_date.month, current_date.year)

        user_week_off_day   = SpBasicDetails.objects.filter(user_id=user_id).first()
        user_week_off_day = user_week_off_day.week_of_day.split(',')

        role_id = getModelColumnById(SpUsers,user_id,'role_id')
        
        for i in range(len(all_month_date)):
            attendance_dict = {}
            leave_date_day      = datetime.strptime(str(all_month_date[i]), '%Y-%m-%d').strftime('%A')
            total_presents   = SpUserAttendance.objects.filter(start_time__isnull=False, user_id=user_id).filter(attendance_date_time__icontains=all_month_date[i]).count()
            if total_presents > 0:
                attendance_dict['attendance'] = 1  
                total_presentss+=1
            elif checkHoliday(all_month_date[i],role_id):
                total_holiday+=1
            elif str(leave_date_day) in user_week_off_day: 
                total_week_of+=1
            elif get_user_leave(user_id,all_month_date[i]) :
                total_leave+=1
            else:
                total_presents   = SpUserAttendance.objects.filter(start_time__isnull=False, user_id=user_id).filter(attendance_date_time__icontains=all_month_date[i]).count()
                if total_presents > 0 and isHalfDay(user_id, all_month_date[i]) == True:
                    pass
                elif total_presents > 0:
                    pass
                else:
                    if checkDateIsFutureDate(all_month_date[i]):
                        if isHalfDay(user_id, all_month_date[i]):
                            pass
                        else:
                            pass 
                    else:
                        if isHalfDay(user_id, all_month_date[i]):    
                            pass
                        else:
                            total_absent+=1
                            
                   
        context = {}
        context['is_holiday']       = is_holiday
        context['is_week_of']       = is_week_of
        
        context['periphery']        = periphery
        # context['timing']           = timing 
        # context['check_in_periphery']  = getModelColumnById(Configuration, 1, 'check_in_periphery')
        context['graph_data']       = graph_data
        context['total_present']    = total_presentss
        context['total_leave']      = total_leave
        context['total_absent']     = total_absent
        context['start_time']       = start_time
        context['end_time']         = end_time
        context['working_hours']    = hours_worked
        context['on_leave']         = on_leave
        # context['total_calls']      = all_calls
        # context['avg_tot_calls']    = round(monthly_calls/len(all_month_date), 2)
        # context['monthly_tot_calls']= monthly_calls

        context['new_calls']        = len(new_outlets)
        context['monthly_new_calls']= len(monthly_outlets)
        context['avg_new_calls']    = round(len(monthly_outlets)/len(all_month_date), 2)

        # context['productive_call']  = len(productivity_call)
        # context['avg_productivity'] = round(len(monthly_productivity)/len(all_month_date), 2)
        # context['monthly_productivity'] = len(monthly_productivity)

        # context['activity_name']    = activity_type_name
        # context['distributor_name'] = distributor_name
        # context['beat_plan_name']   = beat_name
        # context['todays_todo']      = len(todays_todo)

        context['total_retail_time']  = total_retail_time
        context['montly_retail_time'] = monthly_retail_time
        context['attendance_type']    = SpUsers.objects.filter(id=request.data.get("user_id")).values_list('attendence_mode',flat=True).first()
        context['regularization_list']  = SpRegularization.objects.filter().values('id','regularization_type').order_by('regularization_type')
        context['reasons_list']     = SpReasons.objects.filter(status = 1).values('id','reason').order_by('reason')
        context['message']          = "Dashboard Data attained successfully"
        context['status']           = HTTP_200_OK

        return Response(context)
        




def checkHoliday(date,role_id):
    if SpHolidays.objects.filter(start_date__month = datetime.strptime(str(date), '%Y-%m-%d').strftime('%m'),start_date__year = datetime.strptime(str(date), '%Y-%m-%d').strftime('%Y'),holiday_status=3,status = 1).exists():
        holiday_id = SpHolidays.objects.filter(start_date__month = datetime.strptime(str(date), '%Y-%m-%d').strftime('%m'),start_date__year = datetime.strptime(str(date), '%Y-%m-%d').strftime('%Y'),holiday_status=3,status = 1).values_list('id',flat=True)
        holiday_ids = SpRoleEntityMapping.objects.filter(role_id = role_id,entity_type = 'holiday',entity_id__in = holiday_id).values_list('entity_id',flat=True)
        count = 0
        holiday_name_list = []
        for holiday_id in holiday_ids:
            last_date = getModelColumnById(SpHolidays,holiday_id,'end_date')
            last_date = last_date.strftime('%Y-%m-%d')
            last_date = datetime.strptime(str(last_date), '%Y-%m-%d')
            from_date = datetime.strptime(str(date), '%Y-%m-%d')#.strftime('%Y-%m-%d')
            delta = last_date - from_date
            start_date = getModelColumnById(SpHolidays,holiday_id,'start_date')
            start_date = start_date.strftime('%Y-%m-%d')
            start_date = datetime.strptime(str(start_date), '%Y-%m-%d')
            current_date = datetime.strptime(str(date), '%Y-%m-%d')
            if current_date>=start_date:
                if delta.days >= 0:
                    count+=1
                    holiday_name_list.append(getModelColumnById(SpHolidays,holiday_id,'holiday'))
        if count > 0:
            holi_list = []
            for x in holiday_name_list:
                if x not in holi_list:
                    holi_list.append(x)
            return holi_list
        else:
            return False 
    else:
        return False 
        
        
        

@csrf_exempt
@api_view(['POST'])
def getAttendanceData(request):
    if request.method == 'POST':
        if request.data.get("user_id")is None or request.data.get("user_id") == '':
            return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
        if request.data.get("current_date")is None or request.data.get("current_date") == '':
            return Response({'message': 'Date field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
        
        LEAVE_FLAG      = 0
        PRESENT_FLAG    = 1
        FUTURE_FLAG     = 2
        WEEK_OFF_FLAG   = 3
        ABSENT_FLAG     = 4
        
        today           = date.today()
        attendance_list = []
        
        total_presentss   = 0
        total_leave     = 0
        total_absent    = 0
        
        total_week_of    = 0
        total_holiday    = 0
        
        total_travelled = 0
        today_travelled = 0
        user_id         = request.data.get('user_id')
        current_date    = datetime.strptime(request.data.get('current_date'), "%Y-%m-%d")
        total_present   = SpUserAttendance.objects.filter(start_time__isnull=False, user_id=user_id).filter(attendance_date_time__month=current_date.month).filter(attendance_date_time__year=current_date.year).count()
        
        all_month_date  = days_cur_month(current_date.day, current_date.month, current_date.year)

        
        user_week_off_day   = SpBasicDetails.objects.filter(user_id=user_id).first()
        user_week_off_day = user_week_off_day.week_of_day.split(',')

        now_leaves_list             = []
        total_leaves_list           = []
        total_no_of_weekoff_list    = []
        total_days                  = []
        total_distance_travel       = []
        
        role_id = getModelColumnById(SpUsers,user_id,'role_id')
        
        for i in range(len(all_month_date)):
            attendance_dict = {}
            leave_date_day      = datetime.strptime(str(all_month_date[i]), '%Y-%m-%d').strftime('%A')
            total_presents   = SpUserAttendance.objects.filter(start_time__isnull=False, user_id=user_id).filter(attendance_date_time__icontains=all_month_date[i]).count()
            if total_presents > 0:
                attendance_dict['attendance'] = 1  
                total_presentss+=1
            elif checkHoliday(all_month_date[i],role_id):
                attendance_dict['attendance'] = 7
                attendance_dict['holiday_list'] = checkHoliday(all_month_date[i],role_id)
                total_holiday+=1
            elif str(leave_date_day) in user_week_off_day: 
                attendance_dict['attendance'] = 3
                
                total_week_of+=1
            elif get_user_leave(user_id,all_month_date[i]) :
                attendance_dict['attendance'] = 0
                total_leave+=1
            else:
                total_presents   = SpUserAttendance.objects.filter(start_time__isnull=False, user_id=user_id).filter(attendance_date_time__icontains=all_month_date[i]).count()
                if total_presents > 0 and isHalfDay(user_id, all_month_date[i]) == True:
                    attendance_dict['attendance'] = 6
                elif total_presents > 0:
                    # attendance_dict['attendance'] = 1  
                    # total_presentss+=1
                    pass
                else:
                    if checkDateIsFutureDate(all_month_date[i]):
                        if isHalfDay(user_id, all_month_date[i]):
                            attendance_dict['attendance'] = 5
                        else:
                            attendance_dict['attendance'] = 2   
                    else:
                        if isHalfDay(user_id, all_month_date[i]):    
                            attendance_dict['attendance'] = 5
                        else:
                            attendance_dict['attendance'] = 4  
                            total_absent+=1
            
            
            attendance_dict['date']                 = all_month_date[i]
            attendance_data = getAttendanceStartEndTime(user_id, all_month_date[i])
            if attendance_data['starting_time']:
                # attendance_dict['distance_travelled']   = getUserTravelData(user_id, all_month_date[i])
                attendance_dict['starting_time']        = attendance_data['starting_time']
                attendance_dict['ending_time']          = attendance_data['ending_time']
                attendance_dict['working_hours']        = attendance_data['working_hours']
            # else:
            #     attendance_dict['distance_travelled']   = 0
            # total_distance_travel.append(attendance_dict['distance_travelled'])        
            attendance_list.append(attendance_dict)

            total_leaves  = get_user_month_leave_count(user_id, all_month_date[i])
            
            if (str(current_date.strftime("%m")) == str(today.strftime("%m"))) and (str(current_date.strftime("%Y")) == str(today.strftime("%Y"))):
                if i<int(today.strftime("%d")):
                    total_days.append(1)
                    now_leaves_list.append(total_leaves)
            else:
                total_days.append(1)
                now_leaves_list.append(total_leaves)

            if i<=int(today.strftime("%d")):                          
                total_no_of_weekoff = get_total_no_of_weekoff(user_id, all_month_date[i])    
                total_no_of_weekoff_list.append(total_no_of_weekoff)
            total_leaves_list.append(total_leaves)
        
        total_no_of_weekoff = sum(total_no_of_weekoff_list)     
        total_leave         = sum(total_leaves_list)
        now_total_leaves    = sum(now_leaves_list)
        
        today_attendance   = SpUserAttendance.objects.filter(start_time__isnull=False, user_id = user_id).filter(attendance_date_time__icontains=today.strftime("%Y-%m-%d")).count()
         
        
        context = {}
        
        
        context['total_present']    = total_presentss
        context['total_leave']      = total_leave
        context['total_absent']     = total_absent
        context['total_week_of']     = total_week_of
        context['total_holiday']     = total_holiday
        
        # context['today_travelled']  = getUserTravelData(user_id, today.strftime("%Y-%m-%d"))
        # context['total_travelled']  = round(sum(total_distance_travel),2)
        context['attendance']       = attendance_list
        context['message']          = "Attendance Data has been received successfully"
        context['status']           = HTTP_200_OK
        return Response(context)




def convert(seconds):
    seconds = seconds % (24 * 3600)
    hour = seconds // 3600
    seconds %= 3600
    minutes = seconds // 60
    seconds %= 60
      
    return "%d:%02d:%02d" % (hour, minutes, seconds)

def getAttendanceStartEndTime(user_id, month_date):
    start_data      = SpUserAttendance.objects.filter(start_time__isnull=False,attendance_date_time__icontains=month_date,user_id=user_id).order_by('id').first()
    end_data        = SpUserAttendance.objects.filter(end_time__isnull=False,attendance_date_time__icontains=month_date,user_id=user_id).order_by('-id').first()
    
    try:
        user_attendance = SpUserAttendance.objects.filter(attendance_date_time__icontains=month_date, user_id=user_id).order_by('-id').first()
    except SpUserAttendance.DoesNotExist:
        user_attendance = None

    start_datetime  = ''
    end_datetime    = ''
    working_hours   = ''
    if user_attendance:
        if user_attendance.start_time is not None and user_attendance.end_time is None:
            status = 1
        elif user_attendance.start_time is None and user_attendance.end_time is not None:
            status = 0
        else:
            status = 0
        now = datetime.now().strftime('%Y-%m-%d')
        start_datetime = now + ' '+start_data.start_time
        if status == 0:
            end_datetime = now + ' '+end_data.end_time

            start_datetime = datetime.strptime(start_datetime, '%Y-%m-%d %H:%M:%S')
            end_datetime = datetime.strptime(end_datetime, '%Y-%m-%d %H:%M:%S')
            time_delta = (end_datetime - start_datetime)
            total_seconds = time_delta.total_seconds()
            hours = convert(total_seconds)
            working_hours = str(hours)

            start_datetime = datetime.strptime(str(start_datetime), '%Y-%m-%d %H:%M:%S').strftime('%H:%M:%S')
            end_datetime   = datetime.strptime(str(end_datetime), '%Y-%m-%d %H:%M:%S').strftime('%H:%M:%S')
        else:
            end_datetime = ''
            start_datetime = datetime.strptime(str(start_datetime), '%Y-%m-%d %H:%M:%S').strftime('%H:%M:%S')

    attendance_timing = {}
    attendance_timing['starting_time']  = start_datetime
    attendance_timing['ending_time']    = end_datetime
    attendance_timing['working_hours']  = working_hours

    return attendance_timing  

@csrf_exempt
@api_view(["POST"])
def userLocationLog(request):
    if request.data.get("user_id") is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("status") is None or request.data.get("status") == '':
        return Response({'message': 'Status field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("date_time") is None or request.data.get("status") == '':
        return Response({'message': 'Date Time field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    user_id = request.data.get("user_id")
    status = request.data.get("status")
    today = datetime.now()
    try:
        email = SpUsers.objects.get(id=user_id)
    except SpUsers.DoesNotExist:
        email = None
    try:
        user_tracking = SpUserTracking.objects.filter(
            user_id=user_id).order_by('-id').count()
        if user_tracking > 1:
            user_tracking = SpUserTracking.objects.filter(
                user_id=user_id).order_by('-id')[1]
        else:
            user_tracking = SpUserTracking.objects.filter(
                user_id=user_id).order_by('-id')[0]
    except SpUserTracking.DoesNotExist:
        user_tracking = None
    if status == '1':
        pre_date_time = datetime.strptime(
            request.data.get("date_time"), '%Y-%m-%d %H:%M:%S')
        if email.official_email:
            user_email = email.official_email
            user_name = email.first_name
            location_log = SpUserLocationLogs.objects.filter(
                user_id=user_id, created_at__icontains=today.strftime("%Y-%m-%d"), status=1).last()
            if location_log:
                diff = today - location_log.created_at
                diff_minutes = (diff.days * 24 * 60) + (diff.seconds/60)
            else:
                diff_minutes = 3
            if user_tracking:
                latitude = user_tracking.latitude
                longitude = user_tracking.longitude
                last_loc_date = user_tracking.created_at
            date_time = datetime.now()
            message = {
                'subject': f'Employee App Notification - App not reachable ({user_name})',
                'text_content': 'Here is the message',
                'from_email'    : 'balineemilk@outlook.com',
                'recipients'    : ['mohdsubhani33143@gmail.com'
 
                              ],
                'template': "email-templates/user-notification.html",
                'context': {
                    "user_name":   user_name,
                    "date_time":   date_time,
                    "pre_date_time":   pre_date_time,
                    "latitude":   latitude,
                    "longitude":   longitude,
                    "last_loc_date":   last_loc_date,
                    "status":   1,
                }
            }

            user_message = {
                'subject': 'Employee App Notification - App not reachable',
                'text_content': 'Here is the message',
                'from_email': 'balineemilk@outlook.com',
                'recipients': [user_email],
                'template': "email-templates/users-notification.html",
                'context': {
                    "user_name":   user_name,
                    "date_time":   date_time,
                    "pre_date_time":   pre_date_time,
                    "status":   1,
                }
            }
        else:
            return Response({'message': 'E-mail Id Not Exist', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        if diff_minutes > 2:
            send_mass_mail([message])
            send_mass_mail([user_message])
            user_location_log = SpUserLocationLogs()
            user_location_log.user_id = user_id
            user_location_log.particular = 'Internet data is off'
            user_location_log.status = 1
            user_location_log.save()
    else:
        if email.official_email:
            location_log = SpUserLocationLogs.objects.filter(
                user_id=user_id, created_at__icontains=today.strftime("%Y-%m-%d"), status=0).last()
            if location_log:
                diff = today - location_log.created_at
                diff_minutes = (diff.days * 24 * 60) + (diff.seconds/60)
            else:
                diff_minutes = 3
            user_email = email.official_email
            user_name = email.first_name
            if user_tracking:
                latitude = user_tracking.latitude
                longitude = user_tracking.longitude
            date_time = datetime.now()
            message = {
                'subject': f'Employee App Notification - GPS Off ({user_name})',
                'text_content': '',
                'from_email'    : 'balineemilk@outlook.com',
                'recipients'    : ['mohdsubhani33143@gmail.com'
                              ],
                'template': "email-templates/user-notification.html",
                'context': {
                    "user_name":   user_name,
                    "date_time":   date_time,
                    "latitude":   latitude,
                    "longitude":   longitude,
                    "status":   0,
                }
            }

            user_message = {
                'subject': 'Employee App Notification - GPS Off',
                'text_content': '',
                'from_email': 'balineemilk@outlook.com',
                'recipients': [user_email],
                'template': "email-templates/users-notification.html",
                'context': {"user_name":   user_name,
                            "date_time":   date_time,
                            "status":   0,
                            }
            }

        else:
            return Response({'message': 'E-mail Id Not Exist', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
        # location_log = SpUserLocationLogs.objects.filter(user_id=user_id, created_at__icontains=today.strftime("%Y-%m-%d")).last()
        # today = datetime.strptime(today.strftime("%d/%m/%Y %H:%M"), '%d/%m/%Y %H:%M')
        # created_at = datetime.strptime(location_log.created_at.strftime("%d/%m/%Y %H:%M"), '%d/%m/%Y %H:%M')
        if diff_minutes > 2:
            # send_mass_mail([user_message])
            send_mass_mail([message])
            user_location_log = SpUserLocationLogs()
            user_location_log.user_id = user_id
            user_location_log.particular = 'GPS Location is off'
            user_location_log.status = 0
            user_location_log.save()
    context = {}
    context['response_code'] = HTTP_200_OK
    context['message'] = 'Success'
    return Response(context, status=HTTP_200_OK)


@csrf_exempt
@api_view(["POST"])
def notificationList(request):

    if request.data.get("page_limit")is None or request.data.get("page_limit") == '':
        return Response({'message': 'Page limit is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

    page_limit  = int(request.data.get("page_limit"))*30
    offset      = int(page_limit)-30
    page_limit  = 30

    try:
        notification_list = SpNotifications.objects.filter(to_user_id=request.user.id,to_user_type=1).values('id','row_id','model_name','sub_module', 'heading', 'activity', 'activity_image', 'from_user_id', 'from_user_name', 'icon', 'platform_icon', 'read_status', 'created_at','iso_type','redirect_date').order_by('-id')[offset:offset+page_limit]
    except SpAddresses.DoesNotExist:
        notification_list = None
    if notification_list:
        for notification in notification_list:
            if notification['activity_image']:
                notification['activity_image'] = baseurl+'/'+notification['activity_image']
            else:
                notification['activity_image'] = ''
            now = datetime.now()    
            notification['created_at'] = timeago.format(str(notification['created_at']), now)        
    else:    
        notification_list = []  

    notification_count = SpNotifications.objects.filter(to_user_id=request.user.id,to_user_type=1).values('id').count()
    if notification_count is not None:
        notification_count = math.ceil(round(notification_count/10, 2))
    else:
        notification_count = 0

    context = {}
    context['message']              = 'Success'
    context['notification_list']    = notification_list
    context['notification_count']   = notification_count
    context['response_code']        = HTTP_200_OK

    return Response(context, status=HTTP_200_OK)



@csrf_exempt
@api_view(["POST"])
def saveUserRegularizationData(request):
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("to_date"):
        is_exists = checkRegularizationAppliedOrNot(request.data.get("user_id"), request.data.get("from_date"), request.data.get("to_date"))
        isLeaveAppliedOrNot  = checkLeaveAppliedOrNot(request.data.get("user_id"), request.data.get("from_date"), request.data.get("to_date"))
    else:
        is_exists = checkRegularizationAppliedOrNot(request.data.get("user_id"), request.data.get("from_date"), request.data.get("from_date"))
        isLeaveAppliedOrNot  = checkLeaveAppliedOrNot(request.data.get("user_id"), request.data.get("from_date"), request.data.get("from_date"))
    
    if is_exists['status'] == True:
        return Response({'message': 'You have already request on selected dates, kindly select another date', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if isLeaveAppliedOrNot['status'] == True:
        return Response({'message': 'You have already marked leave on selected dates, kindly select another date', 'response_code':HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    else:    
        user                                = SpUserRegularization()
        user.user_id                        = request.data.get("user_id") 
        user.user_name                      = getUserName(request.data.get("user_id"))  
        user.regularization_type_id         = request.data.get("regularization_type_id")
        user.regularization_type_name       = getModelColumnById(SpRegularization, request.data.get("regularization_type_id"), 'regularization_type')
        user.from_date                      = request.data.get("from_date")
        user.from_time                      = request.data.get("from_time")
        user.to_date                        = request.data.get("to_date")
        user.to_time                        = request.data.get("to_time")
        user.mobile_no                      = request.data.get("mobile_no")
        user.place                          = request.data.get("place")
        user.reason_for_leave               = request.data.get("reason_for_leave")
        user.manager                        = request.data.get("manager")
        user.hod                            = request.data.get("hod")
        user.save()

        user_name   = getUserName(request.user.id)
        heading     = 'Regularization request has been generated'
        activity    = 'Regularization request has been generated by '+user_name+' on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p') 
        
        saveActivity('Regularization', 'Regularization request', heading, activity, request.user.id, user_name, 'UserCredentialChange.png', '2', 'app.png')
        sendRegularizationNotificationToUsers(user.id,'', 'add', 0, request.user.id, user_name, 'SpUserRegularization',request.user.role_id)
        
        context = {}
        context['message']      = 'Data has been successfully saved'
        context['response_code'] = HTTP_200_OK
        
        return Response(context, status=HTTP_200_OK)
        

@csrf_exempt
@api_view(["POST"])
def leaveForword(request):    
    if request.data.get("leave_id")is None or request.data.get("leave_id") == '':
        return Response({'message': 'Leave id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("leave_status")is None or request.data.get("leave_status") == '':
        return Response({'message': 'Leave id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    
    try:
        leave  = SpUserLeaves.objects.get(id = request.data.get("leave_id"))
        leave.leave_status = request.data.get("leave_status")
        leave.save()
        user_id  = leave.user_id
        user_name   = request.user.first_name+' '+request.user.middle_name+' '+request.user.last_name
        userFirebaseToken = getModelColumnById(SpUsers,user_id,'firebase_token')
        employee_name = getUserName(user_id)

        
        if request.data.get("leave_status") == '2':
            message_title = "Leave Request has been accepted"
            message_body = 'Leave Request has been accepted by '+user_name+' on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p') 
        else:
            message_title = "Leave Request has been declined"
            message_body = 'Leave Request has been declined by '+user_name+' on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p')
        notification_image = ""
        if request.data.get("leave_status") == '2':
                msg = 'Handover request has been accepted'
        else:
            msg = 'Handover request has been declined'
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
        saveNotification(leave.id,'SpUserLeaves','Users Management',msg,message_title,message_body,notification_image,request.user.id,user_name,user_id,employee_name,'profile.png',2,'app.png',1,1)
        #-----------------------------save notification block----------------------------#
    except SpUserLeaves.DoesNotExist:
        leave  = None
    context = {}
    if leave:
        if request.data.get("leave_status") == '2':
            context['message']                  = 'Handover request has been accepted'
        else:
            context['message']                  = 'Handover request has been declined'
    else:
         context['message']                  = 'Leave Request has been failed'
    return Response(context, status=HTTP_200_OK) 



@csrf_exempt
@api_view(["POST"])       
def uploadPendingUserLeaveDocument(request):
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("user_leave_id")is None or request.data.get("user_leave_id") == '':
        return Response({'message': 'User Leave Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("document")is None or request.data.get("document") == '':
        return Response({'message': 'Document field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("document_id")is None or request.data.get("document") == '':
        return Response({'message': 'document id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    
    document_id  = request.data.get('document_id')
    document_id = document_id.split(',')
    
    if bool(request.FILES.get('document', False)) == True:
        for i,document in enumerate(request.FILES.getlist('document')):
            # uploaded_attachment = request.FILES['attachment']
            storage = FileSystemStorage()
            timestamp = int(time.time())
            attachment_name = document.name
            temp = attachment_name.split('.')
            attachment_name = 'leave-document/leave_attachment_'+str(timestamp)+"."+temp[(len(temp) - 1)]
            attachment = storage.save(attachment_name, document)
            attachment = storage.url(attachment)  
            doc = SpUserLeaveDocument()  
            doc.user_id = request.data.get("user_id")
            doc.user_leave_id = request.data.get("user_leave_id")
            doc.leave_type_document_id = document_id[i]
            doc.document = attachment
            doc.save()
    context = {}
    context['message']              = 'Document has been uploaded successfully'
    context['response_code']        = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)
        


def sendRegularizationNotificationToUsers(row_id, row_code, permission_slug, sub_module_id, user_id, user_name, model_name, role_id):
    user_wf_level = SpRoleWorkflowPermissions.objects.filter(permission_slug=permission_slug, sub_module_id=sub_module_id, role_id=role_id).values('level_id').distinct().count()
    user_role_wf_permission = SpUserRoleWorkflowPermissions.objects.filter(permission_slug=permission_slug, sub_module_id=sub_module_id, user_id=user_id, status=1).exclude(level_id=1).order_by('level_id')
    
    for wf_permission in user_role_wf_permission:
        user_details = SpUsers.objects.filter(status=1, role_id=wf_permission.workflow_level_role_id)
        if user_wf_level != 1:
            for user_detail in user_details:
                data                    = SpApprovalStatus()
                data.row_id             = row_id
                data.model_name         = model_name
                data.initiated_by_id    = user_id
                data.initiated_by_name  = user_name
                data.user_id            = user_detail.id
                if user_detail.middle_name:
                    data.user_name          = user_detail.first_name+' '+user_detail.middle_name+' '+user_detail.last_name
                else:
                    data.user_name          = user_detail.first_name+' '+user_detail.last_name
                data.role_id            = wf_permission.workflow_level_role_id
                data.sub_module_id      = wf_permission.sub_module_id
                data.permission_id      = wf_permission.permission_id
                data.permission_slug    = wf_permission.permission_slug
                data.level_id           = wf_permission.level_id
                data.level              = wf_permission.level
                data.status             = 0
                data.save()
  
    if user_wf_level == 1:
        model                 = SpUserRegularization.objects.get(id=row_id)   
        model.regularization_status   = 1
        model.save()
    else:
        model                 = SpUserRegularization.objects.get(id=row_id)   
        model.regularization_status   = 1
        model.save()





def saveAttendanceData(id):
    regularizations = SpUserRegularization.objects.get(id=id)
    if regularizations.from_date and regularizations.to_date:
        no_of_days = days_between(str(regularizations.from_date), str(regularizations.to_date))
    else:
        no_of_days = days_between(str(regularizations.from_date), str(regularizations.from_date))  

    for i in range(0, int(no_of_days)):
        start_date      = (datetime.strptime(str(regularizations.from_date), '%Y-%m-%d')+timedelta(days=i)).strftime('%Y-%m-%d')
        end_date        = (datetime.strptime(str(regularizations.from_date), '%Y-%m-%d')+timedelta(days=i)).strftime('%Y-%m-%d')
        start_date_day  = datetime.strptime(str(start_date), '%Y-%m-%d').strftime('%A')
        if start_date_day != 'Sunday':
            if regularizations.regularization_type_id == 1:
                start_date_time = str(start_date)+' '+str(getConfigurationResult('office_start_time'))
                end_date_time   = str(end_date)+' '+str(getConfigurationResult('office_end_time'))
                #start time
                data                        = SpUserAttendance()
                data.user_id                = regularizations.user_id
                data.attendance_date_time   = start_date_time
                data.start_time             = getConfigurationResult('office_start_time')
                data.end_time               = None
                data.dis_ss_id              = regularizations.user_id
                data.latitude               = None
                data.longitude              = None
                
                data.attendance_type        = 1
                data.status                 = 1
                data.save()

                #end time
                data                        = SpUserAttendance()
                data.user_id                = regularizations.user_id
                data.attendance_date_time   = end_date_time
                data.end_time               = getConfigurationResult('office_end_time')
                data.start_time               = None
                data.dis_ss_id              = regularizations.user_id
                data.latitude               = None
                data.longitude              = None
                
                data.attendance_type    = 1
                data.status             = 1
                data.save()
            else:
                start_time = str(regularizations.from_time)+':00'
                start_date_time = str(start_date)+' '+str(start_time)
                #start time
                data                        = SpUserAttendance()
                data.user_id                = regularizations.user_id
                data.attendance_date_time   = start_date_time
                data.start_time             = start_time
                data.end_time               = None
                data.dis_ss_id              = regularizations.user_id
                data.latitude               = None
                data.longitude              = None
                
                data.attendance_type    = 1
                data.status             = 1
                data.save()
         
    return True  



def date_diff_in_seconds(dt2, dt1):
  timedelta = dt2 - dt1
  return timedelta.days * 24 * 3600 + timedelta.seconds

def dhms_from_seconds(seconds):
	minutes, seconds = divmod(seconds, 60)
	hours, minutes = divmod(minutes, 60)
	days, hours = divmod(hours, 24)
    #return (hours, minutes, seconds)
	return (hours)

#user day out
@api_view(["GET"])
@permission_classes((AllowAny,))
def userDayOut(request):
    today   = date.today()
    context = {}
    
    user_attendance         = SpUserAttendance.objects.filter(attendance_date_time__icontains=today.strftime("%Y-%m-%d")).order_by('user_id').values('user_id').distinct()
    for attendance in user_attendance:
        user_attendance     = SpUserAttendance.objects.filter(attendance_date_time__icontains=today.strftime("%Y-%m-%d"), user_id=attendance['user_id']).order_by('-id').first()
        if user_attendance.start_time is not None and user_attendance.end_time is None:
            start_time      = user_attendance.created_at
            start_time      = datetime.strptime(str(start_time), '%Y-%m-%d %H:%M:%S')
            end_time        = datetime.now()
            
            second = date_diff_in_seconds(end_time,start_time)
            diff   = dhms_from_seconds(second)
            if diff >= 8.5:
                now  = datetime.now().strftime('%H:%M:%S')
                data                        = SpUserAttendance()
                data.user_id                = attendance['user_id']
                data.attendance_date_time   = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                data.start_time             = None
                data.end_time               = now
                data.dis_ss_id              = None
                data.attendance_type        = 2
                data.latitude               = None
                data.longitude              = None
                data.status                 = 1
                data.save()
                AuthtokenToken.objects.filter(user_id=attendance['user_id']).delete()
    context['response_code']    = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)



@api_view(["GET"])
@permission_classes((AllowAny,))
def mappLeavePolicyToLeaveLedegr(request):
    users = SpUsers.objects.filter(status = 1,user_type = 1)
    for user in users:
        mapUserLeaves(user.role_id,user.id)
    context = {}
    context['message']    = 'Leave ledger update successfully'
    context['response_code']    = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)

def mapUserLeaves(role_id,user_id):
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
            current_month = 2
            if int(current_month) == 1:
                month_leave_count = policy_detail.year_leave_count / 12
                leave_polcy_ledger.year_leave_count = policy_detail.year_leave_count
                leave_polcy_ledger.month_leave_count = round(month_leave_count,1)
            else:   
                current_month = 12 - int(current_month)
                sub_leave_count = policy_detail.year_leave_count / 12
                year_leave_count = sub_leave_count*current_month
                month_leave_count = year_leave_count  / current_month
                leave_polcy_ledger.year_leave_count = year_leave_count
                leave_polcy_ledger.month_leave_count = round(month_leave_count,1)
                
            #year_leave_count = policy_detail.year_leave_count
            #leave_polcy_ledger.consecutive_leave = policy_detail.consecutive_leave 
            #leave_polcy_ledger.credit = round(year_leave_count,1)
            year_leave_counts = policy_detail.year_leave_count
            leave_polcy_ledgers = round(year_leave_counts,1)
            leave_polcy_ledger.year_leave_count=leave_polcy_ledgers
           
            leave_polcy_ledger.consecutive_leave = policy_detail.consecutive_leave 
            leave_polcy_ledger.credit = year_leave_count 
            last = SpUserLeavePolicyLedger.objects.filter(user_id = user_id).last()
           
            if last:
                if last.balance:
                    balance = float(year_leave_count) + float(last.balance)
                else:
                    balance = year_leave_count
            else:
                balance = year_leave_count

            leave_polcy_ledger.balance = round(balance,1)
            leave_polcy_ledger.save()


 
@csrf_exempt
@api_view(["POST"])  
def attendanceCount(request):
    context = {}
    today   = date.today()
    staffs = SpUsers.objects.raw('''SELECT DISTINCT sp_users.id, sp_users.* FROM sp_users LEFT JOIN sp_user_attendance on
    sp_user_attendance.user_id = sp_users.id WHERE sp_users.status = 1 AND sp_users.role_id !=0 AND sp_users.role_id !=1 AND sp_users.user_type = 1
    ORDER BY sp_users.id DESC ''')
   
    present_count = 0
    absent_count = 0
    week_off_count = 0
    for staff in staffs:
        if request.data.get('date'):
            today_date                = datetime.strptime(str(request.data.get('date')), '%d/%m/%Y').strftime('%Y-%m-%d')
            if checkAttendance(today_date, staff.id):
                present_count = present_count +1
            elif checkLeave(today_date, staff.id):
                absent_count = absent_count +1
            elif checkWeekOfDay(today_date,staff.id):
                week_off_count = week_off_count + 1
            else:
                absent_count = absent_count +1
        else:
            if checkAttendance(today, staff.id):
                present_count = present_count +1
            elif checkLeave(today, staff.id):
                absent_count = absent_count +1
            elif checkWeekOfDay(today,staff.id):
                week_off_count = week_off_count + 1
            else:
                absent_count = absent_count +1
       
    
    context['total_employee'] = SpUsers.objects.filter(status = 1, user_type= 1).exclude(role_id = 1).exclude(role_id=  0).count()
    context['present_count'] = present_count
    context['absent_count'] = absent_count
    context['week_off_count'] = week_off_count
    context['message']       = 'success'
    context['response_code'] = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)   
 
    
       
@csrf_exempt
@api_view(["POST"])  
def attendanceDetails(request):
    context = {}
    today   = date.today()
    if request.data.get("type") is None or request.data.get("type") == '':
        return Response({'message': 'Type field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
        
    if request.data.get("date") is None or request.data.get("date") == '':
        return Response({'message': 'Date field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
        
    if request.data.get("page_limit") is None or request.data.get("page_limit") == '':
        return Response({'message': 'Page Limit field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 

    page_limit  = int(request.data.get("page_limit"))*10
    offset      = int(page_limit)-10
    page_limit  = 10
    
    staffs = SpUsers.objects.raw('''SELECT DISTINCT sp_users.id, sp_users.* FROM sp_users LEFT JOIN sp_user_attendance on
    sp_user_attendance.user_id = sp_users.id WHERE sp_users.status = 1 AND sp_users.role_id !=0 AND sp_users.role_id !=1 AND sp_users.user_type = 1
    ORDER BY sp_users.id DESC ''')
    condition = ""
    if request.data.get("search"):
        condition += "CONCAT_WS( ' ',sp_users.first_name, sp_users.middle_name, sp_users.last_name ) like '%%" + str(request.data.get('search')) + "%%' "
        
        staffs = SpUsers.objects.raw('''SELECT DISTINCT sp_users.id, sp_users.* FROM sp_users LEFT JOIN sp_user_attendance on
        sp_user_attendance.user_id = sp_users.id WHERE sp_users.status = 1 AND sp_users.role_id !=0 AND sp_users.role_id !=1 AND sp_users.user_type = 1 and {condition}
        ORDER BY sp_users.id DESC '''.format(condition=condition))
        
    staff_details = []
    count = 0
    for staffs in staffs:
        staff = {}
        if request.data.get('type') == '0':
            count =count +1 
            staff['employee_code'] = getModelColumnById(SpUsers, staffs.id, 'emp_sap_id')
            staff['employee_name'] = getUserName(staffs.id)
            staff['department'] = getModelColumnById(SpUsers, staffs.id, 'department_name')
            staff['role'] = getModelColumnById(SpUsers, staffs.id, 'role_name')
            staff['profile_image'] = getModelColumnById(SpUsers, staffs.id, 'profile_image')
            staff_details.append(staff)
            
        if request.data.get('type') == '1':
            if request.data.get('date'):
               
                today_date                = datetime.strptime(str(request.data.get('date')), '%d/%m/%Y').strftime('%Y-%m-%d')
                
                if SpUserAttendance.objects.filter(user_id=staffs.id,attendance_date_time__contains=today_date).exists():
                    count =count +1 
                    staff['employee_code'] = getModelColumnById(SpUsers, staffs.id, 'emp_sap_id')
                    staff['employee_name'] = getUserName(staffs.id)
                    staff['department'] = getModelColumnById(SpUsers, staffs.id, 'department_name')
                    staff['role'] = getModelColumnById(SpUsers, staffs.id, 'role_name')
                    staff['profile_image'] = getModelColumnById(SpUsers, staffs.id, 'profile_image')
                    staff_details.append(staff)
           
        weekoff = 0       
        if request.data.get('type') == '2':
            if request.data.get('date'):
                today_date                = datetime.strptime(str(request.data.get('date')), '%d/%m/%Y').strftime('%Y-%m-%d')
                if checkWeekOfDay(today_date,staffs.id):
                    count =count +1 
                    weekoff = weekoff + 1
                    staff['employee_code'] = getModelColumnById(SpUsers, staffs.id, 'emp_sap_id')
                    staff['employee_name'] = getUserName(staffs.id)
                    staff['department'] = getModelColumnById(SpUsers, staffs.id, 'department_name')
                    staff['role'] = getModelColumnById(SpUsers, staffs.id, 'role_name')
                    staff['profile_image'] = getModelColumnById(SpUsers, staffs.id, 'profile_image')
                    staff_details.append(staff)
                    
        if request.data.get('type') == '3':
            if request.data.get('date'):
                today_date                = datetime.strptime(str(request.data.get('date')), '%d/%m/%Y').strftime('%Y-%m-%d')
                if SpUserAttendance.objects.filter(user_id=staffs.id,attendance_date_time__contains=today_date).exists():
                    pass
                elif checkWeekOfDay(today_date,staffs.id):
                    pass
                else:
                    count =count +1
                    staff['employee_code'] = getModelColumnById(SpUsers, staffs.id, 'emp_sap_id')
                    staff['employee_name'] = getUserName(staffs.id)
                    staff['department'] = getModelColumnById(SpUsers, staffs.id, 'department_name')
                    staff['role'] = getModelColumnById(SpUsers, staffs.id, 'role_name')
                    staff['profile_image'] = getModelColumnById(SpUsers, staffs.id, 'profile_image')
                    staff_details.append(staff)
    
       
    

    if len(staff_details)>0:
        staff_details_count = math.ceil(round(len(staff_details)/10, 2))
    else:
        staff_details_count = 0
    context['staff_details'] = staff_details[offset:offset+page_limit]
    context['staff_details_count'] = staff_details_count
    context['attendance_count'] =  count
    context['message']       = 'success'
    context['response_code'] = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)   
 

def checkWeekOfDay(date,user_id):
    user_week_of_day = getModelColumnByColumnId(SpBasicDetails,'user_id',user_id,'week_of_day')
    if user_week_of_day:
        user_week_of_day = user_week_of_day.split(',')
        week_day = datetime.strptime(str(date), '%Y-%m-%d').strftime('%A')
        if week_day in user_week_of_day:
            return True
        else:
            return False
#done
def checkLeave(date, user_id):
    try:
        leaves = SpUserLeaves.objects.filter(leave_from_date__lte=date, leave_to_date__gte=date,leave_status=3,user_id=user_id).first()
    except SpUserLeaves.DoesNotExist:
        leaves = None
    if leaves:
        return getModelColumnById(SpLeaveTypes, leaves.leave_type_id, 'alias')
    else:
        return False

#done
def checkAttendance(date,user_id):
    if SpUserAttendance.objects.filter(user_id=user_id,attendance_date_time__contains=date).exists():
        return True
    else:
        return False
    
def checkAbsent(date,user_id):
    if SpUserAttendance.objects.filter(user_id=user_id,attendance_date_time__contains=date).exists():
        return False
    else:
        return True

#done
@csrf_exempt
@api_view(["POST"])
def SavetaRequestDetails(request):
    # Check if required fields are present and not empty
    required_fields = ["user_id", "visit_place", "visit_from_date", "visit_to_date", "total_expenses", "company_paid"]
    for field in required_fields:
        if not request.data.get(field):
            return Response({'message': f'{field} field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

    tadata = SpTaRequest()
    tadata.user_id = request.data.get("user_id")
    tadata.visit_place = request.data.get("visit_place")
    tadata.visit_from_date = request.data.get("visit_from_date")
    tadata.visit_to_date = request.data.get("visit_to_date")
    tadata.total_expenses = request.data.get("total_expenses")
    tadata.company_paid = request.data.get('company_paid')
    tadata.status = 0
    tadata.balance = request.data.get('balance')  
    tadata.save()
    user_name = getUserName(request.data.get('user_id'))
    ta_request_ids = tadata.id
    attachment_list1 = []
    attachments  = request.FILES.getlist('Stay_details_bill_image')
    for id, attachment in enumerate(attachments):
        folder  ='media/attachments/' 
        storage = FileSystemStorage(location=folder)
        timestamp = int(time.time())
        attachment_name = attachment.name
        temp = attachment_name.split('.')
        attachment_name = 'attachment_'+str(timestamp)+"_"+str(id)+"."+temp[(len(temp) - 1)]
        uploaded_attachment = storage.save(attachment_name, attachment)
        attachment = folder + attachment_name       
        attachment_list1.append(attachment)
        
    stay_details = request.data.get('stay_details')
    stay_details_data = stay_details
    stay_details_datas = json.loads(stay_details_data)
    for index, stay_detail in enumerate(stay_details_datas):
        tarequestdetails = SpTaRequestDetails()
        tarequestdetails.ta_request_id = ta_request_ids
        tarequestdetails.hotel_name = stay_detail['hotel_name']
        tarequestdetails.amount = stay_detail['amount']
        tarequestdetails.ta_details_type = 0
        #tarequestdetails.bill_image = attachment_list1
        if index < len(attachment_list1):
            tarequestdetails.bill_image = attachment_list1[index]
        else:
            tarequestdetails.bill_image = None
        tarequestdetails.save()
    # -----------------------------travelling-----------------------------
    attachment_list2 = []
    attachments2  = request.FILES.getlist('Travelling_details_bill_image')
    for id, attachment2 in enumerate(attachments2):
        folder  ='media/attachments2/' 
        storage = FileSystemStorage(location=folder)
        timestamp = int(time.time())
        travelling_attachment_name = attachment2.name
        temp = travelling_attachment_name.split('.')
        travelling_attachment_name = 'attachment_'+str(timestamp)+"_"+str(id)+"."+temp[(len(temp) - 1)]
        uploaded_attachment = storage.save(travelling_attachment_name, attachment2)
        attachment2 = folder + travelling_attachment_name       
        attachment_list2.append(attachment2)
    #travelling_details = request.data.get('travelling_details')
    travelling_detail = request.data.get('travelling_details')
    travelling_data = travelling_detail
    travelling_datas = json.loads(travelling_data)
    for index, travelling_detail in enumerate(travelling_datas):
        
        tarequestdetails = SpTaRequestDetails()
        tarequestdetails.ta_request_id = ta_request_ids
        tarequestdetails.ta_date = travelling_detail['taavelling_date']
        tarequestdetails.amount = travelling_detail['amount']
        tarequestdetails.remark = travelling_detail['remark']
        tarequestdetails.payment_type = travelling_detail['payment_type']
        tarequestdetails.ta_details_type = 1
        #tarequestdetails.bill_image = attachment_list2
        if index < len(attachment_list2):
            tarequestdetails.bill_image = attachment_list2[index]
        else:
            tarequestdetails.bill_image = None
        tarequestdetails.save()
        
    # -------------------------------food details---------------------------
    attachment_list3 = []
    attachments3  = request.FILES.getlist('food_details_bill_image')
    for id, attachment3 in enumerate(attachments3):
        folder  ='media/attachments3/' 
        storage = FileSystemStorage(location=folder)
        timestamp = int(time.time())
        food_attachment_name = attachment3.name
        temp = food_attachment_name.split('.')
        food_attachment_name = 'attachment_'+str(timestamp)+"_"+str(id)+"."+temp[(len(temp) - 1)]
        uploaded_attachment = storage.save(food_attachment_name, attachment3)
        attachment3 = folder + food_attachment_name       
        attachment_list3.append(attachment3)
    #food_details = request.data.get('food_details')
    food_detail = request.data.get('food_details')
    food_details_data = food_detail
    food_details_datas = json.loads(food_details_data)
    for index, food_detail in enumerate(food_details_datas):
        
        tarequestdetails = SpTaRequestDetails()
        tarequestdetails.ta_request_id = ta_request_ids
        tarequestdetails.ta_date = food_detail['date']
        tarequestdetails.amount = food_detail['amount']
        tarequestdetails.remark = food_detail['remark']
        tarequestdetails.ta_details_type = 2
        if index < len(attachment_list3):
            tarequestdetails.bill_image = attachment_list3[index]
        else:
            tarequestdetails.bill_image = None
        tarequestdetails.save()
    #---------------------------------miscellaneous details------------------------------
   
    attachment_list4 = []
    attachments4  = request.FILES.getlist('miscellaneous_details_bill_image')
    for id, attachment4 in enumerate(attachments4):
        folder  ='media/attachments4/' 
        storage = FileSystemStorage(location=folder)
        timestamp = int(time.time())
        miscellaneous_attachment_name = attachment4.name
        temp = miscellaneous_attachment_name.split('.')
        miscellaneous_attachment_name = 'attachment_'+str(timestamp)+"_"+str(id)+"."+temp[(len(temp) - 1)]
        uploaded_attachment = storage.save(miscellaneous_attachment_name, attachment4)
        attachment4 = folder + miscellaneous_attachment_name       
        attachment_list4.append(attachment4)
        
    #miscellaneous_details = request.data.get('miscellaneous_details')
    miscellaneous_detail = request.data.get('miscellaneous_details')
    miscellaneous_details_data = miscellaneous_detail
    miscellaneous_details_datas = json.loads(miscellaneous_details_data)
    for index, miscellaneous_detail in enumerate(miscellaneous_details_datas):
        
        tarequestdetails = SpTaRequestDetails()
        tarequestdetails.ta_request_id = ta_request_ids
       
        tarequestdetails.amount = miscellaneous_detail['amount']
        tarequestdetails.remark = miscellaneous_detail['remark']
        tarequestdetails.ta_details_type = 3
        if index < len(attachment_list4):
            tarequestdetails.bill_image = attachment_list4[index]
        else:
            tarequestdetails.bill_image = None
        tarequestdetails.save()
    heading = 'New Request TA has been initiated'
    activity = f"{user_name} TA has been created."
    saveActivity('TA Management', 'TA Request', heading, activity, request.user.id, user_name, 'add.png', '2', 'app.png')
    context = {}
    context['message'] = 'Request TA has been successfully sent.'
    context['response_code'] = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)




@csrf_exempt
@api_view(["POST"])
def gettaRequestDetails(request):
    if request.data.get("page_limit")is None or request.data.get("page_limit") == '':
        return Response({'message': 'Page limit is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)   
    page_limit  = int(request.data.get("page_limit"))*10
    offset      = int(page_limit)-10
    page_limit  = 10
    ta_list_count = SpTaRequest.objects.filter(user_id=request.data.get("user_id")).values('id').count()
    id = SpTaRequest.objects.filter(user_id=request.data.get("user_id")).values('id')
        
    if ta_list_count:
        ta_list_count    = math.ceil(round(ta_list_count/10, 2))
        ta_status     = SpTaRequest.objects.filter(user_id=request.data.get("user_id")).order_by('-id').first()
        ta_status     = ta_status.status 
    else:
        ta_list_count = 0 
        ta_status     = 0
    ta_lists = SpTaRequest.objects.filter(user_id=request.data.get("user_id")).values('id','user_id','visit_place','visit_from_date','visit_to_date','total_expenses','company_paid','balance','status','created_at').order_by('-id')[offset:offset+page_limit]
    context = {}
    context['message']              = 'Success'
    context['ta_list']              = list(ta_lists)
    context['ta_list_count']        = ta_list_count
    context['id']                   = id
    context['response_code']        = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)




@csrf_exempt
@api_view(["POST"])
def edittaRequestDetails(request):
    user_id = request.data.get("user_id")
    ta_request_id = request.data.get("ta_request_id")

    if user_id is None or user_id == '' or ta_request_id is None or ta_request_id == '':
        return Response({'message': 'User Id and TA request id fields are required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

    try:
        ta_request = SpTaRequest.objects.get(user_id=user_id, id=ta_request_id)
        stay_details = SpTaRequestDetails.objects.filter(ta_request_id=ta_request_id, ta_details_type=0)
        travelling_details = SpTaRequestDetails.objects.filter(ta_request_id=ta_request_id, ta_details_type=1)
        food_details = SpTaRequestDetails.objects.filter(ta_request_id=ta_request_id, ta_details_type=2)
        miscellaneous_details = SpTaRequestDetails.objects.filter(ta_request_id=ta_request_id, ta_details_type=3)

        # Serialize the list of SpTaRequestDetails
        stay_details_data = []
        for detail in stay_details:
            detail_data = {
                'id': detail.id,
                'hotel_name': detail.hotel_name,
                'amount': detail.amount,
                # 'bill_image': str(settings.BASE_URL) + str(detail.bill_image),
                'bill_image': str(settings.BASE_URL) + str(detail.bill_image) if detail.bill_image else '-',
                'created_at': detail.created_at
            }
            stay_details_data.append(detail_data)
        travelling_details_data = []
        for detail in travelling_details:
            trave_detail_data = {
                'id': detail.id,
                'date': detail.ta_date,
                'amount': detail.amount,
                'bill_image': str(settings.BASE_URL) + str(detail.bill_image) if detail.bill_image else '-',
                'remark': detail.remark,
                'payment_type': detail.payment_type,
                'created_at': detail.created_at
            }
            travelling_details_data.append(trave_detail_data)
        
        food_details_data = []
        for detail in food_details:
            food_detail_data = {
                'id': detail.id,
                'date': detail.ta_date,
                'amount': detail.amount,
                'bill_image': str(settings.BASE_URL) + str(detail.bill_image) if detail.bill_image else '-',
                'remark': detail.remark,
                
                'created_at': detail.created_at
            }
            food_details_data.append(food_detail_data)
        misces_details_data = []
        for detail in miscellaneous_details:
            misce_detail_data = {
                'id': detail.id,
                'amount': detail.amount,
                'bill_image': str(settings.BASE_URL) + str(detail.bill_image) if detail.bill_image else '-',
                'remark': detail.remark,
                
                'created_at': detail.created_at
            }
            misces_details_data.append(misce_detail_data)

        context = {
            'TaRequest': [{
                'id': ta_request.id,
                'visit_place': ta_request.visit_place,
                'visit_from_date': ta_request.visit_from_date,
                'visit_to_date': ta_request.visit_to_date,
                'total_expenses': ta_request.total_expenses,
                'company_paid': ta_request.company_paid,
                'balance': ta_request.balance,
                'status': ta_request.status,
                'created_at': ta_request.created_at
            }],
            'StayDetails': stay_details_data,
            'TravellingDetails': travelling_details_data,
            'FoodDetails': food_details_data,
            'MiscellaneousDetails': misces_details_data,
        }

        context['message'] = 'Success'
        context['response_code'] = HTTP_200_OK

        return Response(context, status=HTTP_200_OK)

    except SpTaRequest.DoesNotExist:
        return Response({'message': 'TA request not found', 'response_code': HTTP_404_NOT_FOUND}, status=HTTP_404_NOT_FOUND)
    except SpTaRequestDetails.DoesNotExist:
        return Response({'message': 'Stay details not found', 'response_code': HTTP_404_NOT_FOUND}, status=HTTP_404_NOT_FOUND)



@csrf_exempt
@api_view(["POST"])
def updatetaRequestDetails(request):
    # Check for required fields in the incoming data
    required_fields = ["user_id","ta_request_id", "visit_place", "visit_from_date", "visit_to_date", "total_expenses", "company_paid"]
    for field in required_fields:
        if not request.data.get(field):
            return Response({'message': f'{field} field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    
    try:
        ta_request_id = request.data["ta_request_id"]
        ta_request = SpTaRequest.objects.get(id=ta_request_id)
        ta_request.user_id = int(request.data.get("user_id"))
        ta_request.visit_place = request.data.get("visit_place")
        ta_request.visit_from_date = request.data.get("visit_from_date")
        ta_request.visit_to_date = request.data.get("visit_to_date")
        ta_request.total_expenses = float(request.data.get("total_expenses"))
        ta_request.company_paid = float(request.data.get('company_paid'))
        ta_request.balance = request.data.get('balance')
        ta_request.status = 0
        ta_request.save()
        id_list=[]
        nodata_list = []
        
        #stay_details_string         = request.data.get('stay_details')
        previous_stay_list          = SpTaRequestDetails.objects.filter(ta_request_id=request.data.get("ta_request_id")).values_list('id', flat=True)
        delete_data = request.data.get("save_ids")
        if delete_data:
            delete_ids_set = set(map(int, delete_data.split(",")))
        else:
            # If save_ids is blank, delete all records identified by previous_stay_ids_set
            delete_ids_set = set()
        #delete_ids_set = set(map(int, delete_data.split(",")))
        previous_stay_ids_set = set(previous_stay_list)
        
        ids_not_to_delete = previous_stay_ids_set - delete_ids_set
        # Delete the records with matching IDs
        SpTaRequestDetails.objects.filter(ta_request_id=request.data.get("ta_request_id"), id__in=ids_not_to_delete).delete()[0]
        
        stay_details_string = request.data.get('stay_details')
        stay_details_data = stay_details_string
        stay_details_datas = json.loads(stay_details_data)
        attachment_list             = []
        attachments                 = request.FILES.getlist('Stay_details_bill_image')
        for id, Stay_details_bill_image in enumerate(attachments):
            folder                  ='media/grievance/attachments/' 
            storage                 = FileSystemStorage(location=folder)
            timestamp               = int(time.time())
            attachment_name         = Stay_details_bill_image.name
            temp                    = attachment_name.split('.')
            attachment_name         = 'attachment_'+str(timestamp)+"_"+str(id)+"."+temp[(len(temp) - 1)]
            uploaded_attachment     = storage.save(attachment_name, Stay_details_bill_image)
            Stay_details_bill_image = folder + attachment_name       
            attachment_list.append(Stay_details_bill_image)
        st = 0
        for index, stay_detail in enumerate(stay_details_datas):
            if stay_detail["id"] =="" or stay_detail["id"] =="null" or stay_detail["id"] is None:
            # if stay_detail["id"]:
            #     id_list.append(stay_detail["id"])
            # else:
                new_stay_detail = SpTaRequestDetails()
                new_stay_detail.ta_request_id=request.data.get("ta_request_id")
                new_stay_detail.hotel_name=stay_detail["hotel_name"]
                new_stay_detail.amount=stay_detail["amount"]
                new_stay_detail.ta_details_type=0
                try:
                    new_stay_detail.bill_image = attachment_list[st]
                except:
                    new_stay_detail.bill_image = None
                new_stay_detail.save()
                st+=1
            
        # # -----------------------------travelling-----------------------------
        attachment_list2 = []
        attachments2  = request.FILES.getlist('Travelling_details_bill_image')
        for id, attachment2 in enumerate(attachments2):
            folder  ='media/attachments2/' 
            storage = FileSystemStorage(location=folder)
            timestamp = int(time.time())
            travelling_attachment_name = attachment2.name
            temp = travelling_attachment_name.split('.')
            travelling_attachment_name = 'attachment_'+str(timestamp)+"_"+str(id)+"."+temp[(len(temp) - 1)]
            uploaded_attachment = storage.save(travelling_attachment_name, attachment2)
            attachment2 = folder + travelling_attachment_name       
            attachment_list2.append(attachment2)
 
        travelling_detail_string = request.data.get('travelling_details')
        travelling_data = travelling_detail_string
        travelling_datas = json.loads(travelling_data)   
        tr =0
        for index, travelling_detail in enumerate(travelling_datas):
            # if not travelling_detail["id"]:
            if travelling_detail["id"] =="" or travelling_detail["id"] =="null" or travelling_detail["id"] is None:
            #     id_list.append(travelling_detail["id"])
            # else:
                tarequestdetails = SpTaRequestDetails()
                tarequestdetails.ta_request_id = request.data.get("ta_request_id")
                tarequestdetails.ta_date = travelling_detail['taavelling_date']
                tarequestdetails.amount = travelling_detail['amount']
                tarequestdetails.remark = travelling_detail['remark']
                tarequestdetails.payment_type = travelling_detail['payment_type']
                tarequestdetails.ta_details_type = 1
                try:
                    tarequestdetails.bill_image = attachment_list2[tr]
                except:
                    tarequestdetails.bill_image = None
                tarequestdetails.save()
                tr+=1
        
        # # -------------------------------food details---------------------------
        attachment_list3 = []
        attachments3  = request.FILES.getlist('food_details_bill_image')
        for id, attachment3 in enumerate(attachments3):
            folder  ='media/attachments3/' 
            storage = FileSystemStorage(location=folder)
            timestamp = int(time.time())
            food_attachment_name = attachment3.name
            temp = food_attachment_name.split('.')
            food_attachment_name = 'attachment_'+str(timestamp)+"_"+str(id)+"."+temp[(len(temp) - 1)]
            uploaded_attachment = storage.save(food_attachment_name, attachment3)
            attachment3 = folder + food_attachment_name       
            attachment_list3.append(attachment3)

        #food_detail = request.data.get('food_details')  
        food_detail_string = request.data.get('food_details')
        food_details_data = food_detail_string
        food_details_datas = json.loads(food_details_data)  
        fd = 0 
        for index, food_detail in enumerate(food_details_datas):
            if food_detail["id"] =="" or food_detail["id"] =="null" or food_detail["id"] is None:
                new_food_detail = SpTaRequestDetails()
                new_food_detail.ta_request_id = request.data.get("ta_request_id")
                new_food_detail.ta_date=food_detail['date']
                new_food_detail.amount=food_detail['amount']
                new_food_detail.remark=food_detail['remark']
                new_food_detail.ta_details_type=2
                try:
                    new_food_detail.bill_image = attachment_list3[fd]
                except:
                    new_food_detail.bill_image = None
                new_food_detail.save()
        # #---------------------------------miscellaneous details------------------------------
       
        attachment_list4 = []
        attachments4  = request.FILES.getlist('miscellaneous_details_bill_image')
        for id, attachment4 in enumerate(attachments4):
            folder  ='media/attachments4/' 
            storage = FileSystemStorage(location=folder)
            timestamp = int(time.time())
            miscellaneous_attachment_name = attachment4.name
            temp = miscellaneous_attachment_name.split('.')
            miscellaneous_attachment_name = 'attachment_'+str(timestamp)+"_"+str(id)+"."+temp[(len(temp) - 1)]
            uploaded_attachment = storage.save(miscellaneous_attachment_name, attachment4)
            attachment4 = folder + miscellaneous_attachment_name       
            attachment_list4.append(attachment4)

        #miscellaneous_detail = request.data.get('miscellaneous_details')
        miscellaneous_detail = request.data.get('miscellaneous_details')
        miscellaneous_details_data = miscellaneous_detail
        miscellaneous_details_datas = json.loads(miscellaneous_details_data)
        ms = 0
        for index, miscellaneous_detail in enumerate(miscellaneous_details_datas):
            if miscellaneous_detail["id"] =="" or miscellaneous_detail["id"] =="null" or miscellaneous_detail["id"] is None:
                tarequestdetails = SpTaRequestDetails()
                tarequestdetails.ta_request_id = request.data.get("ta_request_id")
               
                tarequestdetails.amount = miscellaneous_detail['amount']
                tarequestdetails.remark = miscellaneous_detail['remark']
                tarequestdetails.ta_details_type = 3
                try:
                    tarequestdetails.bill_image = attachment_list4[ms]
                except:
                    tarequestdetails.bill_image = None
                tarequestdetails.save()
        
        
        # delete_data = request.data.get("delete_ids")
        # id_list = [str(item) for item in delete_data.split(",")]  # Split the string and convert to list
        # SpTaRequestDetails.objects.filter(ta_request_id=ta_request_id, id__in=id_list).delete()
        context = {
            
            'returndataimg': attachment_list4,
            'message': 'TA request has been updated successfully.',
            'response_code': HTTP_200_OK
        }
        return Response(context, status=HTTP_200_OK)

    except SpTaRequest.DoesNotExist:
        return Response({'message': 'TA request not found', 'response_code': HTTP_404_NOT_FOUND}, status=HTTP_404_NOT_FOUND)
    except Exception as e:
        context = {
            'message': str(e),
            'response_code': HTTP_400_BAD_REQUEST
        }
        return Response(context, status=HTTP_400_BAD_REQUEST)
        
@csrf_exempt
@api_view(["POST"])
def getCompanyData(request):
    context = {}
    context['companydetail']            = SpCompanyDetail.objects.all().values()
    context['message']                  = 'Success'
    context['response_code']            = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)



def updateTravelKM(request):
    travel_month = datetime.today().strftime('%d/%m/%Y')
    travel_month = travel_month.split('/')
    year  = int(travel_month[2])
    month = int(travel_month[1])

    # year  = 2023
    # month = 9

    user_tracking_details   = SpUserTracking.objects.filter(sync_date_time__month=month,sync_date_time__year=year).values_list('user_id',flat=True).distinct()
    month_list = days_in_months(year,month)
    count = 0
    for user_id in user_tracking_details:
        count+=1
        update_thread = process_travel_km(user_id,month_list,year,month)
        update_thread.start()
        
    message ="Data generated successfully."
    response = {}
    response['error'] = False
    response['message'] = message
    response['count'] = count
    return JsonResponse(response)

class process_travel_km(threading.Thread):
    def __init__(self, user_id, month_list,year,month):
        self.user_id   = user_id
        self.year    = year
        self.month    = month
        self.month_list    = month_list
        threading.Thread.__init__(self)
    def run(self):
        savedata(self.user_id,self.month_list,self.year,self.month)  

def savedata(user_id,month_list,year,month):
    for months in month_list:
        if SpUserTravelHistory.objects.filter(user_id = user_id,treval_date = datetime.strptime(str(months), '%d/%m/%Y').strftime('%Y-%m-%d')).exists():
            pass
        else:
            if datetime.strptime(str(months), '%d/%m/%Y') <= datetime.today():
                user_trackings={}
                user_trackings['month_date'] = months
                month_date             = datetime.strptime(str(months), '%d/%m/%Y').strftime('%Y-%m-%d')
                
                tracks      = SpUserTracking.objects.filter(user_id = user_id, sync_date_time__icontains=month_date, accuracy__lte=50).order_by('sync_date_time')
                trackss     = [trackss.id for trackss in tracks]
                len_track   = len(trackss)
                
                counter_of_lens = 0
                distance_travelled_list = []
                for id, user_last in enumerate(trackss):
                    
                    counter_of_lens += 1
                    track = SpUserTracking.objects.get(id=trackss[id])
                    if counter_of_lens < len_track:
                        user_last_data = SpUserTracking.objects.get(id=trackss[id+1])
                    else:
                        user_last_data = SpUserTracking.objects.get(id=trackss[id])
                    R = 6373.0
                    lat1 = radians(float(track.latitude))
                    lon1 = radians(float(track.longitude))
                    lat2 = radians(float(user_last_data.latitude))
                    lon2 = radians(float(user_last_data.longitude))
                    dlon = lon2 - lon1
                    dlat = lat2 - lat1
                    a = sin(dlat / 2)**2 + cos(lat1) * cos(lat2) * sin(dlon / 2)**2
                    c = 2 * atan2(sqrt(a), sqrt(1 - a))
                    distance = R * c
                    meter_distance = float(distance * 1000)
                    
                    if meter_distance > 10:
                        distance_travelled_list.append(meter_distance)
                        
                
                if len(distance_travelled_list) > 0:
                    distance_travelled                   = sum(distance_travelled_list)
                    user_trackings['distance_travelled'] = round(float(distance_travelled)*0.001,2)
                else:
                    user_trackings['distance_travelled'] = 0.0
                travel_charges                       = SpUserTracking.objects.filter(user_id=user_id,sync_date_time__month=month,sync_date_time__year=year).values('travel_charges').order_by('-id').first()        
                user_trackings['charges']            = round(float(travel_charges['travel_charges']),2)
                user_trackings['total_charges']      = round(user_trackings['distance_travelled']*float(travel_charges['travel_charges']),2)
                user_trackings['user_name']          = getUserName(user_id)
                user_trackings['user_id']            = user_id

                travel_his = SpUserTravelHistory()
                travel_his.user_id = user_id
                travel_his.user_name = getUserName(user_id)
                if len(distance_travelled_list) > 0:
                    distance_travelled                   = sum(distance_travelled_list)
                    travel_his.distance_in_km = round(float(distance_travelled)*0.001,2)
                else:
                    travel_his.distance_in_km = 0.0
                travel_his.charge = round(float(travel_charges['travel_charges']),2)
                travel_his.travel_amount = round(user_trackings['distance_travelled']*float(travel_charges['travel_charges']),2)
                travel_his.treval_date = month_date
                travel_his.save()



@csrf_exempt
@api_view(["POST"])
def updateUserProfile(request):
    user_exists = SpUsers.objects.filter(official_email=request.data.get("official_email")).exclude(id=request.data.get("user_id")).exists()
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("gender")is None or request.data.get("gender") == '':
        return Response({'message': 'Gender field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("date_of_birth")is None or request.data.get("date_of_birth") == '':
        return Response({'message': 'Date of birth field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("contact_number")is None or request.data.get("contact_number") == '':
        return Response({'message': 'Contact No. field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
      
    if request.data.get("official_email")!='' and user_exists:
        return Response({'message': 'Email id already exists', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)            
    if request.data.get("shipping_address_1")is None or request.data.get("shipping_address_1") == '':
        return Response({'message': 'shipping address Address field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("shipping_state")is None or request.data.get("shipping_state") == '':
        return Response({'message': 'Shipping State field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("shipping_city")is None or request.data.get("shipping_city") == '':
        return Response({'message': 'Shipping City field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("shipping_pincode")is None or request.data.get("shipping_pincode") == '':
        return Response({'message': 'Shipping Pincode field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("billing_address_1")is None or request.data.get("billing_address_1") == '':
        return Response({'message': 'Billing Address field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("billing_state")is None or request.data.get("billing_state") == '':
        return Response({'message': 'Billing State field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("billing_city")is None or request.data.get("billing_city") == '':
        return Response({'message': 'Billing City field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("billing_pincode")is None or request.data.get("billing_pincode") == '':
        return Response({'message': 'Billing Pincode field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)          
    if bool(request.FILES.get('profile_image', False)) == True:
        uploaded_profile_image = request.FILES['profile_image']
        storage = FileSystemStorage()
        timestamp = int(time.time())
        profile_image_name = uploaded_profile_image.name
        temp = profile_image_name.split('.')
        profile_image_name = 'profile_'+str(timestamp)+"."+temp[(len(temp) - 1)]
        
        profile_image = storage.save(profile_image_name, uploaded_profile_image)
        profile_image = storage.url(profile_image)        
    user                        = SpUsers.objects.get(id=request.data.get("user_id"))
    user.official_email         = request.data.get('official_email')
    if bool(request.FILES.get('profile_image', False)) == True:
        if user.profile_image:
            deleteMediaFile(user.profile_image)
        user.profile_image          = profile_image
    user.primary_contact_number = request.data.get('contact_number')
    user.save()
    try:
        user_basic_detail = SpBasicDetails.objects.get(user_id=request.data.get("user_id"))
    except SpBasicDetails.DoesNotExist:
        user_basic_detail = None
    if user_basic_detail:
        user_basic_details = SpBasicDetails.objects.get(user_id=request.data.get("user_id"))
    else:
        user_basic_details = SpBasicDetails()
        
    user_basic_details.user_id          = request.data.get("user_id")
    user_basic_details.date_of_birth    = datetime.strptime(request.data.get('date_of_birth'), '%d/%m/%Y').strftime('%Y-%m-%d')
    user_basic_details.gender           = request.data.get('gender')
    user_basic_details.blood_group      = request.data.get('blood_group')
    user_basic_details.save()
    try:
        user_contact_nos = SpContactNumbers.objects.get(user_id=request.data.get("user_id"), is_primary=1)
    except SpContactNumbers.DoesNotExist:
        user_contact_nos = None
    if user_contact_nos:
        user_contact_no = SpContactNumbers.objects.get(user_id=request.data.get("user_id"), is_primary=1)
    else:
        user_contact_no = SpContactNumbers()
    user_contact_no.user_id         = request.data.get("user_id")    
    user_contact_no.contact_number  = request.data.get('contact_number')
    user_contact_no.save()
    SpAddresses.objects.filter(user_id=request.data.get("user_id")).delete()
    correspondence = SpAddresses()
    correspondence.user_id          = request.data.get("user_id")
    correspondence.type             = 'correspondence'
    correspondence.address_line_1   = request.data.get('shipping_address_1')
    correspondence.address_line_2   = request.data.get('shipping_address_2')
    correspondence.country_id       = 1
    correspondence.country_name     = getModelColumnById(SpCountries, 1,'country')
    correspondence.state_id         = request.data.get('shipping_state')
    correspondence.state_name       = getModelColumnById(TblStates, request.data.get('shipping_state'),'state')
    correspondence.city_id          = request.data.get('shipping_city')
    correspondence.district_name    = getModelColumnById(TblNewDistrict, request.data.get('shipping_city'),'district_name')
    correspondence.pincode          = request.data.get('shipping_pincode')
    correspondence.save()
    permanent = SpAddresses()
    permanent.user_id               = request.data.get("user_id")
    permanent.type                  = 'permanent'
    permanent.address_line_1        = request.data.get('billing_address_1')
    permanent.address_line_2        = request.data.get('billing_address_2')
    permanent.country_id            = 1
    permanent.country_name          = getModelColumnById(SpCountries, 1,'country')
    permanent.state_id              = request.data.get('billing_state')
    permanent.state_name            = getModelColumnById(TblStates, request.data.get('billing_state'),'state')
    permanent.city_id               = request.data.get('billing_city')
    permanent.district_name         = getModelColumnById(TblNewDistrict, request.data.get('billing_city'),'district_name')
    permanent.pincode               = request.data.get('billing_pincode')
    permanent.save()
    user                            = SpUsers.objects.get(id=request.data.get("user_id"))
    user_name   = request.user.first_name+' '+request.user.middle_name+' '+request.user.last_name
    heading     = 'Profile has been updated'
    activity    = 'Profile has been updated by '+user_name+' on '+datetime.now().strftime('%d/%m/%Y | %I:%M %p') 
    
    saveActivity('Profile Updated', 'Profile Updated', heading, activity, request.user.id, user_name, 'noti.png', '2', 'mobile.png')
    context = {}
    context['profile_image'] =  user.profile_image
    context['message']       = 'Profile has been updated successfully'
    context['response_code'] = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)

@csrf_exempt
@api_view(["POST"])
def approveLeaveRequestList(request):
    if request.data.get("role_id")is None or request.data.get("role_id") == '':
        return Response({'message': 'Role Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

    if request.data.get("role_id") != '1' and  request.data.get("role_id") != '0':
        return Response({'message': 'Permission Not Allowed', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("page_limit")is None or request.data.get("page_limit") == '':
        return Response({'message': 'Page limit is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)

    page_limit  = int(request.data.get("page_limit"))*10
    offset      = int(page_limit)-10
    page_limit  = 10
    
    approve_list_count = SpUserLeaves.objects.filter(leave_status = 2).values('id').count()
        
    if approve_list_count:
        approve_list_count = math.ceil(round(approve_list_count/10, 2))
    else:
        approve_list_count = 0 

    status_ids = [2,3,4]
    approve_request = SpUserLeaves.objects.filter(leave_status__in = status_ids).order_by('-id')[offset:offset+page_limit]
    approve_request_list = []
    for req in approve_request:
        if SpUserLeaves.objects.filter(id = req.id ).exists():
            request_dict = {}
            request_dict['leave_id']                = req.id
            # request_dict['heading']                 = req.heading
            request_dict['leave_status']            = req.leave_status
            request_dict['applied_emp_name']        = req.user_name
            request_dict['applied_emp_code']        = getModelColumnById(SpUsers,req.user_id,'emp_sap_id')
            request_dict['leave_from_date']         = req.leave_from_date
            request_dict['leave_to_date']           = req.leave_to_date
            request_dict['is_first_half_day']       = req.is_first_half_day
            request_dict['is_last_half_day']        = req.is_last_half_day
            request_dict['created_at']              = req.created_at
            approve_request_list.append(request_dict)
            
    context = {}
    context['message']                  = 'Success'
    context['approve_request']       = approve_request_list
    context['approve_list_count']         = approve_list_count
    return Response(context, status=HTTP_200_OK)   


@csrf_exempt
@api_view(["POST"])
def changeLeaveStatus(request):  
    if request.data.get("role_id")is None or request.data.get("role_id") == '':
        return Response({'message': 'Role Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("role_id") != '1' and  request.data.get("role_id") != '0':
        return Response({'message': 'Permission Not Allowed', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("leave_id")is None or request.data.get("leave_id") == '':
        return Response({'message': 'Leave id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 
    if request.data.get("leave_status")is None or request.data.get("leave_status") == '':
        return Response({'message': 'Leave Status field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST) 

    status_code   = 200
    leave_status = request.data.get("leave_status")
    leave_id = request.data.get("leave_id")
    response = {}
    leave                   = SpUserLeaves.objects.get(id=leave_id)
    leave.leave_status      = leave_status
    leave.save()
    today = date.today()
    try:
        if leave_status =='3':
            last_leave_type_value = SpUserLeavePolicyLedger.objects.filter(leave_type_id = leave.leave_type_id,user_id = leave.user_id).last()
            last_leave_balance = SpUserLeavePolicyLedger.objects.filter(user_id = leave.user_id,leave_type_id = leave.leave_type_id).last()
            
            leave_from_date             = leave.leave_from_date
            leave_to_date               = leave.leave_to_date
            total_no_of_leave_days      = leave_to_date - leave_from_date
            
            total_no_of_leave_days      = total_no_of_leave_days.days 
           
            total_no_of_leave_days      = total_no_of_leave_days+1
            if leave.is_first_half_day == 1:
                total_no_of_leave_days = total_no_of_leave_days - 0.5
            if leave.is_last_half_day == 1:
                total_no_of_leave_days = total_no_of_leave_days - 0.5
            
    
            last_leave_month_values  = total_no_of_leave_days
            last_leave_balances     = float(last_leave_balance.balance) - total_no_of_leave_days
            
            leave_ledger                            = SpUserLeavePolicyLedger()
            leave_ledger.user_id                    = leave.user_id
            leave_ledger.leave_policy_id            = last_leave_type_value.leave_policy_id
            leave_ledger.leave_type_id              = last_leave_type_value.leave_type_id
            leave_ledger.month_leave_count          = last_leave_month_values
            leave_ledger.consecutive_leave          = last_leave_type_value.consecutive_leave
            leave_ledger.debit                      = total_no_of_leave_days
            leave_ledger.balance                    = last_leave_balances
            leave_ledger.leave_date                 = today
            leave_ledger.save()
            response['message']                  = "Leave has been approved successfully"
            status_code   = 200
        elif leave_status =='4':
            status_code   = 200
            response['message']                  = "Leave has been decline successfully"
        return JsonResponse(response,status = status_code)
    except:
        response['error'] = True
        status_code   = 401
        response['message'] = "Record has Not been updated"

        return JsonResponse(response,status = status_code)
        
@csrf_exempt
@api_view(["POST"])
def appliedLeaves(request):
    if request.data.get("page_limit")is None or request.data.get("page_limit") == '':
        return Response({'message': 'Page limit is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)
    if request.data.get("user_id")is None or request.data.get("user_id") == '':
        return Response({'message': 'User Id field is required', 'response_code': HTTP_400_BAD_REQUEST}, status=HTTP_400_BAD_REQUEST)   
    page_limit  = int(request.data.get("page_limit"))*10
    offset      = int(page_limit)-10
    page_limit  = 10
    leave_list_count = SpUserLeaves.objects.filter(user_id=request.data.get("user_id")).values('id').count()
        
    if leave_list_count:
        leave_list_count = math.ceil(round(leave_list_count/10, 2))
        leave_status     = SpUserLeaves.objects.filter(user_id=request.data.get("user_id")).order_by('-id').first()
        leave_status     = leave_status.leave_status 
       
    else:
        leave_list_count = 0 
        leave_status     = 0

    leave_list = SpUserLeaves.objects.filter(user_id=request.data.get("user_id")).values('id','user_id','handover_user_id','user_name','leave_type_id','leave_type','leave_from_date','leave_to_date','leave_detail','leave_status','is_first_half_day','is_last_half_day','is_document_required','is_document_required_count','created_at','attachment').order_by('-id')[offset:offset+page_limit]
    for leave in leave_list:
        leave['handover_user_name'] = getUserName(leave['handover_user_id'])
        alias = getModelColumnById(SpLeaveTypes,leave['leave_type_id'],'alias')
        leave['leave_type'] = leave['leave_type']+" ("+ alias +")"
        uploaded_document_id = SpUserLeaveDocument.objects.filter(user_leave_id = leave['id']).values_list('leave_type_document_id',flat=True)
        pending_documents_list = SpLeaveTypeDocuments.objects.filter(leave_type_id  = leave['leave_type_id']).exclude(id__in  = uploaded_document_id).values('id','document')
        if pending_documents_list:
            leave['pending_documents_list'] = list(pending_documents_list)
        else:
            leave['pending_documents_list'] = []
        
    basic_details_obj=SpBasicDetails.objects.filter(user_id=request.data.get("user_id")).first()
    if basic_details_obj:
        if basic_details_obj.week_of_day:
            week_off_day=basic_details_obj.week_of_day
        else:
            week_off_day=""
    else:
        week_off_day=""
        
        
    leave_type          = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id")).values('leave_type_id').distinct()
    
    for leave in leave_type:
        try:
            leave_policy_id = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = leave['leave_type_id']).first()
            is_half_day = SpLeavePolicyDetails.objects.get(leave_policy_id = leave_policy_id.leave_policy_id,leave_type_id =leave['leave_type_id'] )
            is_half_day = is_half_day.is_halfday_included
        except SpLeavePolicyDetails.DoesNotExist:
            is_half_day  = None
        year_leave_count = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = leave['leave_type_id']).last()
        credit = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = leave['leave_type_id']).aggregate(Sum('credit'))['credit__sum']
        if credit:
            credit = credit
        else:
            credit = 0
        debit = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id = leave['leave_type_id']).aggregate(Sum('debit'))['debit__sum']
        if debit:
            debit = debit
        else:
            debit = 0
        leave_count   = float(credit)-float(debit)
        leave['leave_type']                 = getModelColumnById(SpLeaveTypes,leave_policy_id.leave_type_id ,'leave_type') + ' (' +  str(leave_count) + ')'
        
        #leave['leave_type']                 = getModelColumnById(SpLeaveTypes,leave_policy_id.leave_type_id ,'leave_type') + ' (' +  str(year_leave_count.credit) + ')'
        leave['is_halfday_included']        = is_half_day
        leave['leave_count']                = leave_count
        leave['year_leave_count']           = year_leave_count.credit
        leave['leave_policy_id']            = leave_policy_id.leave_policy_id
        leave['required_document_list']     =  list(SpLeaveTypeDocuments.objects.filter(leave_type_id = leave['leave_type_id']).values('id','document'))
        
        
    sums = 0    
    leave_type_ids = SpLeaveTypes.objects.filter(status=1).values_list('id')
    for leave_ids in leave_type_ids:
        
        year_leave_count = SpUserLeavePolicyLedger.objects.filter(user_id = request.data.get("user_id"),leave_type_id__in  = list(leave_ids)).last()
      
        if year_leave_count:
           sums =  sums + year_leave_count.balance
        else:
            sums = sums+0
    today = datetime.now()
    current_month = today.month
    leave_status_id = [1,2]
    leave_update = SpUserLeaves.objects.filter(user_id= request.data.get("user_id"),leave_status__in = leave_status_id,created_at__month=current_month).count()
    if leave_update == 1:
        leave_update_count = 1
    else:
        leave_update_count = 0
    context = {}
    context['message']              = 'Success'
    context['leave_list']           = list(leave_list)
    # context['leave_attchment']      = attchment_data
    context['leave_list_count']     = leave_list_count
    context['leave_type_list']      = list(leave_type)
    context['leave_count']          = sums
    context['leave_status']         = leave_status
    context['week_off_day']    = week_off_day
    context['leave_update_count']   = leave_update_count
    
    context['response_code']        = HTTP_200_OK
    return Response(context, status=HTTP_200_OK)