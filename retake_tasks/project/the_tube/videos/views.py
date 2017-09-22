from rest_framework import viewsets
from rest_framework import generics

from .serializers import (
    VideoSerializer, VideoCommentsSerializer,
    CommentSerializer,
    VoteSerializer
)
from .models import Video, Comment, Vote


class VideoViewSet(viewsets.ModelViewSet):
    """Viewset for all the videos"""
    serializer_class = VideoSerializer
    queryset = Video.objects.order_by('title', '-updated_at')


class VideoCommentsViewSet(viewsets.ModelViewSet):
    """Viewset for specific video comments"""
    serializer_class = VideoCommentsSerializer

    def get_video(self):
        return generics.get_object_or_404(Video, id=self.kwargs['videos_pk'])

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context['video'] = self.get_video()

        return context

    def get_queryset(self):
        video = self.get_video()

        return video.comment_set.order_by('content', '-updated_at')


class CommentViewSet(viewsets.ModelViewSet):
    """Viewset for all the comments"""
    serializer_class = CommentSerializer
    queryset = Comment.objects.order_by('content', '-updated_at')


class VoteViewSet(viewsets.ModelViewSet):
    """Viewset for all the votes"""
    serializer_class = VoteSerializer
    queryset = Vote.objects.order_by('-created_at')
