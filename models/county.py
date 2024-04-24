#!/usr/bin/python3
# county.py

"""
Defines the County class
"""

import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey
from sqlalchemy.orm import relationship


class County(BaseModel, Base):
    """This is the county class"""
    __tablename__ = 'counties'
    name = Column(String(128), nullable=False)
    subcounties = relationship("Subcounty", backref="county",
                               cascade="all, delete, delete-orphan")

    def __init__(self, *args, **kwargs):
        """Initialize Counties"""
        super().__init__(*args, **kwargs)

    @property
    def subcounties(self):
        """Getter for subcounty list in the County"""
        subc_list = []
        all_subcounties = models.storage.all(models.subcounty.Subcounty)

        for subcounty in all_subcounties.values():
            if subcounty.county_id == self.id:
                subc_list.append(subcounty)

        return subc_list
