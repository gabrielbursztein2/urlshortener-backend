class CreateUrlShorts < ActiveRecord::Migration[6.0]
  def change
    create_table :url_shorts do |t|
      t.string :url, null: false
      t.string :short_url, null: false, index: true
      t.integer :visits, null: false, default: 0
      t.timestamps
    end
  end
end
