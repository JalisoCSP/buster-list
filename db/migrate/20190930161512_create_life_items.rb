class CreateLifeItems < ActiveRecord::Migration[6.0]
  def change
    create_table :life_items do |t|
      t.string :title
      t.date :date

      t.timestamps
    end
  end
end
