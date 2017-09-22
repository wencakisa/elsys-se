from rest_framework import serializers

from .models import Video, Comment, Vote


class VideoSerializer(serializers.ModelSerializer):
    """Serializer for the Video model"""
    class Meta:
        model = Video
        fields = ('id', 'title', 'created_at', 'updated_at')


class VideoCommentsSerializer(serializers.ModelSerializer):
    """Serialzier for the nested video comments"""
    class Meta:
        model = Comment
        fields = ('id', 'content', 'created_at', 'updated_at')
    

    def create(self, validated_data):
        video = self.context['video']

        return self.Meta.model.objects.create(video=video, **validated_data)


class CommentSerializer(serializers.ModelSerializer):
    """Serializer for the Comment model"""
    class Meta:
        model = Comment
        fields = ('id', 'video', 'content')


class VoteSerializer(serializers.ModelSerializer):
    """Serializer for the Vote model"""
    class Meta:
        model = Vote
        fields = ('id', 'video', 'value')
