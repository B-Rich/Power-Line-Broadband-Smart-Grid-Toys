class CreateLaskutoimintos < ActiveRecord::Migration[5.1]
  def change
    create_table :laskutoimintos do |t|

      t.timestamps
    end
  end
end
