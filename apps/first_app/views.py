
from __future__ import unicode_literals
from django.shortcuts import render, HttpResponse, redirect

def index(request):
    return render(request, "first_app/index.html")

def monotron(request):
    return render(request, "first_app/monotron.html")

def tuner(request):
    return render(request, "first_app/tuner.html")