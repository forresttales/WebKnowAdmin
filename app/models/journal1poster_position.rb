# == Schema Information
#
# Table name: journal1poster_positions
#
#  id         :integer          not null, primary key
#  id_map     :integer
#  pos_map    :integer          default(0)
#  pos_x      :integer          default(0)
#  pos_y      :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#  area_text  :string(255)
#  area       :integer          default(0)
#  area_pos   :integer          default(0)
#  pos_used   :boolean          default(FALSE)
#

class Journal1posterPosition < ActiveRecord::Base
  
  attr_accessible :id,
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
  
  
  belongs_to :journal1poster
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM journal1poster_positions")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE journal1poster_positions_id_seq RESTART WITH 1")
  end

  
end

# area_pos    integer
# area        integer
# area_text   string
