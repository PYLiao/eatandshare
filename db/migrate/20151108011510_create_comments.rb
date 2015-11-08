class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :message
    	t.string :rating

    	t.integer :usermodel_id
    	t.integer :stay_id

      t.timestamps
 	end

      add_index :comments, [:usermodel_id, :stay_id]
      add_index :comments, :stay_id
  end
end
