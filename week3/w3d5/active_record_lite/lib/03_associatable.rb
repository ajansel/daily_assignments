require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    # ...
    self.class_name.constantize
  end

  def table_name
    # ...
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {
                  primary_key: :id,
                  foreign_key: "#{name}_id".to_sym,
                  class_name: name.singularize.capitalize })
    # ...
    @primary_key = options[:primary_key]
    @foreign_key = options[:foreign_key]
    @class_name = options[:class_name]

  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {
                  primary_key: :id,
                  foreign_key: "#{self_class_name.downcase}_id".to_sym,
                  class_name: name.singularize.capitalize })

    @primary_key = options[:primary_key]
    @foreign_key = options[:foreign_key]
    @class_name = options[:class_name]
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    # ...
    options = BelongsToOptions.new(name, options)

    define_method(name) do
      # self.send(options[:foreign_key])

    end
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
end
