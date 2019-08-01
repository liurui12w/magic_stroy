class CreateCarousels < ActiveRecord::Migration[5.2]
  def change
    create_table :carousels do |t|
      t.string :image, comment: 'image'
      t.string :name, comment: 'image'
      t.boolean :is_hot, default: false

      t.timestamps
    end
  end
end
