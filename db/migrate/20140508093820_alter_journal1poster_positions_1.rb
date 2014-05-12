class AlterJournal1posterPositions1 < ActiveRecord::Migration
  def change

    add_column :journal1poster_positions, :area_text, :string, :limit => 255
    add_column :journal1poster_positions, :area, :integer, :default => 0    
    add_column :journal1poster_positions, :area_pos, :integer, :default => 0
    add_column :journal1poster_positions, :pos_used, :boolean, :default => false
    
  end
end

# area_pos    integer
# area        integer
# area_text   string
# pos_used    boolean