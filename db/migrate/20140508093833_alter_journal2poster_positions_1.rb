class AlterJournal2posterPositions1 < ActiveRecord::Migration
  def change
    
    add_column :journal2poster_positions, :area_text, :string, :limit => 255
    add_column :journal2poster_positions, :area, :integer, :default => 0    
    add_column :journal2poster_positions, :area_pos, :integer, :default => 0
    add_column :journal2poster_positions, :pos_used, :boolean, :default => false
    
  end
end
