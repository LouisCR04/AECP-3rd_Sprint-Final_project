#!/usr/bin/python3
# outfinance.py

"""
Defines the finances utilized by the church. Will include projects, salaries,
humanitarian activites, crusades, etc
"""

import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import column, string, ForeignKey, Integer, DateTime
from sqlalchemy.orm import relationship


class Outfinance(BaseModel, Base):
    """Class representation of finances utilized by the church"""
    __tablename__ = 'outfinances'

    finance_type = Column(String(128), nullable=False)
    amount = Column(Integer, default=0)
    dated = Column(DateTime, nullable=False)
    church_id = Column(String(60), ForeignKey('churches.id'),
                       nullable=False)

    def __init__(self, *args, **kwargs):
        """Initializes the Infinance class"""
        super().__init__(*args, **kwargs)
