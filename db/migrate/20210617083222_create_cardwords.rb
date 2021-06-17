class CreateCardwords < ActiveRecord::Migration[6.1]
  def change
    create_table :cardwords do |t|
      t.string :word                                    #Слово для изучения 
      t.text :description                               #перевод  
      t.integer :response, default: 0                   #количесвто правильных ответов  
      t.integer :group, default: 0                      #Уровень сложности 
      t.integer :incorrect_group, default: 0            #Группа не коректных слов которые не нужно отображать 
      t.time :date_change_group, default: 0             #время перехода в след группу
      t.boolean :hard_word,default: false               #сложное слово не отображать после 10 попыток станет тру

      t.column :reviewed_at, :datetime, default: nil

      t.timestamps
    end
  end
end
