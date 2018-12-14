require('pry')
require('pg')
require_relative('../models/owner')

Owner.delete_all

owner1 = Owner.new( {
  'first_name' => 'jenny',
  'last_name' => 'bird',
  'address' => '10 delta way',
  'postcode' => 'eh23 2dd',
  'tel_number' => '01236543734',
  'email_address' => 'jenny@arrg.com'
  } )

owner2 = Owner.new( {
  'first_name' => 'heather',
  'last_name' => 'smith',
  'address' => '1 upper hill',
  'postcode' => 'eh23 2dd',
  'tel_number' => '07745809756',
  'email_address' => 'hevvur@smile.co.uk',
  } )

owner1.save
owner2.save

Owner.all

owner1.first_name = "bob"
owner1.update   #test update - was working yesterday!!

owner2.delete #test delete - was working yesterday!!

binding.pry
nil
