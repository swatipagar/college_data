require 'io/console'
require 'byebug'
require 'table_print'

class College
  def add_student_record
    print "Enter how many Students Data you want to enter: "
    num1 = gets.to_i
    @stud_list = input_student(num1)
    File.open("student_list.txt", "a+") do |f|
      @stud_list.each { |element| f.puts(element) }
    end unless @stud_list.nil?
  end

  def add_admin_record
    print "Enter how many Admins Data you want to enter: "
    num1 = gets.to_i
    @admin_list = input_admin(num1)
    File.open("admin_list.txt", "a+") do |f|
      @admin_list.each { |element| f.puts(element) }
    end unless @admin_list.nil?
  end


  def add_teacher_record
    print "Enter how many Teachers Data you want to enter: "
    num1 = gets.to_i
    @teach_list = input_teacher(num1)
    File.open("teacher_list.txt", "a+") do |f|
      @teach_list.each { |element| f.puts(element) }
    end unless @teach_list.nil?
  end

  def add_principal_record
    num1 = 1
    @princi_list = input_princi(num1)
    File.open("principal_list.txt", "a+") do |f|
      @princi_list.each { |element| f.puts(element) }
    end unless @princi_list.nil?
  end

  def display_student_record
    @stud_list = []
    File.readlines("student_list.txt").each_with_index do |line|
      stud_print = eval(line)
      @stud_list << stud_print
    end
    tp @stud_list
  end

  def display_subject_list
    @sub_list = []
    File.readlines("subject_list.txt").each_with_index do |line|
      sub_print = eval(line)
      @sub_list << sub_print
    end
    tp @sub_list
  end

  def display_admin_record
    @admin_list = []
    File.readlines("admin_list.txt").each_with_index do |line|
      admin_print = eval(line)
      @admin_list << admin_print
    end
    tp @admin_list
  end

  def display_teacher_record
    @teach_list = []
    File.readlines("teacher_list.txt").each_with_index do |line|
      teacher_print = eval(line)
      @teach_list << teacher_print
    end
    tp @teach_list
  end

  def display_principal_record
    @princi_list = []
    File.readlines("principal_list.txt").each_with_index do |line|
      princi_print = eval(line)
      @princi_list << princi_print
    end
    @princi_list
  end

  def input_student(num1)
    @num1 = num1
    @stud_list = []
    @file = []
    for i in 0..num1-1
      @file= File.open("student_list.txt","r")
      id_search = @file.to_a.last
      id_hash = eval(id_search) if id_search!=nil
      if id_hash==nil
        id = 1
      else
        id = id_hash[:id] + 1
      end
      print "\nEnter Student Name: "
      stud_name = gets.chomp
      puts "\nEnter Student Class: "
      stud_class = gets.chomp
      @stud_list << {id: id, stud_name: stud_name, stud_class: stud_class}
    end
    return @stud_list
  end

  def input_admin(num1)
    @num1 = num1
    @admin_list = []
    @file = []
    for i in 0..num1-1
      @file= File.open("admin_list.txt","r")
      id_search = @file.to_a.last
      id_hash = eval(id_search) if id_search!=nil
      if id_hash==nil
        id = 1
      else
        id = id_hash[:id] + 1
      end
      print "\nEnter Admin Name: "
      admin_name = gets.chomp
      @admin_list << {id: id, admin_name: admin_name}
    end
    return @admin_list
  end

  def input_teacher(num1)
    @num1 = num1
    @teach_list = []
    @file = []
    for i in 0..num1-1
      @file= File.open("teacher_list.txt","r")
      id_search = @file.to_a.last
      id_hash = eval(id_search) if id_search!=nil
      if id_hash==nil
        id = 1
      else
        id = id_hash[:id] + 1
      end
      print "\nEnter Teacher Name: "
      teach_name = gets.chomp
      puts "\nEnter Teacher Class: "
      teach_class = gets.chomp
      puts "\nEnter Teacher Subject: "
      teach_sub = gets.chomp
      @teach_list << {id: id, teach_name: teach_name, teach_class: teach_class, teach_sub: teach_sub}
    end
    return @teach_list
  end

  def input_princi(num1)
    @num1 = num1
    @princi_list = []
    @file = []
    for i in 0..num1-1
      @file= File.open("principal_list.txt","r")
      id_search = @file.to_a.last
      id_hash = eval(id_search) if id_search!=nil
      if id_hash==nil
        id = 1
      else
        id = id_hash[:id] + 1
      end
      print "\nEnter Principal Name: "
      princi_name = gets.chomp
      @princi_list << {id: id, princi_name: princi_name}
    end
    return @princi_list
  end

  def search_student_record
    puts "Enter Student Name you want to Search: "
    word = gets.chomp
    if File.open('student_list.txt').each_line.any?{|line| line.include?(word)}
      File.open("student_list.txt").each do |line|
        search_stud = eval(line)
        if search_stud[:stud_name]== word
          print 'Student is Present'
          print "\n\tId\tName\t\tClass\n"
          print "\t",search_stud[:id],"\t",search_stud[:stud_name],"\t\t",search_stud[:stud_class],"\t\n"
        end
      end
    else
      print "Student is not Present\n"
    end
  end

  def search_admin_record
    puts "Enter Admin Name you want to Search: "
    word = gets.chomp
    if File.open('admin_list.txt').each_line.any?{|line| line.include?(word)}
      File.open("admin_list.txt").each do |line|
        search_admin = eval(line)
        if search_admin[:admin_name]== word
          print 'Admin is Present'
          print "\n\tId\tName\n"
          print "\t",search_admin[:id],"\t",search_admin[:admin_name],"\t\n"
        end
      end
    else
      print "Admin is not Present\n"
    end
  end

  def search_teacher_record
    puts "Enter Teacher Name you want to Search: "
    word = gets.chomp
    if File.open('teacher_list.txt').each_line.any?{|line| line.include?(word)}
      File.open("teacher_list.txt").each do |line|
        search_teach = eval(line)
        if search_teach[:teach_name]== word
          print 'Teacher is Present'
          print "\n\tId\tName\t\tClass\t\tSubject\n"
          print "\t",search_teach[:id],"\t",search_teach[:teach_name],"\t\t",search_teach[:teach_class],"\t\t",search_teach[:teach_sub],"\t\n"
        end
      end
    else
      print "Teacher is not Present\n"
    end
  end

  def search_principal_record
    puts "Enter Principal Name you want to Search: "
    word = gets.chomp
    if File.open('principal_list.txt').each_line.any?{|line| line.include?(word)}
      File.open("principal_list.txt").each do |line|
        search_princi = eval(line)
        if search_princi[:princi_name]== word
          print 'Principal is Present'
          print "\n\tId\tName\n"
          print "\t",search_princi[:id],"\t",search_princi[:princi_name],"\t\n"
        end
      end
    else
      print "Principal is not Present\n"
    end
  end

  def edit_student_record
    File.open("new_student_list.txt", File::TRUNC) {}
    puts "Enter Student Name you want to Search for edit: "
    word = gets.chomp
    # search in file record available or not
    if File.open('student_list.txt').each_line.any?{|line| line.include?(word)}
      #Replace old data
      File.open("student_list.txt").each do |line|
        search_stud = eval(line)
        if search_stud[:stud_name]== word
          print "\nEnter Student Name: "
          stud_name = gets.chomp
          search_stud[:stud_name] = search_stud[:stud_name].replace(stud_name)
          puts "\nEnter Student Class: "
          stud_class = gets.chomp
          search_stud[:stud_class] = search_stud[:stud_class].replace(stud_class)
        end
        #write new data in a new file
        File.open("new_student_list.txt", 'a+'){|f| f.puts search_stud}
      end
      source_file, destination_file = ARGV
      script = $0
      input = File.open("new_student_list.txt")
      data_to_copy = input.read()  # gather the data using read() method

      output = File.open("student_list.txt", 'w')
      output.write(data_to_copy)  # write up the data using write() method

      output.close()
      input.close()
    else
      print "Student Record Not Found in a database\n"
    end
  end

  def edit_teacher_record
    File.open("new_teacher_list.txt", File::TRUNC) {}
    puts "Enter Teacher Name you want to Search for edit: "
    word = gets.chomp
    # search in file record available or not
    if File.open('teacher_list.txt').each_line.any?{|line| line.include?(word)}
      #Replace old data
      File.open("teacher_list.txt").each do |line|
        search_teach = eval(line)
        if search_teach[:teach_name]== word
          print "\nEnter teacher Name: "
          teach_name = gets.chomp
          search_teach[:teach_name] = search_teach[:teach_name].replace(teach_name)
          puts "\nEnter teacher Class: "
          teach_class = gets.chomp
          search_teach[:teach_class] = search_teach[:teach_class].replace(teach_class)
          puts "\nEnter teacher Subject: "
          teach_sub = gets.chomp
          search_teach[:teach_sub] = search_teach[:teach_sub].replace(teach_sub)
        end
        #write new data in a new file
        File.open("new_teacher_list.txt", 'a+'){|f| f.puts search_teach}
      end
      source_file, destination_file = ARGV
      script = $0
      input = File.open("new_teacher_list.txt")
      data_to_copy = input.read()  # gather the data using read() method

      output = File.open("teacher_list.txt", 'w')
      output.write(data_to_copy)  # write up the data using write() method

      output.close()
      input.close()
    else
      print "Teacher Record Not Found in a database\n"
    end
  end

  def edit_admin_record
    count = 0
    @stud_list = []
    File.open("new_admin_list.txt", File::TRUNC) {}
    puts "Enter Admin Name you want to Search for edit: "
    word = gets.chomp
    # search in file record available or not
    if File.open('admin_list.txt').each_line.any?{|line| line.include?(word)}
      #Replace old data
      File.open("admin_list.txt").each do |line|
        search_admin = eval(line)
        if search_admin[:admin_name]== word
          print "\nEnter Admin Name: "
          admin_name = gets.chomp
          search_admin[:admin_name] = search_admin[:admin_name].replace(admin_name)
        end
        #write new data in a new file
        File.open("new_admin_list.txt", 'a+'){|f| f.puts search_admin}
      end
      source_file, destination_file = ARGV
      script = $0
      input = File.open("new_admin_list.txt")
      data_to_copy = input.read()  # gather the data using read() method

      output = File.open("admin_list.txt", 'w')
      output.write(data_to_copy)  # write up the data using write() method

      output.close()
      input.close()
    else
      print "Admin Record Not Found in a database\n"
    end
  end

  def edit_principal_record
    count = 0
    @stud_list = []
    File.open("new_principal_list.txt", File::TRUNC) {}
    puts "Enter Principal Name you want to Search for edit: "
    word = gets.chomp
    # search in file record available or not
    if File.open('principal_list.txt').each_line.any?{|line| line.include?(word)}
      #Replace old data
      File.open("principal_list.txt").each do |line|
        search_princi = eval(line)
        if search_princi[:princi_name]== word
          print "\nEnter Principal Name: "
          princi_name = gets.chomp
          search_princi[:princi_name] = search_princi[:princi_name].replace(princi_name)
        end
        #write new data in a new file
        File.open("new_principal_list.txt", 'a+'){|f| f.puts search_princi}
      end
      source_file, destination_file = ARGV
      script = $0
      input = File.open("new_principal_list.txt")
      data_to_copy = input.read()  # gather the data using read() method

      output = File.open("principal_list.txt", 'w')
      output.write(data_to_copy)  # write up the data using write() method

      output.close()
      input.close()
    else
      print "Principal Record Not Found in a database\n"
    end
  end

  def menu
    print "\nMenu\nEnter 1 for Admin\nEnter 2 for Principal\nEnter 3 for Teacher\nEnter 4 for Student\nEnter 5 for Exit"
  end

  def admin_menu
    print "\nAdmin Menu\nEnter 1 for Student\nEnter 2 for Teacher\nEnter 3 for Principal\nEnter 4 for Admin\nEnter 5 for Exit"
  end

  def admin_student_menu
    print "\nAdmin Student Menu\nEnter 1 for Add Student\nEnter 2 for List of Student\nEnter 3 for Search Student\nEnter 4 for Edit Student Data\nEnter 5 for Exit"
  end

  def admin_teacher_menu
    print "\nAdmin Teacher Menu\nEnter 1 for Add Teacher\nEnter 2 for List of Teachers\nEnter 3 for Search Teacher\nEnter 4 for Edit Teacher Data\nEnter 5 for Exit"
  end

  def admin_principal_menu
    print "\nAdmin Principal Menu\nEnter 1 for Add Principal\nEnter 2 for View Principal Data\nEnter 3 for Edit Principal Data\nEnter 4 for Exit"
  end

  def admin_data_menu
    print "\nAdmin Data Menu\nEnter 1 for Add Admin\nEnter 2 for List of Admins\nEnter 3 for Search Admin\nEnter 4 for Edit Admin Data\nEnter 5 for Exit"
  end

  def principal_menu
    print "\nPrincipal Menu\nEnter 1 for List of Admins\nEnter 2 for List of Teachers\nEnter 3 for List of Students\nEnter 4 for Exit"
  end

  def teacher_menu
    print "\nTeacher Menu\nEnter 1 for List of Students\nEnter 2 for List of Teachers\nEnter 3 for List of Subjects\nEnter 4 for Exit"
  end

  def student_menu
    print "\Student Menu\nEnter 1 for List of Students\nEnter 2 for List of Teachers\nEnter 3 for List of Subjects\nEnter 4 for Exit"
  end
end

clg_obj = College.new()
clg_obj.menu

count = 0
begin
  print "\nEnter Your Choice for Role: "
  ch = gets.to_i
  case ch
    when 1
      puts "Enter Your Email: "
      admin_email=gets.chomp
      print "Password: "
      admin_password=STDIN.noecho(&:gets).chomp
      if admin_email == "admin@gmail.com" && admin_password == "admin1234"
        clg_obj.admin_menu
        begin
          print "\nEnter You Choice: "
          ch = gets.to_i
          case ch
            when 1
              clg_obj.admin_student_menu
              begin
                print "\nEnter You Choice: "
                ch = gets.to_i
                case ch
                  when 1
                    puts "Add Student"
                    clg_obj.add_student_record
                    clg_obj.admin_student_menu
                  when 2
                    puts "Student List"
                    clg_obj.display_student_record
                    clg_obj.admin_student_menu
                  when 3
                    puts "Search Student"
                    clg_obj.search_student_record
                    clg_obj.admin_student_menu
                  when 4
                    puts "Edit Student Data"
                    clg_obj.edit_student_record
                    clg_obj.admin_student_menu
                  when 5
                    puts "Exit from case"
                    exit(0)
                  else
                    clg_obj.admin_student_menu
                  end
                end while ch != 5
            when 2
              clg_obj.admin_teacher_menu
              begin
                print "\nEnter You Choice: "
                ch = gets.to_i
                case ch
                  when 1
                    puts "Add Teacher"
                    clg_obj.add_teacher_record
                    clg_obj.admin_teacher_menu
                    print "\nEnter You Choice: "
                    ch = gets.to_i
                  when 2
                    puts "Teacher List"
                    clg_obj.display_teacher_record
                    clg_obj.admin_teacher_menu
                  when 3
                    puts "Search Teacher"
                    clg_obj.search_teacher_record
                    clg_obj.admin_teacher_menu
                  when 4
                    puts "Edit Teacher Data"
                    clg_obj.edit_teacher_record
                    clg_obj.admin_teacher_menu
                  when 5
                    puts "Exit from case"
                    exit(0)
                  else
                    clg_obj.admin_teacher_menu
                  end
                end while ch != 5
            when 3
              clg_obj.admin_principal_menu
              begin
                print "\nEnter You Choice: "
                ch = gets.to_i
                case ch
                  when 1
                    puts "Add Principal Data"
                    clg_obj.add_principal_record
                    clg_obj.admin_principal_menu
                  when 2
                    puts "View Principal Data"
                    clg_obj.display_principal_record
                    clg_obj.admin_principal_menu
                  when 3
                    puts "Edit Principal Data"
                    clg_obj.edit_principal_record
                    clg_obj.admin_principal_menu
                  when 4
                    puts "Exit from case"
                    exit(0)
                  else
                    clg_obj.admin_principal_menu
                  end
                end while ch != 4
            when 4
              clg_obj.admin_data_menu
              begin
                print "\nEnter You Choice: "
                ch = gets.to_i
                case ch
                  when 1
                    puts "Add Admin"
                    clg_obj.add_admin_record
                    clg_obj.admin_data_menu
                  when 2
                    puts "Admin List"
                    clg_obj.display_admin_record
                    clg_obj.admin_data_menu
                  when 3
                    puts "Search Admin"
                    clg_obj.search_admin_record
                    clg_obj.admin_data_menu
                  when 4
                      puts "Edit Admin Data"
                      clg_obj.edit_admin_record
                      clg_obj.admin_data_menu
                  when 5
                    puts "Exit from case"
                    exit(0)
                  else
                    clg_obj.admin_data_menu
                  end
                end while ch != 5
            when 5
              puts "Exit from case"
              exit(0)
            else
              clg_obj.menu
            end
          end while ch != 5
        else
          if count < 2
            count = count + 1
            puts "\nEnter valid details please"
            clg_obj.menu
          else
            puts "\nExit from application because you Are not valid user."
            exit(0)
          end
        end
    when 2
      puts "Enter Your Email: "
      principal_email=gets.chomp
      print "Password: "
      principal_password=STDIN.noecho(&:gets).chomp
      if principal_email == "principal@gmail.com" && principal_password == "princi1234"
        clg_obj.principal_menu
        begin
          print "\nEnter You Choice: "
          ch = gets.to_i
          case ch
            when 1
              puts "Admins List"
              clg_obj.display_admin_record
              clg_obj.principal_menu
            when 2
              puts "Teachers List"
              clg_obj.display_teacher_record
              clg_obj.principal_menu
            when 3
              puts "Students List"
              clg_obj.display_student_record
              clg_obj.principal_menu
            when 4
              puts "Exit from case"
              exit(0)
            else
              clg_obj.principal_menu
            end
          end while ch != 5
      else
        if count < 2
          count = count + 1
          puts "\nEnter valid details please"
          clg_obj.menu
        else
          puts "\nExit from application because you Are not valid user."
          exit(0)
        end
      end
    when 3
      # puts "Enter Your Email: "
      # teacher_email=gets.chomp
      # print "Password: "
      # teacher_password=STDIN.noecho(&:gets).chomp
      # if teacher_email == "teacher@gmail.com" && teacher_password == "teach1234"
        clg_obj.teacher_menu
        begin
          print "\nEnter You Choice: "
          ch = gets.to_i
          case ch
            when 1
              puts "Students List"
              clg_obj.display_student_record
              clg_obj.teacher_menu
            when 2
              puts "Teachers List"
              clg_obj.display_teacher_record
              clg_obj.teacher_menu
            when 3
              puts "Subjects List"
              clg_obj.display_subject_list
              clg_obj.teacher_menu
            when 4
              puts "Exit from case"
              exit(0)
            else
              clg_obj.teacher_menu
            end
          end while ch != 4
      # else
      #   if count < 2
      #     count = count + 1
      #     puts "\nEnter valid details please"
      #     clg_obj.menu
      #   else
      #     puts "\nExit from application because you Are not valid user."
      #     exit(0)
      #   end
      # end
    when 4
      clg_obj.student_menu
      begin
        print "\nEnter You Choice: "
        ch = gets.to_i
        case ch
          when 1
            puts "Students List"
            clg_obj.display_student_record
            clg_obj.student_menu
          when 2
            puts "Teachers List"
            clg_obj.display_teacher_record
            clg_obj.student_menu
          when 3
            puts "Subjects List"
            clg_obj.display_subject_list
            clg_obj.student_menu
          when 4
            puts "Exit from case"
            exit(0)
          else
            clg_obj.student_menu
          end
        end while ch != 4
    when 5
      puts "Exit from case"
      exit(0)
    else
      clg_obj.menu
    end
  end while ch != 5