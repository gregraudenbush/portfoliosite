from django.conf.urls import url
from . import views           # This line is new!
urlpatterns = [
url(r'^$', views.index),
url(r'^monotron$', views.monotron),
url(r'^tuner$', views.tuner)
     # This line has changed!
]