namespace :alter_database do

  Question.connection.execute('ALTER SEQUENCE questions_id_seq RESTART 37;')
  
end
