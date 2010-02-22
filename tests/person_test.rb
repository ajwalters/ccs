require 'test/unit'
require 'supermodel'
require '../models/person'



class PersonTest < Test::Unit::TestCase
  def create_person
    p = Person.new
    p.FirstName = "Penelope"
    p.LastName = "Hall"
    return p
  end

  def test_create_person
    p = create_person()
    assert_equal p.FirstName, "Penelope"
    assert_equal p.LastName, "Hall"
  end

  def test_save_person_to_supermodel
    p = create_person()
    saved = p.save
    assert saved
  end

  def test_save_and_retrieve_person_from_supermodel
    p = create_person()
    saved = p.save
    assert saved                        
    actual = Person.all
    assert_equal actual.LastName, "Hall"
  end
end

