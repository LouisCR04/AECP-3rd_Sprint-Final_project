#!/usr/bin/python3
# deptfinance.py

"""
Defines the finances brought in by various departments.
The departments will not be limited to Youth,
Women's Guild, Mothers Union etc
"""

import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import column, string, ForeignKey, Integer, DateTime
from sqlalchemy.orm import relationship


class Deptfinance(BaseModel, Base):
    """
    Class representation of finances brought in from
    various departments of the church
    """
    __tablename__ = 'deptfinances'

    finance_type = Column(String(128), nullable=False)
    amount = Column(Integer, default=0)
    dated = Column(DateTime, nullable=False)
    church_id = Column(String(60), ForeignKey('churches.id'),
                       nullable=False)

    def __init__(self, *args, **kwargs):
        """Initializes the Infinance class"""
        super().__init__(*args, **kwargs)
