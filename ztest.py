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

church_1_1 = church(subcounty_id=subcounty_2.id, name="AECP Cathedral")
print("New church: {} in the subcounty: {}".format(church_1_1, subcounty_2))
church_1_1.save()

church_1_2 = church(subcounty_id=subcounty_2.id, name="AECP Parish")
print("New church: {} in the subcounty: {}".format(church_1_2, subcounty_2))
church_1_2.save()

church_1_3 = church(subcounty_id=subcounty_2.id, name="AECP Cathedral")
print("New church: {} in the subcounty: {}".format(church_1_3, subcounty_2))
church_1_3.save()

"""
 Verification
"""
print("")
all_subcounties = storage.all(Subcounty)
for subcounty_id, subcounty in all_subcounties.items():
    for church in subcounty.subcounties:
        print("Find the church {} in the subcounty {}".format(church, subcounty))
