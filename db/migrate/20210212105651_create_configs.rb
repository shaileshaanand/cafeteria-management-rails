class CreateConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :configs do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
