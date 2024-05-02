#!/usr/bin/python3
# __init__.py

"""Module initializer - API Blueprint"""

from flask import Blueprint

app_views = Blueprint('app_views', __name__, url_prefix='/api/v1')

from api.v1.views.indexes import *
from api.v1.views.counties import *
from api.v1.views.subcounties import *
from api.v1.views.churches import *
from api.v1.views.infinances import *
from api.v1.views.outfinances import *
from api.v1.views.deptfinances import *
