class Journal5posterPositionsController < ApplicationController

  layout 'journalposter'

  before_filter :force_http


  def index
    
    gon.selected = 5
    
  end
  
  
  def new
  end

  
  def create
  end


  def edit
  end
  
  
  def update
  end


  def dbdelete

      Journal5posterPosition.dbdelete
      Journal5posterPosition.dbclear

      # respond_to do |format|
        # format.js { redirect_to(:action => 'index', :form => :js ) }
        # format.html
      # end
      
  end


  def delete
  end


  def destroy
  end



  private

    def journal5poster_position_params
      params.require(:journal5poster_position).permit(      
                                                      :id_map,   
                                                      :pos_map,   
                                                      :pos_x,      
                                                      :pos_y,    
                                                      :area_text,
                                                      :area,
                                                      :area_pos,
                                                      :pos_used,                                                          
                                                      :created_at, 
                                                      :updated_at 
                                                     )
                                        
    end

  

end
