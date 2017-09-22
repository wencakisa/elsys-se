from django.contrib import admin
from django.contrib.admin.decorators import register

from .models import Video, Comment, Vote


class CommentAdmin(admin.StackedInline):
    model = Comment


class VoteAdmin(admin.StackedInline):
    model = Vote


@register(Video)
class VideoAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'created_at', 'updated_at']
    inlines = [CommentAdmin, VoteAdmin]