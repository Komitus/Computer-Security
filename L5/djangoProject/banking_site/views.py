import decimal

from django.contrib.messages.views import SuccessMessageMixin
from django.core.handlers.wsgi import WSGIRequest
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.generic import CreateView
from .forms import UserRegisterForm, TransferForm
from .models import Transfer, Account


def index(request: WSGIRequest):
    if request.user.is_authenticated:
        return redirect("/dashboard")
    else:
        return render(request, "home.html")


class SignUpView(SuccessMessageMixin, CreateView):
    form_class = UserRegisterForm
    success_url = reverse_lazy("login")
    template_name = "registration/signup.html"


def logout(request: WSGIRequest):
    return render(request, "registration/logout.html")


def dashboard(request: WSGIRequest):
    if request.user.is_authenticated:
        acc_number = Account.objects.get(user=request.user.id).number
        return render(
            request,
            "dashboard.html",

            context={
                "transfers": {

                    "outgoing": Transfer.objects.filter(
                        sender_account=acc_number
                    ).order_by('-date'),
                    "incoming": Transfer.objects.filter(
                        recipient_account=acc_number
                    ).order_by('-date'),
                },
                "acc_number": acc_number,
            },
        )
    return redirect("/accounts/login")


def new_transfer(request: WSGIRequest):
    if request.user.is_authenticated:
        if request.method == "POST":
            form = TransferForm(request.POST)
            if form.is_valid():
                acc_balance = Account.objects.get(user_id=request.user.id).balance
                if acc_balance < form.cleaned_data.get('amount'):
                    form.add_error('amount', "You don't have enough money")
                else:
                    return render(
                        request,
                        "transfers/confirm-transfer.html",
                        context={"transfer": form.cleaned_data},
                    )
        else:
            form = TransferForm()
        return render(request, "transfers/new-transfer.html", {"form": form})
    return redirect("/accounts/login")


def confirmed_transfer(request: WSGIRequest):
    user = request.user
    if user.is_authenticated and request.method == "POST":
        Transfer.objects.create(
            sender_name=user.first_name,
            sender_surname=user.last_name,
            sender_account=Account.objects.get(user_id=user.id).number,
            recipient_name=request.POST["recipient_name"],
            recipient_surname=request.POST["recipient_surname"],
            recipient_account=request.POST["recipient_account"],
            amount=decimal.Decimal(request.POST["amount"]),
            title=request.POST["title"]
        )
        return render(
            request,
            "transfers/transfer-completed.html",
            context={
                "recipient_name": request.POST["recipient_name"],
                "recipient_surname": request.POST["recipient_surname"],
                "recipient_account": request.POST["recipient_account"],
                "amount": decimal.Decimal(request.POST["amount"]),
                "title": request.POST["title"]
            },
        )
    return redirect("/accounts/login")
