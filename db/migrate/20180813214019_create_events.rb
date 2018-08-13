class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :details
      t.datetime :time
      t.string :location
      t.string :url
      t.string :image
    end
  end
end
