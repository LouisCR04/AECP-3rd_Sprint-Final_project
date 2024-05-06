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
"""county_4 = County(name="Murang'a")
print("New County: {}".format(county_4))
county_4.save()"""

county_4.id = "9dd5e428-dcf2-4bad-b655-b2a1778d77c3"

subcounty_2 = Subcounty(county_id=county_4.id, name="Kandara")
print("New Subcounty: {}".format(subcounty_2))
subcounty_2.save()

church_1_1 = Church(county_id=county_4.id, subcounty_id=subcounty_2.id, name="AECP North")
print("New church: {} in the subcounty: {}".format(church_1_1, subcounty_2))
church_1_1.save()

church_1_2 = Church(county_id=county_4.id, subcounty_id=subcounty_2.id, name="AECP Cathedral")
print("New church: {} in the subcounty: {}".format(church_1_2, subcounty_2))
church_1_2.save()

church_1_3 = Church(county_id=county_4.id, subcounty_id=subcounty_2.id, name="AECP Paris")
print("New church: {} in the subcounty: {}".format(church_1_3, subcounty_2))
church_1_3.save()


"""
 Verification
"""
print("")
all_subcounties = storage.all(Subcounty)
for subcounty_id, subcounty in all_subcounties.items():
    for church in subcounty.subcounty:
        print("Find the church {} in the subcounty {}".format(church, subcounty))
