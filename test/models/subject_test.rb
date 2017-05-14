require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @subject = Subject.new(name: "Subject 1", owner_id: users(:two).id)
  end

  test "Non teachers should not a subject" do
    assert_not @subject.save
  end

  test "Subjects should not have an empty name" do
    @subject.name = "  "
    assert_not @subject.valid?
  end
  
end
