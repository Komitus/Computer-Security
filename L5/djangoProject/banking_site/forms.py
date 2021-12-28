from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import Transfer

class UserRegisterForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, required=True, help_text="Optional")
    last_name = forms.CharField(max_length=30, required=True, help_text="Optional")
    email = forms.EmailField(max_length=254, required=True, help_text="Enter a valid email address")

    class Meta:
        model = User
        fields = [
            "username",
            "first_name",
            "last_name",
            "email",
            "password1",
            "password2",
        ]


class TransferForm(forms.ModelForm):
    class Meta:
        model = Transfer
        fields = [
            'recipient_name',
            'recipient_surname',
            'recipient_account',
            'title',
            'amount',
        ]
