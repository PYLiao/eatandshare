class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.text :caption

    	t.integer :usermodel_id
    	t.integer :stay_id

      t.timestamps
    end

    add_index :photos, [:usermodel_id, :stay_id]
    add_index :photos, :stay_id
  end
end
