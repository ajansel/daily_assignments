class Employee
  attr_accessor :salary, :title, :boss
  attr_reader :name

  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :direct_reports

  def initialize(name, title, salary, boss=nil)
    super(name, title, salary, boss=nil)
    @direct_reports = []
  end

  def add_direct_report(array)
    @direct_reports += array
  end

  def sum_direct_reports_salaries
    @direct_reports.reduce(0){ |sum, direct_report| sum += direct_report.salary }
  end

  def bonus(multiplier)
    total_salary = 0

    @direct_reports.each do |employee|
      if employee.is_a?(Manager)
        total_salary += employee.sum_direct_reports_salaries
      end 
        total_salary += employee.salary
      end
    total_salary * multiplier
  end
end


ned = Manager.new('ned', 'Founder', 1000000)
darren = Manager.new('darren', 'TA Manager', 78000, ned)
shawna = Employee.new('shawna', 'TA', 12000, darren)
david = Employee.new('david', 'TA', 10000, darren)
ned.add_direct_report([darren])
darren.add_direct_report([shawna, david])

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
