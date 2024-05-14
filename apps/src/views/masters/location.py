import sys
import os
from django.shortcuts import render, redirect
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.decorators import login_required
from django.db import connection
from django.http import HttpResponse, JsonResponse, HttpResponseNotFound
from django.core.exceptions import ObjectDoesNotExist
from django.contrib import messages
from django.apps import apps
from ...models import *
from django.db.models import Q
from sanstha.settings import *
from utils import *
from django.forms.models import model_to_dict

@login_required
def ajaxZoneList(request):
    context = {}
    context['zones'] = SpZones.objects.all()
    template = 'master/location/ajax-zone-list.html'
    return render(request, template, context)

@login_required
def ajaxTownList(request):
    context = {}
    context['towns'] = SpTowns.objects.all()
    template = 'master/location/ajax-town-list.html'
    return render(request, template, context)


@login_required
def ajaxRouteList(request):
    context = {}
    context['routes'] = SpRoutes.objects.all()
    template = 'master/location/ajax-route-list.html'
    return render(request, template, context)


@login_required
def addZone(request):
    if request.method == "POST":
        response = {}
        if SpZones.objects.filter(zone=request.POST['zone_name']).exists() :
            response['flag'] = False
            response['message'] = "Zone already exists."
        else:
            zone = SpZones()
            zone.state_id = request.POST['state_id']
            zone.state_name = getModelColumnById(SpStates,request.POST['state_id'],'state')
            zone.zone = request.POST['zone_name']
            zone.save()
            if zone.id :
                towns = request.POST.getlist('town[]')
                for id, val in enumerate(towns):
                    town = SpTowns.objects.get(id=towns[id])
                    town.zone_id = zone.id
                    town.zone_name = zone.zone
                    town.save()

            response['flag'] = True
            response['message'] = "Record has been saved successfully."
        return JsonResponse(response)

    else:
        context = {}
        context['states'] = SpStates.objects.all()
        context['towns'] = SpTowns.objects.filter(zone_id=None)
        template = 'master/location/add-zone.html'
        return render(request, template, context)


@login_required
def addTown(request):
    if request.method == "POST":
        response = {}
        if SpTowns.objects.filter(town=request.POST['town_name']).exists() :
            response['flag'] = False
            response['message'] = "Town name already exists."
        else:
            town = SpTowns()
            if request.POST['zone_id'] != "" :
                town.zone_id = request.POST['zone_id']
                town.zone_name = getModelColumnById(SpZones,request.POST['zone_id'],'zone')
            else:
                town.zone_id = None
                town.zone_name = None
                
            town.state_id = request.POST['state_id']
            town.state_name = getModelColumnById(SpStates,request.POST['state_id'],'state')
            town.town = request.POST['town_name']
            town.save()

            response['flag'] = True
            response['message'] = "Record has been saved successfully."
        return JsonResponse(response)

    else:
        context = {}
        context['states'] = SpStates.objects.all()
        context['zones'] = SpZones.objects.all()
        template = 'master/location/add-town.html'
        return render(request, template, context)




@login_required
def addRoute(request):
    if request.method == "POST":
        response = {}
        if SpRoutes.objects.filter(route=request.POST['route_name']).exists() :
            response['flag'] = False
            response['message'] = "Route name already exists."
        else:
            route = SpRoutes()
            route.state_id = request.POST['state_id']
            route.state_name = getModelColumnById(SpStates,request.POST['state_id'],'state')
            route.route = request.POST['route_name']
            route.save()
            if route.id :
                towns = request.POST.getlist('town[]') 
                orders = request.POST.getlist('order[]') 

                for id, val in enumerate(towns):
                    route_town = SpRoutesTown()
                    route_town.route_id = route.id
                    route_town.route_name = request.POST['route_name']
                    route_town.town_id = towns[id]
                    route_town.town_name = getModelColumnById(SpTowns,towns[id],'town')
                    route_town.order_index = orders[id]
                    route_town.save()

            response['flag'] = True
            response['message'] = "Record has been saved successfully."
        return JsonResponse(response)

    else:
        context = {}
        context['states'] = SpStates.objects.all()
        context['towns'] = SpTowns.objects.all()
        template = 'master/location/add-route.html'
        return render(request, template, context)


@login_required
def ajaxStateList(request):
    context = {}
    context['State'] = TblStates.objects.all().order_by('-id')
    template = 'master/location/ajax-State-list.html'
    return render(request, template, context)

@login_required
def ajaxCityList(request):
    context = {}
    Citys =  TblNewDistrict.objects.filter().order_by('-id')
    for city in Citys:
        if TblStates.objects.filter(id = city.state_id).exists():
            city.state_name = getModelColumnById(TblStates,city.state_id,'state')
    context['Citys'] = Citys
    template = 'master/location/ajax-city-list.html'
    return render(request, template, context)



@login_required
def addState(request):
    if request.method == "POST":
        response = {}
        if TblStates.objects.filter(state=request.POST['State_name']).exists() :
            response['flag'] = False
            response['message'] = "State already exists."
        else:
            State = TblStates()
            State.state = request.POST['State_name']
            State.country_name ='India'
            State.country_id = 1
            State.save()
            response['flag'] = True
            response['message'] = "Record has been saved successfully."
        return JsonResponse(response)
    else:
        context = {}
        context['States'] = TblStates.objects.all()
        template = 'master/location/add-states.html'
        return render(request, template, context)



@login_required
def editState(request,State_id):
    if request.method == "POST":
        response = {}
       # Stateid = request.POST['State_id']
        State = TblStates.objects.get(id=State_id)
        State.state = request.POST['State_name']
        State.save()
        response['flag'] = True
        response['message'] = "Record has been updated successfully."
        return JsonResponse(response)

    else:
        context = {}
        context['State'] = TblStates.objects.get(id=State_id)
        template = 'master/location/edit-State.html'
        return render(request, template, context)



@login_required
def addCity(request):
    if request.method == "POST":
        response = {}
        if TblNewDistrict.objects.filter(district_name=request.POST['City_name']).exists() :
            response['flag'] = False
            response['message'] = "Town name already exists."
        else:
            city = TblNewDistrict()
            city.state_id = request.POST['state_id']
            city.district_name = request.POST['City_name']
            city.save()
            response['flag'] = True
            response['message'] = "Record has been saved successfully."
        return JsonResponse(response)

    else:
        context = {}
        context['states'] = TblStates.objects.all()
        template = 'master/location/add-City.html'
        return render(request, template, context)

@login_required
def editCity(request,city_id):
    if request.method == "POST":
        response = {}
     #   town_id = request.POST['town_id']
        city = TblNewDistrict.objects.get(id=city_id) 
        city.state_id = request.POST['state_id']
        city.district_name = request.POST['City_name']
        city.save()

        response['flag'] = True
        response['message'] = "Record has been updated successfully."
        return JsonResponse(response)

    else:
        context = {}
        context['city'] = TblNewDistrict.objects.get(id=city_id)
        print(context['city'])
        context['states'] = TblStates.objects.all()
        template = 'master/location/edit-citys.html'
        return render(request, template, context)

@login_required
def addIsoMaster(request):
    if request.method == "POST":
        response = {}
        if SpIsoMaster.objects.filter(iso_id=request.POST['iso_id']).exists() :
            response['flag'] = False
            response['message'] = "ISO already exists."
        else:
            iso = SpIsoMaster()
            iso.iso_id = request.POST['iso_id']
            iso.iso_name = request.POST['iso_name']
            iso.core_business_id = request.POST['core_business_id']
            iso.save()
            response['flag'] = True
            response['message'] = "Record has been saved successfully."
        return JsonResponse(response)

    else:
        context = {}
        context['core_business_area'] = SpCoreBusinessArea.objects.all()
        template = 'master/location/add-iso-master.html'
        return render(request, template, context)

@login_required
def editIsoMaster(request,iso_master_id):
    if request.method == "POST":
        response = {}
     #   town_id = request.POST['town_id']
        iso = SpIsoMaster.objects.get(id=iso_master_id) 
        iso.iso_id = request.POST['iso_id']
        iso.iso_name = request.POST['iso_name']
        iso.core_business_id = request.POST['core_business_id']
        iso.save()

        response['flag'] = True
        response['message'] = "Record has been updated successfully."
        return JsonResponse(response)

    else:
        context = {}
        context['core_business_area'] = SpCoreBusinessArea.objects.all()
        template = 'master/location/edit-citys.html'
        return render(request, template, context)


# @login_required
# def updateStatusIsoMaster(request,iso_master_id):
#     if request.method == "POST":
#         response = {}
#         iso = SpIsoMaster.objects.get(id=iso_master_id) 
#         if iso.status == 1:
#             iso.status = 0
#         else:
#             iso.status = 1
#         iso.save()

#         response['flag'] = True
#         response['message'] = "Record has been updated successfully."
#         return JsonResponse(response)

#     else:
#         context = {}
#         template = 'master/location/edit-core-business-area.html'
#         return render(request, template, context)




# -------------------- New Changes 06/04/2024 --------------------------
@login_required
def addCountryCode(request):
    if request.method == "POST":
        response = {}
        if SpCountryCodes.objects.filter(country_code=request.POST['country_code']).exists() :
            response['flag'] = False
            response['message'] = "Country Code already exists."
        else:
            code = SpCountryCodes()
            code.country_code = request.POST['country_code']
            code.status = 1
            code.save()
            response['flag'] = True
            response['message'] = "Record has been saved successfully."
        return JsonResponse(response)
    else:
        context = {}
        context['country_codes'] = SpCountryCodes.objects.all()
        template = 'master/location/add-country-code.html'
        return render(request, template, context)
        
@login_required
def editCountryCode(request,country_code_id):
    if request.method == "POST":
        response = {}
        code = SpCountryCodes.objects.get(id=country_code_id) 
        code.country_code = request.POST['country_code']
        code.save()

        response['flag'] = True
        response['message'] = "Record has been updated successfully."
        return JsonResponse(response)

    else:
        context = {}
        context['country_code'] = SpCountryCodes.objects.get(id=country_code_id) 
        template = 'master/location/edit-country-code.html'
        return render(request, template, context)

@login_required
def updateCountryCode(request,country_code_id):
   
    response = {}
    code = SpCountryCodes.objects.get(id=country_code_id) 
    if code.status == 1:
        code.status = 0
    else:
        code.status = 1
    code.save()

    response['flag'] = True
    response['message'] = "Record has been updated successfully."
    return JsonResponse(response)


@login_required
def ajaxCountryCode(request):
    context = {}
    context['country_codes'] = SpCountryCodes.objects.all().order_by('-id')
    template = 'master/location/ajax-country-code-list.html'
    return render(request, template, context)

@login_required
def addCoreBusinessArea(request):
    if request.method == "POST":
        response = {}
        if SpCoreBusinessArea.objects.filter(core_business_area_name=request.POST['core_business_area_name']).exists() :
            response['flag'] = False
            response['message'] = "Core Business Area already exists."
        else:
            area = SpCoreBusinessArea()
            area.core_business_area_name = request.POST['core_business_area_name']
            area.status = 1
            area.save()
            response['flag'] = True
            response['message'] = "Record has been saved successfully."
        return JsonResponse(response)
    else:
        context = {}
        context['core_busniess_area'] = SpCoreBusinessArea.objects.all()
        template = 'master/location/add-core-business-area.html'
        return render(request, template, context)

@login_required
def editCoreBusinessArea(request,core_business_id):
    if request.method == "POST":
        response = {}
        core = SpCoreBusinessArea.objects.get(id=core_business_id) 
        core.core_business_area_name = request.POST['core_business_area_name']
        core.save()

        response['flag'] = True
        response['message'] = "Record has been updated successfully."
        return JsonResponse(response)

    else:
        context = {}
        context['core_business_area'] = SpCoreBusinessArea.objects.get(id=core_business_id) 
        template = 'master/location/edit-core-business-area.html'
        return render(request, template, context)

@login_required
def updateStatusCoreBusinessArea(request,core_business_id):

    response = {}
    core = SpCoreBusinessArea.objects.get(id=core_business_id) 
    if core.status == 1:
        core.status = 0
    else:
        core.status = 1
    core.save()

    response['flag'] = True
    response['message'] = "Record has been updated successfully."
    return JsonResponse(response)

        
@login_required
def ajaxCoreBusinessArea(request):
    context = {}
    context['core_business_areas'] = SpCoreBusinessArea.objects.all().order_by('-id')
    template = 'master/location/ajax-core-business-area-list.html'
    return render(request, template, context)
    
@login_required
def addBusinessType(request):
    if request.method == "POST":
        response = {}
        if SpBusinessTypes.objects.filter(business_type=request.POST['business_type']).exists() :
            response['flag'] = False
            response['message'] = "Business Type already exists."
        else:
            btype = SpBusinessTypes()
            btype.business_type = request.POST['business_type']
            btype.save()
            response['flag'] = True
            response['message'] = "Record has been saved successfully."
        return JsonResponse(response)
    else:
        context = {}
        context['business_type'] = SpBusinessTypes.objects.all()
        template = 'master/location/add-business-type.html'
        return render(request, template, context)
     

@login_required
def editBusinessType(request,business_type_id):
    if request.method == "POST":
        response = {}
        btype = SpBusinessTypes.objects.get(id=business_type_id) 
        btype.business_type = request.POST['business_type']
        btype.save()

        response['flag'] = True
        response['message'] = "Record has been updated successfully."
        return JsonResponse(response)

    else:
        context = {}
        context['business_type'] = SpBusinessTypes.objects.get(id=business_type_id) 
        template = 'master/location/edit-business-type.html'
        return render(request, template, context)
@login_required
def ajaxBusinessType(request):
    context = {}
    context['business_types'] = SpBusinessTypes.objects.all().order_by('-id')
    template = 'master/location/ajax-business-type-list.html'
    return render(request, template, context)


@login_required
def addIsoMaster(request):
    if request.method == "POST":
        response = {}
        if SpIsoMaster.objects.filter(iso_id=request.POST['iso_id']).exists() :
            response['flag'] = False
            response['message'] = "ISO already exists."
        else:
            isom = SpIsoMaster()
            isom.iso_id = request.POST['iso_id']
            isom.iso_name = request.POST['iso_name']
            isom.save()
            response['flag'] = True
            response['message'] = "Record has been saved successfully."
        return JsonResponse(response)
    else:
        context = {}
        context['iso_master_list'] = SpIsoMaster.objects.all()
        template = 'master/location/add-iso-master.html'
        return render(request, template, context)

@login_required
def editIsoMaster(request,iso_master_id):
    if request.method == "POST":
        response = {}
        isom = SpIsoMaster.objects.get(id=iso_master_id) 
        isom.iso_id = request.POST['iso_id']
        isom.iso_name = request.POST['iso_name']
        isom.save()
        response['flag'] = True
        response['message'] = "Record has been updated successfully."
        return JsonResponse(response)

    else:
        context = {}
        context['iso_master'] = SpIsoMaster.objects.get(id=iso_master_id) 
        template = 'master/location/edit-iso-master.html'
        return render(request, template, context)

# @login_required
# def updateIsoMaster(request,iso_master_id):
#     if request.method == "POST":
#         response = {}
#         core = SpIsoMaster.objects.get(id=iso_master_id) 
#         if core.status == 1:
#             core.status = 0
#         else:
#             core.status = 1
#         core.save()

#         response['flag'] = True
#         response['message'] = "Record has been updated successfully."
#         return JsonResponse(response)

#     else:
#         context = {}
#         template = 'master/location/edit-iso-master.html'
#         return render(request, template, context)
        
@login_required
def ajaxIsoMaster(request):
    context = {}
    context['iso_masters'] = SpIsoMaster.objects.all().order_by('-id')
    template = 'master/location/ajax-iso-master-list.html'
    return render(request, template, context)
# @login_required
# def updateBusinessType(request,business_type_id):
#     if request.method == "POST":
#         response = {}
#         code = SpBusinessType.objects.get(id=business_type_id) 
#         if code.status == 1:
#             code.status = 0
#         else:
#             code.status = 1
#         code.save()

#         response['flag'] = True
#         response['message'] = "Record has been updated successfully."
#         return JsonResponse(response)

#     else:
#         context = {}
#         template = 'master/location/edit-country-code.html'
#         return render(request, template, context)


@login_required
def addIsoService(request):
    if request.method == "POST":
        response = {}
        if TtrackService.objects.filter(service_name=request.POST['service_name']).exists() :
            response['flag'] = False
            response['message'] = "ISO Service already exists."
        else:
            ts = TtrackService()
            ts.service_name = request.POST['service_name']
            ts.save()
            response['flag'] = True
            response['message'] = "Record has been saved successfully."
        return JsonResponse(response)
    else:
        context = {}
        context['iso_services'] = TtrackService.objects.all()
        template = 'master/location/add-iso-service.html'
        return render(request, template, context)

@login_required
def editIsoService(request,iso_service_id):
    if request.method == "POST":
        response = {}
        ts = TtrackService.objects.get(id=iso_service_id) 
        ts.service_name = request.POST['service_name']
        ts.save()
        response['flag'] = True
        response['message'] = "Record has been updated successfully."
        return JsonResponse(response)

    else:
        context = {}
        context['iso_service'] = TtrackService.objects.get(id=iso_service_id) 
        template = 'master/location/edit-iso-service.html'
        return render(request, template, context)

@login_required
def ajaxIsoService(request):
    context = {}
    context['iso_services'] = TtrackService.objects.all().order_by('-id')
    template = 'master/location/ajax-iso-service-list.html'
    return render(request, template, context)


@login_required
def addReasons(request):
    if request.method == "POST":
        response = {}
        if SpReasons.objects.filter(reason=request.POST['reason_name']).exists() :
            response['flag'] = False
            response['message'] = "Reason already exists."
        else:
            rea = SpReasons()
            rea.reason = request.POST['reason_name']
            rea.status = 1
            rea.save()
            response['flag'] = True
            response['message'] = "Record has been saved successfully."
        return JsonResponse(response)
    else:
        context = {}
        context['reasons'] = SpReasons.objects.all()
        template = 'master/location/add-reason.html'
        return render(request, template, context)

@login_required
def editReasons(request,reason_id):
    if request.method == "POST":
        response = {}
        sre = SpReasons.objects.get(id=reason_id) 
        sre.reason = request.POST['reason_name']
        sre.save()
        response['flag'] = True
        response['message'] = "Record has been updated successfully."
        return JsonResponse(response)

    else:
        context = {}
        context['reason'] = SpReasons.objects.get(id=reason_id) 
        template = 'master/location/edit-reason.html'
        return render(request, template, context)

@login_required
def ajaxReasons(request):
    context = {}
    context['reasons'] = SpReasons.objects.all().order_by('-id')
    template = 'master/location/ajax-reasons-list.html'
    return render(request, template, context)

@login_required
def updateStatusReason(request,reason_id):

    response = {}
    res = SpReasons.objects.get(id=reason_id) 
    if res.status == 1:
        res.status = 0
    else:
        res.status = 1
    res.save()

    response['flag'] = True
    response['message'] = "Record has been updated successfully."
    return JsonResponse(response)
    
    
    
@login_required
def add_fy_year(request):
    if request.method == "POST":
        response = {}
        try:
            # Get form data
            from_date   = request.POST.get('from_date').strip()
            to_date     = request.POST.get('to_date').strip()
            start_month = from_date.split('/')[0]
            end_month   = to_date.split('/')[0]
            start_year  = from_date.split('/')[1]
            end_year    = to_date.split('/')[1]

            financial_year = str(start_year) + '-' + str(end_year)
            if int(end_year) - int(start_year) != 1 :
                raise ValueError("Financial year should be only on year diffrence ")

            if SpFinancialYears.objects.filter(financial_year=financial_year).exists():
                raise ValueError("Financial year already exists.")

            # Create SpFinancialYears object
            fy_year = SpFinancialYears.objects.create(
                financial_year=financial_year,
                start_month=int(start_month),
                start_year=start_year,
                end_month=int(end_month),
                end_year=end_year,
                start_month_name=MONTHS_NAME_NUMBER[int(start_month)],
                end_month_name=MONTHS_NAME_NUMBER[int(end_month)],
                status=1  # Assuming status is always set to 1 initially
            )

            response['flag'] = True
            response['message'] = "Financial year record has been saved successfully."
        except Exception as e:
            response['flag'] = False
            response['message'] = str(e)

        return JsonResponse(response)
    else:
        context = {}
        context['year'] = SpFinancialYears.objects.all()
        template = 'master/location/add-fy-year.html'
        return render(request, template, context)
        

@login_required
def ajax_fy_year(request):
    context = {}
    context['years'] = SpFinancialYears.objects.all().order_by('-id')
    template = 'master/location/ajax-fy-year.html'
    return render(request, template, context)

    