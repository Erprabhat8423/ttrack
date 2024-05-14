from django.urls import path,re_path
from ..views import *

app_name = 'src'
urlpatterns = [
    path('cron/get-followup-data-reminder',cron.getFollowupDataReminder),
    path('cron/get-expairy-data-reminder',cron.getExpairyDataReminder),
    path('cron/get-expairy-document-reminder',cron.getExpairyDocumentReminder),
    path('api/verify-id-pin', auth.verifyIdPin),
    path('api/login', auth.login),
    path('api/send-otp', auth.sendOtp),
    path('api/approval-requests', auth.approvalRequests),
    path('api/update-policy-status', auth.updatePolicyStatus),
    path('api/update-holiday-status', auth.updateHolidayStatus),
    path('api/notification-list', auth.notificationList),
  
    # Admin App Api's
    path('api/student-attendance-list', admin.studentAttendanceList),
    path('api/employee-attendance-list', admin.employeeAttendanceList),
    path('api/student-attendance-master-data', admin.studentAttendanceMasterData),
    path('api/dashboard-data', admin.dashboardData),
    path('api/dashboard', admin.dashboard),
    path('api/visited-student', admin.getVisitedStudents),
    path('api/visited-details', admin.visitedStudentDetail),
    path('api/visit-mapview', admin.visitMapView),
    path('api/student-QR-data', admin.studentQRData),
    
    # Employee App Api's
    path('api/user-attendance', auth.userAttendance),
    path('api/check-attendances', auth.checkAttendances),
    path('api/get-dashboard-data',auth.getDashboardData),
    path('api/get-attendance-dashboard-data',auth.getAttendanceData),
    path('api/get-master-data', auth.getMasterData),

    path('api/save-tracking-data', auth.saveUserTracking),
    path('api/user-location-log', auth.userLocationLog),
    path('api/apply-leave', auth.applyLeave),
    path('api/applied-leaves', auth.appliedLeaves),
    path('api/update-user-location', auth.updateUserLocation),
    path('api/logout', auth.logout),
    
    path('api/user-location-log', auth.userLocationLog),
    

    path('api/handover-leave-request-list', auth.handOverLeaveRequestList),
    path('api/leave-forword', auth.leaveForword),
    path('api/upload-pending-leave-document', auth.uploadPendingUserLeaveDocument),
    path('api/applied-regularizations', auth.appliedRegularizations),
    path('api/save-user-regularization-data',auth.saveUserRegularizationData),
    path('cron/update-travel-KM', auth.updateTravelKM, name='update-travel-KM'),
    path('cron/user-day-out', auth.userDayOut),
    path('api/attendance-count', auth.attendanceCount),
    path('api/save-ta-request-details', auth.SavetaRequestDetails),
    path('api/get-ta-request-details', auth.gettaRequestDetails),
    path('api/edit-ta-request-details', auth.edittaRequestDetails),
    path('api/update-ta-request-details', auth.updatetaRequestDetails),
    path('api/get-company-data', auth.getCompanyData),
    path('api/update-user-profile', auth.updateUserProfile),
    #--------------------------Lead----------------------
    path('api/save-lead-basic', lead.saveLeadBasic),
    path('api/get-lead-followup', lead.getLeadfollowup),
    path('api/save-lead-iso', lead.saveLeadIso),
    path('api/save-lead-other', lead.saveLeadOther),
    path('api/get-lead-list', lead.getLeadList),
    path('api/get-user_lead-details', lead.getUserLeadDetails),
    path('api/get-user-complete-lead-details', lead.getUserCompleteLeadDetails),
    path('api/get-master-data-list',lead.getMasterDataList),
    path('api/get-iso-master-list-lead',lead.getIsoMasterListLead),
    path('api/remove-lead-iso',lead.removeLeadIso),
    path('api/save-lead-iso-details',lead.saveLeadIsoDetails),
    path('api/remove-saved-iso',lead.removeSavedIso),
    path('api/get-lead-renewal-data',lead.getLeadRenewalData),
    
    
    # --------------- edit -- Lead ------------------
    path('api/update-lead-phase',lead.updateLeadPhase),
    path('api/get-edit-lead-basic-details',lead.getEditLeadBasicDetails),
    path('api/edit-lead-basic',lead.editLeadBasic),
    path('api/edit-lead-iso-details',lead.editLeadIsoDetails),
    path('api/edit-other-details',lead.editOtherDetails),
    path('api/delete-lead-data',lead.deleteLeadData),
    path('api/lead-dashboard-data',lead.leadDashboardData),
    path('api/lead-expiry-list',lead.leadExpiryList),
    # ---------- cron ------------------------------
    path('cron/map-lead-ledger-user-cron',cron.mappLeadLedegr),
    path('api/approve-leave-request-list',auth.approveLeaveRequestList),
    path('api/changeLeaveStatus',auth.changeLeaveStatus),
    path('cron/map-leave-policy-to-ledger-monthly',cron.mappLeavePolicyToLeaveLedegr),
    
    path('api/update-followup',lead.updateFollowUp),
    path('api/show-activity-log',lead.showActivityLog),
    
    

    path('api/target_and_achieve/', lead.lead_target_achieve, name='lead_target_achieve'),
    path('api/lead_rvenue/', lead.lead_revenue, name='lead_rvenue'),
    path('api/get_fy_year/', lead.get_fy_year, name='get_fy_year'),
]