#!/usr/bin/python3
# county.py

"""
Defines the County class
"""

import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import column, string, ForeignKey
from sqlalchemy.orm import relationship


class County(BaseModel, Base):
    """This is the county class"""
