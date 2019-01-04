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
  'email_address' => 'jenny@arrg.com',
  'animal_preference' => 'cat'
  } )

owner2 = Owner.new( {
  'first_name' => 'heather',
  'last_name' => 'smith',
  'address' => '1 upper hill',
  'email_address' => 'hevvur@smile.co.uk',
  'animal_preference' => 'large dog'
  } )

owner3 = Owner.new( {
'first_name' => 'jim',
'last_name' => 'johnstone',
'address' => '1 main road',
'email_address' => 'jimbo@yahoop.co.uk',
'animal_preference' => 'small dog'
} )

owner4 = Owner.new( {
'first_name' => 'jack',
'last_name' => 'jones',
'address' => '17 trumpton street',
'email_address' => 'jjones@gooble.co.uk',
'animal_preference' => 'any dog'
} )

owner1.save
owner2.save
owner3.save
owner4.save

animal1 = Animal.new( {
    'name' => 'willow',
    'type' => 'cat',
    'breed' => 'moggie',
    'admission_date' => '01/10/2018',
    'training_complete' => true,
    'health_check_complete' => true ,
    'ready_to_adopt' => true,
    'adopted' => true
     } )

animal2 = Animal.new( {
    'name' => 'rufus',
    'type' => 'small dog',
    'breed' => 'beagle',
    'admission_date' => '04/08/2018',
    'training_complete' => true,
    'health_check_complete' => true,
    'ready_to_adopt' => true,
    'adopted' => true
     } )

animal3 = Animal.new( {
    'name' => 'lucy',
    'type' => 'large dog',
    'breed' => 'dalmation',
    'admission_date' => '16/11/2018',
    'training_complete' => true,
    'health_check_complete' => true,
    'ready_to_adopt' => true,
    'adopted' => true
    } )

  animal4 = Animal.new( {
    'name' => 'Buddy',
    'type' => 'small dog',
    'breed' => 'terrier',
    'admission_date' => '26/10/2018',
    'training_complete' => true,
    'health_check_complete' => true,
    'ready_to_adopt' => true,
    'adopted' => false
    } )

  animal5 = Animal.new( {
    'name' => 'Crusty',
    'type' => 'large dog',
    'breed' => 'collie',
    'admission_date' => '26/10/2018',
    'training_complete' => true,
    'health_check_complete' => true,
    'ready_to_adopt' => true,
    'adopted' => false
    } )


animal1.save
animal2.save
animal3.save
animal4.save
animal5.save


adoption1 = Adoption.new({'owner_id' => owner1.id, 'animal_id' => animal1.id})
adoption1.save
adoption2 = Adoption.new({'owner_id' => owner1.id, 'animal_id' => animal2.id})
adoption2.save
adoption3 = Adoption.new({'owner_id' => owner2.id, 'animal_id' => animal3.id})
adoption3.save

binding.pry
nil

# Keep for now, but all these can be deleted
# Owner.all # test works
# owner1.first_name = "bob" # test works
# owner1.update   # test works
# owner2.delete # test works

# animal1.breed = "siamese" # test works
# animal1.update # test works
# animal2.delete # test works

# banana = Owner.find(owner2.id) # test - works
# bananimal = Animal.find_animal_by_breed('beagle') # test - works
# owner1.animal() # test - return animals adopted by owner
# animal1.owner() # test - return owners of animals
