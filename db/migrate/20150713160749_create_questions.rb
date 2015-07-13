class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question1
      t.string :question2
      t.integer :question1vote, default: 0
      t.integer :question2vote, default: 0

      t.timestamps
    end
  end
end
