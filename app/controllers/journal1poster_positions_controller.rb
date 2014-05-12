class Journal1posterPositionsController < ApplicationController

  respond_to :html, :js, :json  

  layout 'journalposter'

  before_filter :force_http

  helper_method :sort_column, :sort_direction, :yesno


  def index
    
    session[:x_pos] = 0
    session[:y_pos] = 0

    gon.selected = 1
    
    @journal1poster_positions = Journal1posterPosition.order(sort_column + " " + sort_direction).paginate(:per_page => 1000, :page => params[:page])    

    # respond_to do |format|
      # format.html
      # format.json
      # format.js
    # end
    
  end
  
  
  def coord

    # render text: 'coord'
    
  end
  
  
  
  def new
    
    # render text: 'new'
    
    
    @journal1poster_position = Journal1posterPosition.new
    @id_map = 1
    # @x_pos = session[:x_pos]     
    # @y_pos = session[:y_pos]     
    
    # respond_to do |format|
      # format.html
      # format.json
      # format.js
    # end
    
        
  end

  
  def create
    

    # h_new = Hash.new
    # h_new = params[:journal1poster_position][:c1]
    # @journal1poster_position = Journal1posterPosition.new(h_new)
    # @journal1poster_position = Journal1posterPosition.new(params[:journal1poster_position])


    # jsonArray = [{"area_text":"Math"}, {"area_text":"English"}]
    # ar = ActiveSupport::JSON.decode( params[:journal1poster_position] )
    # ar = JSON.parse(params[:journal1poster_position])
    
    # ar = ActiveSupport::JSON.decode(params[:journal1poster_position])
    # ar = JSON.parse(params[:journal1poster_position])
    # ar = ActiveSupport::JSON.decode(params[:data])

    ar = params[:journal1poster_position]
    ar.each do |obj|
      journal1poster_position = Journal1posterPosition.new(obj)
      if journal1poster_position.save
        # redirect_to '/JournalPosterPositions-1'
      else
        # render text: 'error'
      end
    end

    # if @journal1poster_position.save
    # redirect_to '/JournalPosterPositions-1'  
    # else
      # # 
    # end

    respond_to do |format|
          format.html {}
          format.json { 
            render :json => @journal1poster_position
          }
    end

    
        
  end


  def edit
    
    @journal1poster_position = Journal1posterPosition.find_by_id(params[:id])    
    
  end
  
  
  def update

    respond_to do |format|
      format.html
      # format.json
      format.js
    end
    
    # journal1poster_position = Journal1posterPosition.find(params[:id])
#     
    # if journal1poster_position.update_attributes(params[:journal1poster_position])
      # redirect_to :action => 'index'
    # else
      # render text: ''
    # end
        
  end


  def demo_test_post
    
  end
  
  
  
  def dbdelete

      Journal1posterPosition.dbdelete
      Journal1posterPosition.dbclear

      redirect_to :action => 'index'
      
  end


  def delete
  end


  def destroy
  end



  private

    def journal1poster_position_params
      params.require(:journal1poster_position).permit(      
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


    def sort_column
      Journal1posterPosition.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def yesno(x)
      x == 1 ? "Yes" : "No"
    end
  

end
