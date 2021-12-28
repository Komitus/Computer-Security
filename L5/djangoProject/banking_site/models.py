from decimal import Decimal

from django.core.validators import RegexValidator, MinValueValidator
from django.db import models
from django.contrib.auth.models import User
from django.db.models import Max
from django.dispatch import receiver
from django.db.models.signals import post_save, pre_save
from django.utils import timezone

in_number_validator = RegexValidator(regex='2137111111[0-9]{16}', message='Must start with 2137111111 and then 16 digits')
out_number_validator = RegexValidator(regex='[0-9]{26}', message='Must contain 26 digits')


class Account(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    balance = models.DecimalField(decimal_places=2, max_digits=15)
    number = models.CharField(validators=[in_number_validator], max_length=26, null=False)

    def __str__(self):
        return self.user.username


class Transfer(models.Model):
    sender_name = models.CharField(null=False, blank=False, max_length=30)
    sender_surname = models.CharField(null=False, blank=False, max_length=30)
    sender_account = models.CharField(validators=[out_number_validator], max_length=26, null=False)

    recipient_name = models.CharField(null=False, blank=False, max_length=80)
    recipient_surname = models.CharField(null=False, blank=False, max_length=30)
    recipient_account = models.CharField(validators=[out_number_validator], max_length=26, null=False)

    title = models.CharField(null=False, blank=False, max_length=120)
    amount = models.DecimalField(null=False, decimal_places=2, max_digits=10, validators=[MinValueValidator(Decimal('0.01'))])
    date = models.DateTimeField(default=timezone.now)

    executed = models.BooleanField(default=False, null=False)


@receiver(post_save, sender=Transfer, dispatch_uid="update_accounts_balance")
def update_accounts_balance(sender, instance, created, **kwargs):

    if not instance.executed:
        recipient_balance = Account.objects.filter(number=instance.recipient_account).values_list('balance', flat=True)
        #recipient_balance = Account.objects.get(number=instance.recipient_account).balance
        if recipient_balance:
            Account.objects.filter(number=instance.recipient_account).update(
                balance=(recipient_balance[0] + instance.amount))

        sender_balance = Account.objects.filter(number=instance.sender_account).values_list('balance', flat=True)
        #sender_balance = Account.objects.get(number=instance.sender_account).balance
        if sender_balance:
            Account.objects.filter(number=instance.sender_account).update(
                balance=(sender_balance[0] - instance.amount))

        Transfer.objects.filter(id=instance.id).update(executed=True)


@receiver(post_save, sender=User, dispatch_uid="create_account_for_user")
def create_account_for_user(sender, instance, created, **kwargs):
    if created:
        base_number = 21371111110000000000000000
        try:
            end = Account.objects.aggregate(Max('id')).get('id__max')
        except Exception:
            end = 1
        new_number = base_number+end
        Account.objects.create(user=instance, balance=Decimal('0.00'), number=new_number)



