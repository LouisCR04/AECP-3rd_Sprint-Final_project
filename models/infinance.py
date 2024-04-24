#!/usr/bin/python3
# in_finance.py

"""
Defines the finances into the church. Will include Tithe, Offering etc
"""

import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey, Integer, DateTime
from sqlalchemy.orm import relationship


class Infinance(BaseModel, Base):
    """Class representation of finances into the church"""
    __tablename__ = 'infinances'

    finance_type = Column(String(128), nullable=False)
    amount = Column(Integer, default=0)
    dated = Column(DateTime, nullable=False)
    church_id = Column(String(60), ForeignKey('churches.id'),
                       nullable=False)

    def __init__(self, *args, **kwargs):
        """Initializes the Infinance class"""
        super().__init__(*args, **kwargs)
