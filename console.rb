require('pry')
require('pg')
require_relative('models/owner')

Owner.delete_all # for testing CRUD

owner1 = Owner.new({
  'first_name' => 'sue',
  'last_name' => 'solid',
  'address' => '10 delta way',
  'postcode' => 'eh23 2dd',
  'tel_number' => '01236543734',
  'email_address' => 'sue.solid@arrg.com',
  'animal_adopted' => 'tigger'
  })

owner2 = Owner.new({
  'first_name' => 'heather',
  'last_name' => 'smith',
  'address' => '1 upper hill',
  'postcode' => 'eh23 2dd',
  'tel_number' => '07745809756',
  'email_address' => 'hevvur@smile.co.uk',
  'animal_adopted' => 'rover'
  })

owner1.save()
owner2.save()

animal1 = Animal.new({
  'name' => 'tiddles',
  'animal_type' => 'cat',
  'admission_date' => '25/06/2018',
  'completed_training' => true,
  'completed_health_check' => true,
  'ready_to_adopt' => true,
  'adopted_by' => 'a person'
  'owner_id' => owner1.id
  })
  
animal1.save()

Owner.all()



# owner1.first_name = "hardy"  #for testing CRUD
# owner1.update

# owner1.delete()


binding.pry
nil
