require 'test_helper'

class UrlableTest < ActiveSupport::TestCase
  def test_that_it_has_a_version_number
    refute_nil ::Urlable::VERSION
  end

  def test_it_does_something_useful
    assert urls(:link1).urlable.is_a? Article
    assert urls(:link2).urlable.is_a? Tag
  end
end
