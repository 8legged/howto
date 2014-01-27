class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :task, index: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
