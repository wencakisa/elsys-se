from django.db import models


class Article(models.Model):
    """The base abstract model"""
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


class Video(Article):
    title = models.CharField(blank=False, max_length=100)

    class Meta:
        ordering = ['-updated_at']

    def __str__(self):
        return '{} #{} - {}'.format(
            self.__class__.__name__, self.id, self.title
        )


class VideoArticle(Article):
    """The base abstract model, that is related with a video"""
    video = models.ForeignKey(Video, on_delete=models.CASCADE)

    class Meta:
        abstract = True

    def __str__(self):
        return '{} #{} ({})'.format(
            self.__class__.__name__, self.id, self.video
        )
    

class Comment(VideoArticle):
    content = models.TextField(blank=False, max_length=10000)


class Vote(VideoArticle):
    value = models.CharField(blank=False, max_length=100)
