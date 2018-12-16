require 'minitest/autorun'
require_relative '../models/owner'

class TestOwner < Minitest::Test


  def setup
    @owner = Owner.new("jenny bird")
  end

  def test_owner_nice_name
    assert_equal("Jenny Bird", @owner.nice_name() )
  end

end
