require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    # ...
    where_line = params.map { |k,v| "#{k} = ?" }.join(" AND ")
    vals = params.values
    data = DBConnection.execute(<<-SQL, *vals )
      SELECT
        #{self.table_name}.*
      FROM
      #{self.table_name}
      WHERE
        #{where_line}
    SQL

    return [] if data.empty?
    parse_all(data)
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
