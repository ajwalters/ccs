require File.dirname(__FILE__) + '/../build/Debug/Cecil.FlowAnalysis.dll'
require File.dirname(__FILE__) + '/../build/Debug/Db4objects.Db4o.Linq.dll'
require File.dirname(__FILE__) + '/../build/Debug/Db4objects.Db4o.dll'
require File.dirname(__FILE__) + '/../build/Debug/Ccs.dll'
include Ccs::Site::Models
require 'rubygems'
require 'spec'

describe "ObjectRepository needs to support CRUD operations" do
  it "should save an object" do
    r = Ccs::Site::Models::ObjectRepository[Person].new
    p = Person.new
    p.name = "Penelope Hall"
    r.Save(p)
  end

  it "should delete an object" do
  end

  it "should update an object" do
  end

  it "should find an object by id" do
  end
end


class Person
  attr_accessor :name
end