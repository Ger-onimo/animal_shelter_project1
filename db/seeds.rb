require('pry')
require('pg')
require_relative('../models/owner')
require_relative('../models/animal')
require_relative('../models/adoption')

Adoption.delete_all()
Animal.delete_all()
Owner.delete_all()


owner1 = Owner.new( {
  'first_name' => 'jenny',
  'last_name' => 'bird',
  'address' => '10 delta way',
  'email_address' => 'jenny@arrg.com'
  } )

owner2 = Owner.new( {
  'first_name' => 'heather',
  'last_name' => 'smith',
  'address' => '1 upper hill',
  'email_address' => 'hevvur@smile.co.uk'
  } )

owner1.save
owner2.save

animal1 = Animal.new( {
    'name' => 'willow',
    'breed' => 'moggie',
    'admission_date' => '2018-10-01',
    'training_complete' => true,
    'health_check_complete' => true,
    'ready_to_adopt' => true,
     } )

animal2 = Animal.new( {
    'name' => 'rufus',
    'breed' => 'beagle',
    'admission_date' => '2018-08-04',
    'training_complete' => false,
    'health_check_complete' => true,
    'ready_to_adopt' => false,
     } )

animal3 = Animal.new( {
    'name' => 'lucy',
    'breed' => 'dalmation',
    'admission_date' => '2018-06-26',
    'training_complete' => true,
    'health_check_complete' => false,
    'ready_to_adopt' => false,
    } )

animal1.save
animal2.save
animal3.save

adoption1 = Adoption.new({'owner_id' => owner1.id, 'animal_id' => animal1.id})
adoption1.save
adoption2 = Adoption.new({'owner_id' => owner1.id, 'animal_id' => animal2.id})
adoption2.save
adoption3 = Adoption.new({'owner_id' => owner2.id, 'animal_id' => animal3.id})
adoption3.save


# banana = Owner.find_by_id(owner2.id)
# bananimal = Animal.find_by_id(animal1.id)

binding.pry
nil

#  Keep for now, but all these can be deleted
# Owner.all # test works
# owner1.first_name = "bob" # test works
# owner1.update   # test works
# owner2.delete # test works

# animal1.breed = "siamese" # test works
# animal1.update # test works
# animal2.delete # test works
