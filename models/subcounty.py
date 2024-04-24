#!/usr/bin/python
"""
Defines the sub_county Class
"""

import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey
from sqlalchemy.orm import relationship


class Subcounty(BaseModel, Base):
    """Initializes the Sub_county class"""
    __tablename__ = 'subcounties'

    name = Column(String(128), nullable=False)
    county_id = Column(String(60), ForeignKey('counties.id'), nullable=False)
    churches = relationship("Church", backref="subcounty",
                            cascade="all, delete, delete-orphan")

    def __init__(self, *args, **kwargs):
        """Initializes a subcounty"""
        super().__init__(*args, **kwargs)

    @property
    def churches(self):
        """Getter for churches list in the subcounty"""
        from models.church import Church
        church_list = []
        all_churches = models.storage.all(Church)

        for church in all_churches.values():
            if church.subcounty_id == self.id:
                church_list.append(subcounty)

        return church_list
