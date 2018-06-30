require 'sqlite3'

module Dbcon
  $db = SQLite3::Database.new('newtodos.db')
  $db.execute('create table if not exists todos(
              id integer primary key autoincrement,
              title varchar(50) not null,
              description varchar(200),
              priority varchar(20),
              deadline datetime
             )')

  def self.insert(title,description,priority,deadline)
      title=title
      description=description
      priority=priority
      deadline=deadline
    $db.execute('insert into todos values(null,?,?,?,?)',[title,description,priority,deadline])
  end


  def self.edit(id,title,description,priority)
    id = id
    title = title
    description = description
    priority=priority
    $db.execute("update todos set title = ?,description=?,priority=? where id = ?",[title,description,priority,id])
  end

  def self.delete(id)
    id = id
    $db.execute('delete from todos where id = ?',(id))
  end


  def self.list_by_priority
    puts "ID:          TITLE:          Desc:             priority:        deadline:"
    $db.execute('select * from todos order by priority').each do |row|
        p "#{row[0]}        #{row[1]}       #{row[2]}        #{row[3]}        #{row[4]}"
    end

  end

  def self.list_by_id
    puts "ID:          TITLE:          Desc:             priority:        deadline:"
    $db.execute('select * from todos').each do |row|
      p "#{row[0]}        #{row[1]}       #{row[2]}        #{row[3]}        #{row[4]}"
    end
  end



  def self.closeconn
    $db.close
  end
end
