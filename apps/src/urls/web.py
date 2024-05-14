from django.urls import path,re_path
from ..views import *

app_name = 'src'
urlpatterns = [

    # autoload files
    
    path('map-leave-ledger/<str:role_id>', userManagement.mapUserLeavess, name='map-leave-ledger'),
    
    path('cron/map-leave-policy-to-leave-ledder', auth.mappLeavePolicyToLeaveLedegr),
    
    path('firebase-messaging-sw.js', profile.firebase_messaging_sw_js),
    path('opencv.js', profile.opencv_js),
    path('haarcascade_frontalface_default.xml', profile.haarcascade_frontalface_default_xml),

    path('dashboard', profile.index, name='dashboard'),
    path('manage-profile', profile.manageProfile, name='manage-profile'),
    path('update-configuration', profile.updateConfiguration, name='update-configuration'),
    path('update-profile', profile.updateProfile, name='update-profile'),
    path('change-password', profile.changePassword, name='change-password'),
    path('graph-ajaxFilter', profile.ajaxFilter, name='graph-ajaxFilter'),
    
    path('id-card-design', profile.idCardDesign, name='id-card-design'),

    path('organizations', organizations.index, name='organizations'),
    path('ajax-organization-list', organizations.ajaxOrganizationList, name='ajax-organization-list'),
    path('ajax-organization-lists', organizations.ajaxOrganizationLists, name='ajax-organization-lists'),
    path('add-organization', organizations.addOrganization, name='add-organization'),
    path('save-organization', organizations.saveOrganization, name='save-organization'),
    path('edit-organization', organizations.editOrganization, name='edit-organization'),
    path('update-organization', organizations.updateOrganization, name='update-organization'),
    path('get-organization-record', organizations.getOrganizationRecord, name='get-organization-record'),
    path('update-organization-status', organizations.updateOrganizationStatus, name='update-organization-status'),
  
    path('add-department', organizations.addDepartment, name='add-department'),
    path('save-department', organizations.saveDepartment, name='save-department'),
    path('edit-department', organizations.editDepartment, name='edit-department'),
    path('update-department', organizations.updateDepartment, name='update-department'),
    path('update-department-status', organizations.updateDepartmentStatus, name='update-department-status'),
    path('export-organizations-to-xlsx/<str:columns>', organizations.exportToXlsx, name='export-organizations-to-xlsx'),
    path('export-organizations-to-pdf/<str:columns>', organizations.exportToPDF, name="export-organizations-to-pdf"),
    
    
    path('roles', roleManagement.index, name='roles'),
    path('ajax-role-list', roleManagement.ajaxRoleList, name='ajax-role-list'),
    path('ajax-role-lists', roleManagement.ajaxRoleLists, name='ajax-role-lists'),
    path('add-role', roleManagement.addRole, name='add-role'),
    path('add-role-permission', roleManagement.addRolePermission, name='add-role-permission'),
    path('update-role-status', roleManagement.updateRoleStatus, name='update-role-status'),
    path('edit-role', roleManagement.editRole, name='edit-role'),
    path('role-entity-mapping/<str:role_id>/<str:entity_type>', roleManagement.roleEntityMapping, name='role-entity-mapping'),
    path('save-role-mapping', roleManagement.saveRoleMapping, name='save-role-mapping'),
    path('save-role-unmapping', roleManagement.saveRoleUnmapping, name='save-role-unmapping'),
    path('save-role-leave-policy-mapping', roleManagement.saveRoleLeavePolicyMapping, name='save-role-leave-policy-mapping'),
    path('save-role-attendance-group-mapping', roleManagement.saveRoleAttendanceGroupMapping, name='save-role-attendance-group-mapping'),
    path('save-role-pay-band-mapping', roleManagement.saveRolePayBandMapping, name='save-role-pay-band-mapping'),
    path('save-role-holiday-mapping', roleManagement.saveRoleHolidayMapping, name='save-role-holiday-mapping'),
    path('save-role-salary-addition-mapping', roleManagement.saveRoleSalaryAdditionMapping, name='save-role-salary-addition-mapping'),
    path('save-role-salary-deduction-mapping', roleManagement.saveRoleSalaryDeductionMapping, name='save-role-salary-deduction-mapping'),
    
    path('add-short-role/<str:parent_role_id>', roleManagement.addShortRole, name='add-short-role'),
    path('add-short-role-details/<str:role_id>', roleManagement.shortRoleDetails, name='add-short-role-details'),
    path('save-role-activity', roleManagement.saveRoleActivity, name='save-role-activity'),
    path('delete-role-activity/<str:role_activity_id>', roleManagement.deleteRoleActivity, name='delete-role-activity'),

    path('view-map-role-attributes-modal/<str:role_id>', roleManagement.viewMapRoleAttributesModal, name='view-map-role-attributes-modal'),
    path('role-type-attribute-controls/<str:id>', roleManagement.getAttributeControls, name='role-type-attribute-controls'),
    path('update-role-attributes', roleManagement.updateRoleAttributes, name='update-role-attributes'),

    path('contact-cards', contactManagement.index, name='contact-cards'),
    path('add-contact-card', contactManagement.addContactCard, name='add-contact-card'),
    path('edit-contact-card', contactManagement.editContactCard, name='edit-contact-card'),
    path('get-role-type-attributes-form/<str:role_id>', contactManagement.getRoleTypeAttributesForm, name='get-role-type-attributes-form'),
    path('get-role-type-attributes/<str:role_id>', contactManagement.getRoleTypeAttributes, name='get-role-type-attributes'),
    path('admission-procedures-details/<str:admission_procedures_id>', contactManagement.admissionProcedureDetails, name='admission-procedures-details'),
    path('search-departments/<str:location_id>', contactManagement.searchDepartments, name='search-departments'),
    path('search-roles', contactManagement.searchRoles, name='search-roles'),
    path('get-role-organization-option/<str:role_id>', contactManagement.getRoleOrganizationOption, name='get-role-organization-option'),

    path('save-contact', contactManagement.saveContact, name='save-contact'),
    path('update-contact', contactManagement.updateContact, name='update-contact'),
    path('get-user-contact-record', contactManagement.getUserContactRecord, name='get-user-contact-record'),
    path('get-user-attribute-detail/<str:user_id>/<str:attribute_name>', contactManagement.getUserAttributeDetail, name='get-user-attribute-detail'),
    path('ajax-contact-list', contactManagement.ajaxContactList, name='ajax-contact-list'), 
    path('ajax-contact-card-list', contactManagement.ajaxContactCardList, name='ajax-contact-card-list'),
    path('get-role-type-attributes-edit-form/<str:user_id>/<str:role_id>', contactManagement.getRoleTypeAttributesEditForm, name='get-role-type-attributes-edit-form'),
    path('create-student-card', contactManagement.createStudentCard, name='create-student-cardt'),


    

    path('users', userManagement.index, name='users'),
    path('send-email', userManagement.sendEmail, name='send-email'),
    path('ajax-operational-users-list', userManagement.ajaxOperationalUsersList, name='ajax-operational-users-list'),
    path('ajax-non-operational-users-list', userManagement.ajaxNonOperationalUsersList, name='ajax-non-operational-users-list'),
    path('ajax-employee-users-list', userManagement.ajaxEmployeeUsersList, name='ajax-employee-users-list'),
    path('add-user-basic-detail', userManagement.addUserBasicDetail, name='add-user-basic-detail'),
    path('edit-user-basic-detail', userManagement.editUserBasicDetail, name='edit-user-basic-detail'),
    path('add-user-offical-detail', userManagement.addUserOfficalDetail, name='add-user-offical-detail'),
    path('edit-user-offical-detail', userManagement.editUserOfficalDetail, name='edit-user-offical-detail'),
    
    path('add-employee-biometric-details', userManagement.addEmployeeBiometricDetails, name='add-employee-biometric-details'),
    path('edit-employee-biometric-details/<int:employee_id>', userManagement.editEmployeeBiometricDetails, name='edit-employee-biometric-details'),
    path('add-employee-photo', userManagement.addEmployeePhoto,name='add-employee-photo'),
    path('ajax-user-trackings/<str:user_id>', userManagement.ajaxUserTracking, name='ajax-user-trackings'),
    path('add-user-product-detail', userManagement.addUserProductDetail, name='add-user-product-detail'),
    path('update-user-variant-price', userManagement.updateUserVariantPrice, name='update-user-variant-price'),
    path('edit-user-product-detail', userManagement.editUserProductDetail, name='edit-user-product-detail'),
    path('add-user-document-detail', userManagement.addUserDocumentDetail, name='add-user-document-detail'),
    path('user-geo-tagged', userManagement.userGeoTagged, name='user-geo-tagged'),
    path('update-user-status', userManagement.updateUserStatus, name='update-user-status'),
    path('export-operational-user-to-xlsx/<str:columns>', userManagement.exportOperationalUserToXlsx, name='export-operational-user-to-xlsx'),
    path('export-operational-user-to-pdf/<str:columns>', userManagement.exportOperationalUserToPdf, name='export-operational-user-to-pdf'),
    path('export-non-operational-user-to-xlsx/<str:columns>', userManagement.exportNonOperationalUserToXlsx, name='export-non-operational-user-to-xlsx'),
    path('export-non-operational-user-to-pdf/<str:columns>', userManagement.exportNonOperationalUserToPdf, name='export-non-operational-user-to-pdf'),
  
    path('export-employee-to-xlsx/<str:columns>/<str:search>/<str:jobs>/<str:depts>/<str:roles>', userManagement.exportEmployeeToXlsx, name='export-employee-to-xlsx'),
    path('export-employee-to-pdf/<str:columns>/<str:search>/<str:jobs>/<str:depts>/<str:roles>', userManagement.exportEmployeeToPdf, name='export-employee-to-pdf'),
    path('import-product-variant', userManagement.importProductVariant, name='import-product-variant'),

    path('add-employee-basic-detail', userManagement.addEmployeeBasicDetail, name='add-employee-basic-detail'),
    path('add-employee-official-detail', userManagement.addEmployeeOfficalDetail, name='add-employee-official-detail'),
    path('add-employee-attendance-detail', userManagement.addEmployeeAttendanceDetail, name='add-employee-attendance-detail'),
    path('add-employee-document-detail', userManagement.addEmployeeDocumentDetail, name='add-employee-document-detail'),

    path('edit-employee-basic-detail/<int:employee_id>', userManagement.editEmployeeBasicDetail, name='edit-employee-basic-detail'),
    path('edit-employee-official-detail/<int:employee_id>', userManagement.editEmployeeOfficalDetail, name='edit-employee-official-detail'),
    path('edit-employee-attendance-detail/<int:employee_id>', userManagement.editEmployeeAttendanceDetail, name='edit-employee-attendance-detail'),
    path('get-user-map', userManagement.getUserMap, name='get-user-map'),
    path('edit-employee-document-detail/<int:employee_id>', userManagement.editEmployeeDocumentDetail, name='edit-employee-document-detail'),

    path('user-short-details/<int:user_id>', userManagement.userShortDetail, name='user-short-details'),
    path('user-details/<int:user_id>', userManagement.userDetail, name='user-details'),
    path('employee-short-details/<int:employee_id>', userManagement.employeeShortDetail, name='employee-short-details'),
    path('employee-details/<int:employee_id>', userManagement.employeeDetail, name='employee-details'),

    path('view-user-role-permission/<int:user_id>', userManagement.viewUserRolePermission, name='view-user-role-permission'),
    path('update-user-role-permission', userManagement.updateUserRolePermission, name='update-user-role-permission'),
    path('check-role-permission', userManagement.checkRolePermision, name='check-role-permission'),
    path('save-role-permission-validity', userManagement.saveRolePermisionValidity, name='save-role-permission-validity'),
    
    path('add-employee-documents', userManagement.addEmployeeDocuments, name='add-employee-documents'),
    path('employee-document-list', userManagement.employeeDocumentList, name='employee-document-list'),
    path('add-employee-new-folder', userManagement.addEmployeeNewFolder, name='add-employee-new-folder'),
    path('add-employee-new-file', userManagement.addEmployeeNewFile, name='add-employee-new-file'),
    path('get-employee-master-details', userManagement.getEmployeeMasterDetails, name='get-employee-master-details'),
    path('reset-user-credential/<str:user_id>', userManagement.resetCredential, name='reset-user-credential'),
    path('reset-user-location', userManagement.resetUserLocation, name='reset-user-location'),

    path('get-leave-type-document-options/<str:leave_type_id>', ajax.leaveTypeDocumentOption, name='get-leave-type-document-options'),
    path('get-state-options/<int:country_id>', ajax.stateOption, name='get-state-options'),
    path('get-city-options/<int:state_id>', ajax.cityOption, name='get-city-options'),
    path('get-organization-department-options/<str:organization_id>', ajax.getOrganizationDepartmentOptions, name='get-organization-department-options'),
    path('get-college-course-options/<str:college_id>', ajax.getCollegeCourseOptions, name='get-college-course-options'),
    
    path('get-options-list', ajax.getOptionsList, name='get-options-list'),
    path('edit-role/<int:role_id>', roleManagement.editRole, name='edit-role'),
    path('role-details/<int:role_id>', roleManagement.roleDetails, name='role-details'),
    
    path('get-district-optionss/<int:state_id>', ajax.districtOptions, name='get-district-optionss'),
    path('get-tehsil-options/<int:district_id>', ajax.tehsilOption, name='get-tehsil-options'),
 
    path('get-state-towns/<int:state_id>', ajax.getStateTowns, name='get-state-towns'),
    path('get-zone-towns/<int:zone_id>', ajax.getZoneTowns, name='get-zone-towns'),
    path('get-route-towns/<int:route_id>', ajax.getRouteTowns, name='get-route-towns'),


    path('update-favorite', ajax.updateFavorite, name='update-favorite'),
    path('get-add-role-permission/<int:role_id>', roleManagement.getAddRolePermission, name='get-add-role-permission'),
    path('get-org-department-options/<int:organization_id>', roleManagement.orgDepartmentOption, name='get-org-department-options'),
    path('get-org-role-options/<int:organization_id>', roleManagement.orgRoleOption, name='get-org-role-options'),
    path('get-department-role-options/<int:department_id>', roleManagement.departmentRoleOption, name='get-department-role-options'),
    path('get-grouped-town-options', userManagement.getGroupedTownOptions, name='get-grouped-town-options'),
    path('get-reporting-user-options/<int:role_id>', userManagement.getReportingUserOptions, name='get-reporting-user-options'),
    
   
    path('get-state-route-options/<int:state_id>', ajax.stateRouteOptions, name='get-state-route-options'),
    path('get-route-town-options', ajax.routeTownOptions, name='get-route-town-options'),
    path('get-product-variant-details/<int:product_variant_id>', ajax.productVariantDetails, name='get-product-variant-details'),
    path('get-order-time', ajax.getOrderTime, name='get-order-time'),
    
    path('master-management', master.index, name='master-management'),
 
    path('get-room-list', master.ajaxRoomList, name='get-room-list'),
    path('add-room-list', master.addRoomList,name='add-room-list'),
    path('edit-room-list/<str:room_id>',master.editRoomList, name='edit-room-list'),
    path('get-college-room-no', master.getCollegeByRoom, name='get-college-room-no'),
    path('get-room-almira', master.getRoomByAlmirah, name='get-room-almira'),
    path('get-almirah-list', master.ajaxAlmirahList, name='get-almirah-list'),
    path('get-rack-list', master.ajaxRackList, name='get-rack-list'),
    path('add-almirah', master.addAlmirah, name='add-almirah'),
    path('add-rack', master.addRack, name='add-rack'),
    path('edit-almirah/<str:almirah_id>', master.editAlmirahList,name='edit-almirah'),
    path('edit-rack/<str:rack_id>', master.editRackList,name='edit-rack'),
    path('get-college-room-no', master.getCollegeByRoom, name='get-college-room-no'),

    
    

    path('room-status/<str:room_status>', master.updateRoomStatus, name='room-status'),
    path('almira-status/<str:almira_status>', master.updateAlmiraStatus, name='almira-status'),
    path('rack-status/<str:rack_status>', master.updateRackStatus, name='rack-status'),
   
    path('get-leave-type-documents/<str:leave_type_id>', leaveHolidayMaster.getLeaveTypeDocuments, name='get-leave-type-documents'),
    path('get-leave-type-list', leaveHolidayMaster.ajaxLeaveTypeList, name='get-leave-type-list'),
    path('get-holiday-type-list', leaveHolidayMaster.ajaxHolidayTypeList, name='get-holiday-type-list'),
    
    path('get-group-type-list', master.ajaxGroupTypeList,name='get-group-type-list'),
    path('add-group-type', master.addAGroupType, name='add-group-type'),
    path('edit-group-type/<str:group_type_id>',master.editGroupTypeList, name='edit-group-type'),
    path('update-group-type-status/<str:group_type_id>',master.updateGroupTypeStatus, name='update-group-type-status'),
    
   
    path('get-document-type-list', master.ajaxDocumentTypeList, name='get-document-type-list'),
    path('add-document-type', master.addDocumentTypeList, name='add-document-type'),
    path('edit-document-type/<str:document_type_id>', master.editDocumentTypeList,name='edit-document-type'),

    # Job Type Master
    path('get-job-type-list', master.ajaxJobTypeList,name='get-job-type-list'),
    path('add-job-type',master.addJobType, name='add-job-type'),
    path('edit-job-type/<str:job_type_id>',master.editJobTypeList, name='edit-job-type'),
    path('update-job-type-status/<str:job_type_id>',master.updateJobTypeStatus, name='update-job-type-status'),
# -------------------------------------------------------------------------------------------------
   
    path('get-income-category-list', master.ajaxIncomeCategoryList,name='get-income-category-list'),
    path('add-income-category-type', master.addIncomeCategoryList,name='add-income-category-type'),
    path('edit-income-category-type/<str:income_category_id>',master.editIncomeCategory, name='edit-income-category-type'),

  
    path('add-college-session', master.addCollegeSession, name='add-college-session'),
    path('edit-college-session/<str:session_id>', master.editCollegeSession, name='edit-college-session'),
    path('get-college-session-types', master.ajaxCollegeSessionList, name='get-college-session-types'),

   
    path('get-prviliage-category', master.ajaxPrviliageCategoryList, name='get-prviliage-category'),
    path('add-prviliage-category', master.addPrviliageCategory, name='add-prviliage-category'),
    path('edit-prviliage-category/<str:prviliage_category_id>', master.editPrviliageCategory, name='edit-prviliage-category'),

 
    path('get-caste-category-list', master.ajaxCasteCategoryList, name='get-caste-category-list'),
    path('add-caste-category-type', master.addCasteCategoryList, name='add-caste-category-type'),
    path('edit-caste-category-type/<str:caste_category_id>', master.editCasteCategory, name='edit-caste-category-type'),

    path('get-district-master-list', master.ajaxDistrictList, name='get-district-master-list'),
    path('add-district', master.addDistrict, name='add-district'),
    path('edit-district/<str:district_id>', master.editDistrict, name='edit-district'),

    path('get-tehsil-master-list', master.ajaxTehsilList, name='get-tehsil-master-list'),
    path('add-tehsil', master.addTehsil, name='add-tehsil'),
    path('edit-tehsil/<str:tehsil_id>', master.editTehsil, name='edit-tehsil'),


    path('get-section-list', master.ajaxSectionList,name='get-section-list'),
    path('add-section', master.addSection, name='add-section'),
    path('edit-section/<str:section_id>', master.editSection, name='edit-section'),
# -----------------------------------------------------------------------------------------------------------------------
    path('add-leave-type', leaveHolidayMaster.addLeaveType, name='add-leave-type'),
    path('edit-leave-type/<str:leave_type_id>', leaveHolidayMaster.editLeaveType, name='edit-leave-type'),
    path('update-leave-type-status/<str:leave_type_id>', leaveHolidayMaster.updateLeaveTypeStatus, name='update-leave-type-status'),

    path('add-holiday-type', leaveHolidayMaster.addHolidayType, name='add-holiday-type'),
    path('edit-holiday-type/<str:holiday_type_id>', leaveHolidayMaster.editHolidayType, name='edit-holiday-type'),
    path('update-holiday-type-status/<str:holiday_type_id>', leaveHolidayMaster.updateHolidayTypeStatus, name='update-holiday-type-status'),
    
    path('get-pay-band-list', master.ajaxPayBandList, name='get-pay-band-list'),
    path('add-pay-band', master.addPayBand, name='add-pay-band'),
    path('edit-pay-band/<str:pay_band_id>', master.editPayBand, name='edit-pay-band'),
    path('update-pay-band-status/<str:pay_band_id>', master.updatePayBandStatus, name='update-pay-band-status'),

    path('get-salary-addition-type-list', master.ajaxSalaryAdditionTypeList, name='get-salary-addition-type-list'),
    path('add-salary-addition-type', master.addSalaryAdditionType, name='add-salary-addition-type'),
    path('edit-salary-addition-type/<str:salary_addition_type_id>', master.editSalaryAdditionType, name='edit-salary-addition-type'),
    path('update-salary-addition-type-status/<str:salary_addition_type_id>', master.updateSalaryAdditionTypeStatus, name='update-salary-addition-type-status'),

    path('get-salary-deduction-type-list', master.ajaxSalaryDeductionTypeList, name='get-salary-deduction-type-list'),
    path('add-salary-deduction-type', master.addSalaryDeductionType, name='add-salary-deduction-type'),
    path('edit-salary-deduction-type/<str:salary_deduction_type_id>', master.editSalaryDeductionType, name='edit-salary-deduction-type'),
    path('update-salary-deduction-type-status/<str:salary_deduction_type_id>', master.updateSalaryDeductionTypeStatus, name='update-salary-deduction-type-status'),


    path('get-attendance-group-list', master.ajaxAttendanceGroupList, name='get-attendance-group-list'),
    path('add-attendance-group', master.addAttendanceGroup, name='add-attendance-group'),
    path('edit-attendance-group/<str:attendance_group_id>', master.editAttendanceGroup, name='edit-attendance-group'),
    path('update-attendance-group-status/<str:attendance_group_id>', master.updateAttendanceGroupStatus, name='update-attendance-group-status'),
    
    path('leave-policies', leaves.index, name='leave-policies'),
    path('leave-status-update', leaves.updatePolicyStatus, name='leave-status-update'),
    path('leave-policies-filter/<str:filter_value>', leaves.ajaxLeaveFilter, name='leave-policies-filter'),
    path('leave-policies-filter-status/<str:filter_value>/<str:filter_status>', leaves.ajaxLeaveFilterStatus, name='leave-policies-filter-status'),
    path('leave-policy-short-details/<str:leave_policy_id>', leaves.leavePolicyShortDetails, name='leave-policy-short-details'),
    path('add-leave-policy', leaves.addLeavePolicy, name='add-leave-policy'),
    path('edit-leave-policy/<str:leave_policy_id>', leaves.editLeavePolicy, name='edit-leave-policy'),
    path('update-leave-policy-status', leaves.updateLeavePolicyStatus, name='update-leave-policy-status'),
    path('ajax-leave-policy-rows', leaves.ajaxLeavePolicyRows, name='ajax-leave-policy-rows'),
    
    #Holidays
    path('holidays', holiday.index, name='holidays'),
    path('add-holiday', holiday.addHoliday, name='add-holiday'),
    path('filter-role-by-organization', holiday.roleByOrganization, name='filter-role-by-organization'),
    path('edit-holiday/<str:holiday_id>', holiday.editHoliday, name='edit-holiday'),
    path('holidays/holiday-calendar', holiday.holidayCalendar, name='holidays/holiday-calendar'),
    path('holidays/filter-holiday/<str:filter_status>', holiday.filterHoliday, name='holidays/filter-holiday'),
    path('update-holiday-status', holiday.updateHolidayStatus, name='update-holiday-status'),
    path('export-holidays-to-xlsx/<str:filter_status>', holiday.exportToXlsx, name="export-holidays-to-xlsx"),
    path('export-holidays-to-pdf/<str:filter_status>', holiday.exportToPDF, name="export-holidays-to-pdf"),
    path('add-pdf/<str:holiday_id>', holiday.addpdf, name="add-pdf"),
    
    path('leave-report', holiday.leaveReport, name='leave-report'),
    path('ajax-leave-report-lists', holiday.ajaxLeaveReportLists, name='ajax-leave-report-lists'),
    path('edit-leave-status', holiday.editLeaveStatus, name='edit-leave-status'),
    path('leave-status-details', holiday.leaveStatusDetails, name='leave-status-details'),
    path('update-leave-status', holiday.updateLeaveStatus, name='update-leave-status'),
    path('update-leave-remark', holiday.updateLeaveRemark, name='update-leave-remark'),
    path('export-leave-report-to-xlsx/<str:columns>/<str:userId>/<str:leave_status>', holiday.leaveExportToXlsx, name='export-leave-report-to-xlsx'),
    path('export-leave-report-to-pdf/<str:columns>/<str:userId>/<str:leave_status>', holiday.leaveExportToPDF, name='export-leave-report-to-pdf'),
    
    

  
    # Attendance    
    path('attendance/mark-student-attendance', attendance.markStudentAttendance, name='attendance/mark-student-attendance'),
    path('attendance/new-mark-student-attendance', attendance.newmarkStudentAttendance, name='attendance/new-mark-student-attendance'),
    path('attendance/mark-student-attendance-new', attendance.markStudentAttendanceNew, name='attendance/mark-student-attendance-new'),
    path('attendance/get-student-data/<str:student_id>', attendance.getStudentData, name='attendance/get-student-data'),
    path('attendance/student-attendance-report', attendance.studentAttendanceReport, name='attendance/student-attendance-report'),
    path('attendance/filter-student-attendance-report', attendance.filterStudentAttendanceReport, name='attendance/filter-student-attendance-report'),
    path('attendance/ajax-student-attendance-lists', attendance.ajaxStudentAttendanceLists, name='attendance/ajax-student-attendance-lists'),
    path('student-attendance-details/<str:student_id>', attendance.studentAttendanceDetail, name='student-attendance-details'),

    path('attendance/attendance-summary', attendance.indexSummary, name='attendance/attendance-summary'),
    path('attendance/filter-attendance-summary', attendance.filterSummary, name='attendance/filter-attendance-summary'),
    path('export-attendance-summary-report-to-xlsx/<str:college_id>/<str:course>/<str:sem_year>/<str:filter_date>', attendance.exportToXlsx, name='export-attendance-summary-report-to-xlsx'),
    path('attendance/employee-attendance-summary', attendance.EmployeeSummary, name='attendance/employee-attendance-summary'),
    path('attendance/filter-employee-attendance-summary', attendance.filterEmployeeAttendanceSummary , name='attendance/filter-employee-attendance-summary'),
    path('export-employee-attendance-summary-report-to-xlsx/<str:college_id>/<str:department>/<str:filter_date>', attendance.exportEmployeeAttendanceToXlsx, name='export-employee-attendance-summary-report-to-xlsx'),

    path('attendance/attendance-stats', attendance.attendanceStat, name='attendance/attendance-stats'),
    path('attendance/get-attendance-zone', attendance.getAttendaceZone, name='attendance/get-attendance-zone'),
    path('attendance/get-register-zone', attendance.getRegisterZone, name='attendance/get-register-zone'),
    path('attendance/ajax-attendance-stats', attendance.ajaxAttendanceStat, name='attendance/ajax-attendance-stats'),
    path('attendance/export-attendance-stats/<str:from_date>/<str:to_date>/<str:branch>/<str:semester>', attendance.attendanceStatsExportToXlsx, name='attendance/export-attendance-stats'),
    path('attendance/export-attendance-stats-reports/<str:list>/<str:branch>/<str:semester>/<str:from_date>/<str:to_date>', attendance.attendanceReportExportToXlsx, name='attendance/export-attendance-stats-reports'),
    path('attendance/filter-register-report', attendance.filterRegisterZone, name='attendance/filter-register-report'),
    
    path('attendance/attendance-report', attendance.attendanceReport, name='attendance/attendance-report'),
    path('attendance/ajax-attendance-report', attendance.ajaxattendanceReport, name='attendance/ajax-attendance-report'),
    path('attendance/export-attendance-report/<str:from_date>/<str:to_date>/<str:semester>', attendance.attendanceReportExportToXlsx, name='attendance/export-attendance-report'),
    path('attendance/export-students-attendance-report/<str:branch_id>/<str:check>/<str:semester>/<str:from_date>/<str:to_date>', attendance.attendanceStudentsReportExportToXlsx, name='attendance/export-students-attendance-report'),
    path('attendance/get-attendance-report', attendance.getAttendaceReport, name='attendance/get-attendance-report'),

    # Firebase notification
    path('save-web-firebase-token', ajax.saveWebFirebaseToken, name='save-web-firebase-token'),
    path('notify-web', ajax.notifyWeb, name='notify-web'),
    
    path('match-face', ajax.matchFace, name='match-face'),
    path('face-image-upload', ajax.regEncodes, name='face-image-upload'),
    path('face-encodings-register', ajax.trainFile, name='face-encodings-register'),
    
   
    #Admin
    path('admin/dashboard', admin.HomePageAPI, name='admin/dashboard'),
    path('admin/visit-mapview', admin.visitMapView, name='admin/visit-mapview'),
    path('admin/visited-student', admin.getVisitedStudents, name="admin/visited-student"),
    path('admin/visited-details', admin.visitedStudentDetail, name="admin/visited-details"),
    
  
    # Widgets
    path('school-visit-mapview', widgets.schoolVisitMapview, name='school-visit-mapview'),
    path('ajax-user-tracking', widgets.ajaxschoolVisit, name='ajax-user-tracking'),
    path('school-visit-details', widgets.schoolVisitDetails, name='school-visit-details'),
    path('export-school-visits/<str:visit_type>/<str:user_id>/<str:date_from>/<str:date_to>', widgets.exportSchoolVisits, name='export-school-visits'),
    
    # # Entrance Exam
   
    
    path('get-branch-list', ajax.getBranchList, name='get-branch-list'),
    path('get-all-branch-list', ajax.getAllBranchList, name='get-all-branch-list'),
    path('get-branch-sem-year-list', ajax.getBranchSemYearList, name='get-branch-sem-year-list'),
    path('get-student-registration-no', ajax.getStudentRegistrationNo, name='get-student-registration-no'),
    
    
    path('employee-id-card-editor', employees.employeeIdCardEditor,name='employee-id-card-editor'),
    path('employee-qr-generator', employees.employeeQRGeneration,name='employee-qr-generator'),
    path('employee-id-card-save', employees.employeeIDCardSave,name='employee-id-card-save'),
    path('employee-id-card-download', employees.employeeIDCardDownload,name='employee-id-card-download'),
    
    path('attendance/mark-employee-attendance', employees.markEmployeeAttendance,name='attendance/mark-employee-attendance'),
    path('employee/get-by-employee-id', employees.getByEmployeeId,name='employee/get-by-employee-id'),
    path('get-employee-thumbs/<str:emp_id>',employees.getEmployeeThumbs, name='get-employee-thumbs'),

    path('attendance/employee-attendance-report', employees.employeeAttendanceReport,name='attendance/employee-attendance-report'),
    path('attendance/filter-employee-attendance-report', employees.filterEmployeeAttendanceReport,name='attendance/filter-employee-attendance-report'),
    path('attendance/ajax-employee-attendance-lists', attendance.ajaxStudentAttendanceLists,name='attendance/ajax-employee-attendance-lists'),
    path('employee-attendance-details/<str:user_id>',employees.employeeAttendanceDetail, name='employee-attendance-details'),
   
    
    path('user-notification', report.userNotification),
    
    path('monthly-attendance-report', report.staffAttendanceSummary, name='monthly-attendance-report'),
    path('attendance/filter-staff-attendance-summary', report.filterStaffAttendanceSummary, name='attendance/filter-staff-attendance-summary'),
    path('export-staff-attendance-summary-report-to-xlsx/<str:filter_date>', report.exportToXlsx, name='export-staff-attendance-summary-report-to-xlsx'),
    path('staff-attendance-reports/<str:user_id>/<str:MonthDate>', report.staffMonthlyAttendance, name='staff-attendance-reports'),
    
    path('ajax-attendance-reports', report.ajaxAttendanceReports, name='ajax-attendance-reports'),
    path('export-attendance-report-to-xlsx/<str:columns>/<str:attendance_start_date>/<str:attendance_end_date>/<str:role_id>', report.exportAttendanceReport, name='export-attendance-report-to-xlsx'),
    path('user-geo-attendance', report.userGeoAttendance, name='user-geo-attendance'),
    
    
    
    path('regularization-report', report.regularizationReport, name='regularization-report'),
    path('ajax-regularization-report-list', report.ajaxRegularizationReportLists, name='ajax-regularization-report-list'),
    path('update-regularization-remark', report.updateRegularizationRemark, name='update-regularization-remark'),
    path('update-regularization-status', report.updateRegularizationStatus, name='update-regularization-status'),
    path('export-regularization-report-to-xlsx/<str:columns>/<str:userId>/<str:regularization_status>', report.regularizationExportToXlsx, name='export-regularization-report-to-xlsx'),
    path('get-user/<str:organization_id>', ajax.getUsers,name='get-user'),


    path('daily-attendance-report', attendance.attendanceReports, name='daily-attendance-report'),

    path('view-details/<int:id>', attendance.viewDetails, name='view-details'),  
    path('month-performance-report/<str:month>/<str:year>', attendance.monthPerormanceReport, name='month-performance-report'), 
    
    
    path('user-tracking-report', userManagement.userTrackingReport, name='user-tracking-report'),
    path('ajax-user-tracking/<str:user_id>', userManagement.ajaxUserTracking, name='ajax-user-tracking'),


    path('user-travel-summary', userManagement.userTravelSummary, name='user-travel-summary'),
    path('ajax-user-travel-summary-report', userManagement.ajaxuserTravelSummary, name='ajax-user-travel-summary-report'),
    path('get-travel-user-list', ajax.travelUserOption, name='get-travel-user-list'),
    path('export-user-travel-summary/<str:travel_date>/<str:user_id>/<str:travel_month_picker>/<str:time_period>', userManagement.exportUserTravelSummary, name='export-user-travel-summary'),
    
    path('get-State-list', location.ajaxStateList, name='get-State-list'),
    path('get-City-list', location.ajaxCityList, name='get-City-list'),
    path('add-state-master', location.addState, name='add-state-master'),
    path('edit-state-master/<str:State_id>', location.editState, name='edit-state-master'),

    path('add-city-master', location.addCity, name='add-city-master'),
    path('edit-city-master/<str:city_id>', location.editCity, name='edit-city-master'),

    
    path('save-employee-payroll-master', userManagement.saveEmployeePayrollMaster,name='save-employee-payroll-master'),
    path('update-employee-payroll-master', userManagement.updateEmployeePayrollMaster,name='update-employee-payroll-master'),



    path('user-tracking-report-view/<str:user_id>/<str:trac_date>', userManagement.userTrackingReportView, name='user-tracking-report-view'),
    
    # -----------------------------------------------------------------------------payroll--------------------------------------------------
    path('save-employee-payroll-master', userManagement.saveEmployeePayrollMaster,name='save-employee-payroll-master'),
    path('update-employee-payroll-master', userManagement.updateEmployeePayrollMaster,name='update-employee-payroll-master'),
    
    path('employee-salary-sheet', userManagement.employeeSalaySheet,name='employee-salary-sheet'),
    path('ajax-employee-salary-sheet', userManagement.ajaxEmployeeSalaySheet,name='ajax-employee-salary-sheet'),
    path('generate-salary-sheet',userManagement.generateSalarySheet, name='generate-salary-sheet'),
    path('export-employee-salary-sheet/<str:organization_id>/<str:months>/<str:year>',userManagement.exportSalarySheet, name='export-employee-salary-sheet'),
    path('save-salary-sheet', userManagement.saveSalarySheet,name='save-salary-sheet'),
    
    #leave ledger
    path('add-leave-ledger/<int:employee_id>', userManagement.addLeaveLedger, name='add-leave-ledger'),
    path('save-leave-ledger', userManagement.saveLeaveLedger, name='save-leave-ledger'),
    path('ajax-leave-ledger/<int:emp_id>', userManagement.ajaxLeaveLedger, name='ajax-leave-ledger'),
    path('clear-user-location', userManagement.clearUserLocation, name='clear-user-location'),

    # TARequest-----------------------------------------------------------------
    
    path('ta-request', taRequest.index, name='ta-request'),
    path('get-tarequest-details', taRequest.getTaRequestDetails, name='get-tarequest-details'),
    path('ajax-ta-request-lists', taRequest.ajaxTARequestLists, name='ajax-ta-request-lists'),
    path('change-tarequest-status-request', taRequest.changeTARequestStatusRequest, name='change-tarequest-status-request'),
    path('export-tarequest-to-xlsx/<str:customer_id>/<str:order_date>', taRequest.exportToXlsx, name='export-tarequest-to-xlsx'),
    path('update-taRequest-status', taRequest.updateUserStatus, name='update-taRequest-status'),

    path('privacy-policy', userManagement.privacyPolicy, name='privacy-policy'),
    
    path('add-iso-master', location.addIsoMaster, name='add-iso-master'),
    path('edit-iso-master/<str:iso_master_id>', location.editIsoMaster, name='edit-iso-master'),
    # path('update-status-iso-master/<str:iso_master_id>', location.updateStatusIsoMaster, name='update-status-iso-master'),
    
    path('add-core-business-area', location.addCoreBusinessArea, name='add-core-business-area'),
    path('edit-core-business-area/<str:core_business_id>', location.editCoreBusinessArea, name='edit-core-business-area'),
    path('update-status-core-business-area/<str:core_business_id>', location.updateStatusCoreBusinessArea, name='update-status-core-business-area'),
    
    path('index', leadFile.index, name='index'),
    path('filter-lead/<int:status>', leadFile.filterLead, name='filter-lead'),
    path('filter-leads/<int:ids>', leadFile.filterLeads, name='filter-leads'),
    path('ajax-lead-list', leadFile.ajaxLeadList, name='ajax-lead-list'),
    path('get-lead-details', leadFile.getLeadDetails, name='get-lead-details'),
    path('export-lead-to-xlsx/<str:customer_id>/<str:order_status>/<str:start_date>/<str:end_date>', leadFile.exportToXlsx, name='export-lead-to-xlsx'),
    # path('export-lead-to-xlsx/<str:customer_id>/<str:order_status>/<str:order_date>', leadFile.exportToXlsx, name='export-lead-to-xlsx'),
    path('locate-lead-on-map', leadFile.locateLeadOnMap, name='locate-lead-on-map'),
    path('show-activity-log', leadFile.showActivityLog, name='show-activity-log'),
    
    
    path('upcoming-renewals', leadFile.leadReport, name='upcoming-renewals'),
    path('ajax-lead-report', leadFile.ajaxLeadReport, name='ajax-lead-report'),
    path('export-lead-report-to-xlsx/<str:customer_id>/<str:filter_by>/<str:start_date>/<str:end_date>', leadFile.exportLeadReportToXlsx, name='export-lead-report-to-xlsx'),
    
    
    
    path('get-country-code-list', location.ajaxCountryCode, name='get-country-code-list'),
    path('add-country-code-list', location.addCountryCode, name='add-country-code-list'),
    path('edit-country-code-list/<str:country_code_id>', location.editCountryCode, name='edit-country-code-list'),
    path('update-country-code-list/<str:country_code_id>', location.updateCountryCode, name='update-country-code-list'),
    
    path('get-core-business-area-list', location.ajaxCoreBusinessArea, name='get-core-business-area-list'),
    path('add-core-business-area-list', location.addCoreBusinessArea, name='add-core-business-area-list'),
    path('edit-core-business-area-list/<str:core_business_id>', location.editCoreBusinessArea, name='edit-core-business-area-list'),
    path('update-core-business-area-list/<str:core_business_id>', location.updateStatusCoreBusinessArea, name='update-core-business-area-list'),
    
    path('get-iso-master-list', location.ajaxIsoMaster, name='get-iso-master-list'),
    path('add-iso-master-list', location.addIsoMaster, name='add-iso-master-list'),
    path('edit-iso-master-list/<str:iso_master_id>', location.editIsoMaster, name='edit-iso-master-list'),
    # path('update-iso-master-list/<str:city_id>', location.updateIsoMaster, name='update-iso-master-list'),
    
    path('get-business-type-list', location.ajaxBusinessType, name='get-business-type-list'),
    path('add-business-type-list', location.addBusinessType, name='add-business-type-list'),
    path('edit-business-type-list/<str:business_type_id>', location.editBusinessType, name='edit-business-type-list'),
    
    path('get-iso-service-list', location.ajaxIsoService, name='get-iso-service-list'),
    path('add-iso-service-list', location.addIsoService, name='add-iso-service-list'),
    path('edit-iso-service-list/<str:iso_service_id>', location.editIsoService, name='edit-iso-service-list'),
    
    path('get-reasons-list', location.ajaxReasons, name='get-reasons-list'),
    path('add-reasons-list', location.addReasons, name='add-reasons-list'),
    path('edit-reasons-list/<str:reason_id>', location.editReasons, name='edit-reasons-list'),
    path('update-reason/<str:reason_id>', location.updateStatusReason, name='update-reason'),
    path('locate-single-lead-on-map',leadFile.locateSingleLeadOnMap,name='locate-single-lead-on-map'),
    path('full-lead-details/<int:lead_id>', leadFile.leadFullDetail, name='full-lead-details'),
    path('edit-lead-basic-details/<str:lead_id>',leadFile.editLeadBasicDetails,name="edit-lead-basic-details"),
    path('edit-lead-iso-details/<int:lead_id>/<int:iso_status>',leadFile.editLeadIsoDetails,name="edit-lead-iso-details"),
    path('edit-lead-other-details/<str:lead_id>',leadFile.editLeadOtherDetails,name="edit-lead-other-details"),

    
    #rj
    path('get-fy-year', location.ajax_fy_year, name='get-fy-year'),
    path('add-fy-year', location.add_fy_year, name='add-fy-year'),
    
    path('employee-view-performance/<int:employee_id>', userManagement.employee_peformance, name='employee-view-performance'),
    path('add-employee-target/<int:employee_id>', userManagement.add_employee_target, name='add-employee-target'),
    path('edit-employee-target', userManagement.edit_employee_target, name='edit-employee-target'),
    path('get_fy_year', userManagement.add_employee_target, name='add-employee-target'),
    
    path('assigend-bulk-lead',leadFile.assigendBulkLead,name="assigend-bulk-lead"),
    path('update-assign-employee', leadFile.updateAssignEmployee, name= "update-assign-employee"),
    
    path('get-salary-head-list', master.ajaxSalaryHeadList, name='get-salary-head-list'),
    path('add-salary-head', master.addSalaryHead, name='add-salary-head'),
    path('edit-salary-head/<str:salary_head_id>', master.editSalaryHead, name='edit-salary-head'),
    path('update-salary-head/<str:salary_head_id>', master.updateSalaryHeadStatus, name='update-salary-head'),
    
    path('user-salary-slip',userManagement.userSalarySlip,name="user-salary-slip"),
        
    path('download-salary-slip-pdf/<str:month_no>/<str:user_id>/<str:year>',userManagement.downloadSalarySlipPdf,name="download-salary-slip-pdf"),
    path('print-salary-slip/<str:month_no>/<str:user_id>/<str:year>',userManagement.printSalarySlip,name="print-salary-slip"),
  
    
    path('salary-slip',userManagement.salarySlipList,name="salary-slip"),
    path('get-month-list',userManagement.getMonthList,name ="get-month-list"),


]