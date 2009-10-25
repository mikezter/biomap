class Foto < ActiveRecord::Base

  
  acts_as_mappable
  has_attached_file :foto, :styles => { :medium => "300x300>", :thumb => "100x100>", :max => "800x1000>" }

  def lat_lng
    [lat || 0, lng || 0]
  end

end
