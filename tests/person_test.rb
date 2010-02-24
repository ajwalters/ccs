require 'test/unit'
require 'supermodel'
require '../models/person'



class PersonTest < Test::Unit::TestCase
  def create_person
    p = Person.new
    p.first_name = "Penelope"
    p.last_name = "Hall"
    return p
  end

  def test_create_person
    p = create_person()
    assert_equal p.first_name, "Penelope"
    assert_equal p.last_name, "Hall"
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
    Person.all.each {|e| puts e.first_name}
    #actual = Person.first
    #assert_equal "Hall", actual.last_name
  end
end

