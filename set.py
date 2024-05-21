#!/usr/bin/python3

"""
 Test subcounties access from a county
"""
from models import storage
from models.county import County
from models.subcounty import Subcounty
from models.church import Church

"""
 Objects creations
"""
county_4 = County(name="Nakuru")
print("New County: {}".format(county_4))
county_4.save()

subcounty_2 = Subcounty(county_id=county_4.id, name="Naivasha")
print("New Subcounty: {}".format(subcounty_2))
subcounty_2.save()

church_1_1 = Church(county_id=county_4.id, subcounty_id=subcounty_2.id, name="AECP West")
print("New church: {} in the subcounty: {}".format(church_1_1, subcounty_2))
church_1_1.save()

church_1_2 = Church(county_id=county_4.id, subcounty_id=subcounty_2.id, name="AECP Cathedral")
print("New church: {} in the subcounty: {}".format(church_1_2, subcounty_2))
church_1_2.save()

church_1_3 = Church(county_id=county_4.id, subcounty_id=subcounty_2.id, name="AECP Parish")
print("New church: {} in the subcounty: {}".format(church_1_3, subcounty_2))
church_1_3.save()

church_1_4 = Church(county_id=county_4.id, subcounty_id=subcounty_2.id, name="AECP Central")
print("New church: {} in the subcounty: {}".format(church_1_3, subcounty_2))
church_1_4.save()
