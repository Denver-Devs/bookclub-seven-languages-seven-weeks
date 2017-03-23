module ActsAsCsv
    # invoked whenever the module is included in another module (a class IS a module)
    def self.included(base)
        # referenced target class which included this module and extendd it with the ClassMethods module
        base.extend ClassMethods
    end

    # The ClassMethods  module's acts_as_csv method does the metaprogramming by
    # opening the base class and then adding instance methods
    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods
        attr_accessor :headers, :csv_contents

        def initialize
            read
        end

        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.csv'
            f = File.new(filename)
            @headers = f.gets.chomp.split(', ')
            f.each {|r| @csv_contents << r.chomp.split(', ')}
        end

        def each(&block)
            csv_contents.each {|row| yield CsvRow.new(headers, row)}
        end
    end
end


class RubyCsv
    include ActsAsCsv
    # call the macro
    acts_as_csv
end

class CsvRow
    def initialize(headers, row_data)
        @row = {}
        headers.each_with_index do |header, i|
            @row[header] = row_data[i]
        end
    end

    def method_missing(method, *args)
        @row[method.to_s]
    end
end

csv = RubyCsv.new
puts "items in column one:"
csv.each {|row| p row.one}

puts "items in column two:"
csv.each {|row| p row.two}
