#!/usr/bin/python3
"""
Contains the Database Storage class
"""

import models
from models.base_model import BaseModel, Base
from models.county import County
from models.subcounty import Subcounty
from models.church import Church
from models.infinance import Infinance
from models.outfinance import Outfinance
from models.deptfinance import Deptfinance
from os import getenv
import sqlalchemy
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

classes = {"County": County, "Subcounty": Subcounty, "Church": Church,
           "Infinance": Infinance, "Outfinance": Outfinance,
           "Deptfinance": Deptfinance}


class DBStorage:
    """Interacts with the MySQL database"""
    __engine = None
    __session = None

    def __init__(self):
        """Instatntiates a DBStorage object"""
        MSQL_USER = getenv('MSQL_USER')
        MSQL_PWD = getenv('MSQL_PWD')
        MSQL_HOST = getenv('MSQL_HOST')
        MSQL_DB = getenv('MSQL_DB')

        self.__engine = create_engine('mysql+mysqldb://{}:{}@{}/{}'.
                                      format(MSQL_USER,
                                             MSQL_PWD,
                                             MSQL_HOST,
                                             MSQL_DB))

    def all(self, cls=None):
        """Queries the current database session"""
        new_dict = {}

        for clss in classes:
            if cls is None or cls is classes[clss] or cls is clss:
                objs = self.__session.query(classes[clss]).all()
                for obj in objs:
                    key = obj.__class__.__name__ + '.' + obj.id
                    new_dict[key] = obj

        return (new_dict)

    def new(self, obj):
        """Add an object to the database"""
        self.__session.add(obj)

    def save(self):
        """Save changes to the database"""
        self.__session.commit()

    def delete(self, obj=None):
        """Deletes from the current database session if not None"""
        if obj is not None:
            self.__session.delete(obj)

    def reload(self):
        """Reloads data from the database"""
        Base.metadata.create_all(self.__engine)
        sess_factory = sessionmaker(bind=self.__engine,
                                    expire_on_commit=False)
        Session = scoped_session(sess_factory)
        self.__session = Session

    def close(self):
        """Call remove on private session"""
        self.__session.remove()

    def get(self, cls, id):
        """
        Returns object based on class name & id else None if not found
        """
        sub = None
    
        # Get all Subcounty objects from storage
        all_subcounties = Storage.all(Subcounty).values()

        # Find the Subcounty object with the matching name
        for sub_obj in all_subcounties:
            if sub_obj.name == subcounty:
                sub = sub_obj
                break
    
        if sub is None:
            abort(404)
    
        ch_list = sorted(sub.churches, key=lambda k: k.name)
        return None

    def count(self, cls=None):
        """
        Count number of objects
        """
        all_class = classes.values()

        if not cls:
            count = 0
            for clas in all_class:
                count += len(models.storage.all(cls).values())
        else:
            count = len(models.storage.all(cls).values())

        return count
