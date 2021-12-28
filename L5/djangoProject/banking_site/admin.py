from django.contrib import admin
from .models import Account, Transfer


class AccountAdmin(admin.ModelAdmin):
    list_display = ('user', 'balance', 'number')
    fieldsets = [
        ('User', {'fields': ['user']}),
        ('Balance', {'fields': ['balance']}),
        ('Number', {'fields': ['number']}),
    ]


admin.site.register(Account, AccountAdmin)
admin.site.register(Transfer)
