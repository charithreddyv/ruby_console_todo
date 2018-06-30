require "./dbcon.rb"
require 'colorize'



class Task


  def options
    puts '************************************************************************'.green
    puts 'Ener an option '.green
    puts '[1]Add new todo [2]Edit a todo [3] delete a todo [4]show todos by priority [5] list all todos [6] exit'.green
    puts '*************************************************************************'.green
    option = gets.chomp.to_i
    puts '-------------------------------------------------------------------------'.green
    case option
    when 1
      puts ('enter title , description , priority(high/low) , deadline(format yyyy-mm-dd hh:mm:ss):').red
      puts 'title'
      title = gets.chomp
      puts 'description'
      description = gets.chomp
      puts 'priority (high/low)'
      priority = gets.chomp
      puts 'deadline'
      deadline = gets.chomp
      Dbcon::insert(title,description,priority,deadline)

    when 2
      puts 'edit element by id'
      puts ('the ID of element to edit')
      id = gets.chomp
      puts ('title')
      title=gets.chomp
      puts('description')
      description = gets.chomp
      puts('priority')
      priority=gets.chomp
      Dbcon::edit(id,title,description,priority)
    when 3
      puts 'enter the ID of element to delete '
      id = gets.chomp
      Dbcon::delete(id)

    when 4
      puts "the element based upon priority"
      Dbcon::list_by_priority
   when 5
     puts "the elements based upon id"
     Dbcon::list_by_id
   when 6
     puts "thank you"
     Dbcon::closeconn
     exit(0)
  end
end
end
task = Task.new
while true
  task.options
end
