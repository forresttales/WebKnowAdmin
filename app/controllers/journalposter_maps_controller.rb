class JournalposterMapsController < ApplicationController
  
  layout 'journalposter_map'
  
  
  def index
  
    @journal1poster_positions = Journal1posterPosition.all
      
  end
  
  
end
