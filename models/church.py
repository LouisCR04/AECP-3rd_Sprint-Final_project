#!/usr/bin/python3
# church.py

""" Defines the church class"""
import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey, DateTime, Table
from sqlalchemy.orm import relationship


class Church(BaseModel, Base):
    """Initializes the Church class"""
    __tablename__ = 'churches'

    name = Column(String(128), nullable=False)
    subcounty_id = Column(String(60), ForeignKey('subcounties.id'),
                          nullable=False)
    in_finance = relationship("Infinance", backref="church",
                              cascade="all, delete, delete-orphan")
    out_finance = relationship("Outfinance", backref="church",
                               cascade="all, delete, delete-orphan")
    dep_finance = relationship("Deptfinance", backref="church",
                               cascade="all, delete, delete-orphan")


    def __init__(self, *args, **kwargs):
        """Initializes a subcounty"""
        super().__init__(*args, **kwargs)
