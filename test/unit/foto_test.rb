require 'test_helper'

class FotoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Foto.new.valid?
  end
end
