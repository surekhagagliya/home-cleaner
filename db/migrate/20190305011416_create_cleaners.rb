class CreateCleaners < ActiveRecord::Migration[5.2]
  def change
    create_table :cleaners do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_no
      t.integer :quality_score
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
