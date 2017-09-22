from django.conf.urls import url
from rest_framework_nested import routers

from . import views

videos_router = routers.SimpleRouter()
videos_router_prefix = r'videos'
videos_router.register(
    prefix=videos_router_prefix,
    viewset=views.VideoViewSet,
    base_name='videos'
)

comments_router_prefix = r'comments'

comments_router = routers.SimpleRouter()
comments_router.register(
    prefix=comments_router_prefix,
    viewset=views.CommentViewSet,
    base_name='comments'
)

votes_router = routers.SimpleRouter()
votes_router_prefix = r'votes'
votes_router.register(
    prefix=votes_router_prefix,
    viewset=views.VoteViewSet,
    base_name='votes'
)

video_comments_router = routers.NestedSimpleRouter(
    parent_prefix=videos_router_prefix,
    parent_router=videos_router,
    lookup='videos'
)
video_comments_router.register(
    prefix=comments_router_prefix,
    viewset=views.VideoCommentsViewSet,
    base_name='video_comments'
)

urlpatterns = []
urlpatterns += videos_router.urls
urlpatterns += comments_router.urls
urlpatterns += votes_router.urls
urlpatterns += video_comments_router.urls
