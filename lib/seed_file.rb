# Helper class for importing files with records to the database
class SeedFile

  def self.import(path)
    new(path).import
  end

  attr_reader :path

  def initialize(path)
    @path = Pathname(path)
  end

  # Imports this seed file to its corresponding table in the database
  def import
    open do |io|
      case format
      when :yml, :yaml
        import_yaml(io)
      when :json
        import_json(io)
      end
    end
    return true
  end

  # Returns the format of this file as a symbol
  def format
    (gzip?? path.basename(path.extname) : path).extname[1..-1].downcase.to_sym
  end

  # Returns true if the seed file says it is gzipped
  def gzip?
    path.extname == '.gz'
  end

  private

  def open(&block)
    if gzip?
      IO.popen("gunzip -c #{path.realpath}", &block)
    else
      path.open(&block)
    end
  end

  # Get the ActiveRecord::Base subclass
  def clazz
    @clazz ||= path.
               basename.
               to_s.
               split('.').
               first.
               classify.
               singularize.
               constantize
  end

  def import_yaml(io)
    require 'yaml' unless defined?(YAML)
    YAML.load(io).each{ |data| import_record data }
  end

  def import_json(io)
    require 'active_support/json' unless defined?(ActiveSupport::JSON)
    while line = io.gets
      import_record ActiveSupport::JSON.decode(line.chomp)
    end
  end

  def import_record(attributes)
    clazz.new.tap do |record|
      attributes.each do |key, value|
        record[key] = value
      end
      # bypass validations
      record.save :validate => false
    end
  end
end
