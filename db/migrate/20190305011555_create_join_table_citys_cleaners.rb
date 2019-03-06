class CreateJoinTableCitysCleaners < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cities, :cleaners do |t|
      # t.index [:city_id, :cleaner_id]
      # t.index [:cleaner_id, :city_id]
    end
  end
end
