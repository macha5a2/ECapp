class CreateSellHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :sell_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
