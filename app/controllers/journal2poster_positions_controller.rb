class Journal2posterPositionsController < ApplicationController
  
  layout 'journalposter'

  before_filter :force_http


  def index
    
    gon.selected = 2
    
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

      Journal2posterPosition.dbdelete
      Journal2posterPosition.dbclear

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

    def journal2poster_position_params
      params.require(:journal2poster_position).permit(      
                                                      :id_map,   
                                                      :pos_map,   
                                                      :pos_x,      
                                                      :pos_y,    
                                                      :created_at, 
                                                      :updated_at 
                                                     )
                                        
    end

  
  
end
