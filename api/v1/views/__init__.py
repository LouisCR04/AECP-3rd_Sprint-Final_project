#!/usr/bin/python3
# __init__.py

"""Module initializer - API Blueprint"""

from flask import Blueprint

app_views = Blueprint('app_views', __name__, url_prefix='/api/v1')

from api.v1.views.index import *
from api.v1.views.county import *
from api.v1.views.subcounty import *
from api.v1.views.church import *
from api.v1.views.infinance import *
from api.v1.views.outfinance import *
from api.v1.views.deptfinance import *
