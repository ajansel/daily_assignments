require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @columns unless @columns.nil?

    data = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    @columns = data.first.map { |col_name| col_name.to_sym }
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) do
        # instance_variable_get("@#{col}")
        self.attributes[col]
      end

      define_method("#{col}=") do |value|
        # instance_variable_set("@#{col}", value)
        self.attributes[col] = value
      end

    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name ||= self.to_s.tableize
  end

  def self.all
    # ...
    data = DBConnection.execute(<<-SQL)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
    SQL

    parse_all(data)
  end

  def self.parse_all(results)
    # ...
    results.map { |datum| self.new(datum) }
  end

  def self.find(id)
    # ...
    data = DBConnection.execute(<<-SQL, id)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
      WHERE
        id = ?
    SQL

    return nil if data.empty?

    self.new(data.first)
  end

  def initialize(params = {})
    # ...
    params.each do |k,v|
      raise Exception.new("unknown attribute '#{k}'") unless(self.class.columns.include?(k.to_sym))
      self.send("#{k}=", v)
    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    @attributes.values
  end

  def insert
    # ...
    col_names = self.class.columns[1..-1].join(',')
    question_marks = ["?"] * (self.class.columns.length-1)
    question_marks = question_marks.join(',')
    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
    set_row = self.class.columns[1..-1].map { |name| "#{name} = ?" }.join(",")
    p set_row
    DBConnection.execute(<<-SQL, *attribute_values[1..-1], attribute_values[0])
      UPDATE
        #{self.class.table_name}
      SET
        #{set_row}
      WHERE
        id = ?
    SQL
  end

  def save
    # ...
    if self.id.nil?
      self.insert
    else
      self.update
    end
  end
end
