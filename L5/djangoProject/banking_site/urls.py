from django.urls import path, include, re_path
from .views import *

urlpatterns = [
    path("", index, name="index"),
    path("home/", index, name="home"),
    path("dashboard/", dashboard, name="dashboard"),
    path("signup/", SignUpView.as_view(), name="signup"),
    path("logout/", logout, name="logout"),
    path("new_transfer/", new_transfer),
    path("new_transfer/confirmed", confirmed_transfer),
]
