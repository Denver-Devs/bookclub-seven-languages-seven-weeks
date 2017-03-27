# Modify the CSV application to support an each method to return a CsvRow object. Use method_missing on that CsvRow to return the value for the column for a given heading.
	
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods
	class CsvRow
		attr_accessor :header, :row
		def initialize(header, row)
			@header = header
			@row = row
		end	
		
		def method_missing name, *args
			i = header.index(name.to_s)
			return row[i]
		end
	end
	
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
	
	def each
		@csv_contents.each do |row| 
			yield CsvRow.new(@headers, row)
		end
	end
	
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
  end
 end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
#puts csv.headers.inspect
#puts csv.csv_contents.inspect


csv.each {|row| puts "row one is: #{row.one}"} # => "lions"
