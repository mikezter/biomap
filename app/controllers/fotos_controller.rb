class FotosController < ApplicationController
  def index
    @fotos = Foto.all(:order => :created_at)
    center = [0, 0]
  	
  	# init map
  	@map = GMap.new("map_div")
	  @map.center_zoom_init(center, 2)
    @map.set_map_type_init(GMapType::G_HYBRID_MAP)
    
    # add fotos to map
    @fotos.each do |foto|
  	  @map.overlay_init GMarker.new(foto.lat_lng, :title => foto.name)
    end

  end
  
  def show
    @foto = Foto.find(params[:id])
  end
  
  def new
    @foto = Foto.new
    center = [0, 0]
  	@map = GMap.new("map_div")
	  @map.center_zoom_init(center, 1)
    @map.set_map_type_init(GMapType::G_HYBRID_MAP)
    @map.event_init(@map, 'click', "function(overlay, latlng) { mapClick(latlng) }")
  end
  
  def create
    @foto = Foto.new(params[:foto])
    if @foto.save
      flash[:notice] = "Successfully created foto."
      redirect_to @foto
    else
      render :action => 'new'
    end
  end
  
  def edit
    @foto = Foto.find(params[:id])
  	@map = GMap.new("map_div")
	  @map.control_init(
	    :large_map => true
	  )
    map_for_foto
    @map.event_init(@map, 'click', "function(overlay, latlng) { mapClick(latlng) }")
  end
  
  def update
    @foto = Foto.find(params[:id])
    if @foto.update_attributes(params[:foto])
      flash[:notice] = "Successfully updated foto."
      redirect_to @foto
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @foto = Foto.find(params[:id])
    @foto.destroy
    flash[:notice] = "Successfully destroyed foto."
    redirect_to fotos_url
  end
  
protected
  
  def map_for_foto
  	@map = GMap.new("map_div")
	  @map.control_init(:large_map => true,:map_type => true)
	  @map.center_zoom_init(@foto.lat_lng, 5)
	  @map.overlay_init GMarker.new(@foto.lat_lng,:title => @foto.name)
	  @map.record_init @map.add_overlay(GMarker.new(@foto.lat_lng,:title => @foto.name))
    @map.set_map_type_init(GMapType::G_HYBRID_MAP)
  end 
   
end
