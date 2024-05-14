from django.urls import include, path
from . import views
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('', views.index, name="login"),
    path('login', views.index, name="login"),
    path('logout/', views.logout_view, name='logout'),
    path('forgot-password', views.forgotPassword, name="forgot-password"),
    path('reset-password/<str:token>', views.resetPassword, name="reset-password"),
    path('custom-dashboard',views.customDashboard, name="custom-dashboard"),
    path('filter-chart',views.filter_chart, name="filter-chart"),
    path('filter-chart1',views.filter_chart1, name="filter-chart1"),
    path('revenue-filter',views.lead_revenue_filter, name="revenue-filter"),

]
