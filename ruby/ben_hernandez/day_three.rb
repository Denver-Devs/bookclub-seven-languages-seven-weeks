class ActsAsCsv
    def read
        file = File.new(self.class.to_s.downcase + '.csv')
        @headers = file.gets.chomp.split(', ')
        file.each do |row|
            @result << row.chomp.split(', ')
        end
    end
    def headers
        @headers
    end
    def csv_contents
        @result
    end
    def each
        @result.each { |value| yield CsvRow.new(headers, value) }
    end
    def initialize
        @result = []
        read
    end
end

class RubyCsv < ActsAsCsv
end

class CsvRow

    def method_missing name
        @row[@map[name]]
    end
    def initialize(headers, row)
        @row = row
        @map = { }
        headers.each_with_index { |h, i| @map[h.to_sym] = i }
    end

end

def title text
    " (╯ರ ~ ರ）╯︵ ┻━┻ #{text} "
end

m = RubyCsv.new

puts title 'Symbols'
m.each { |s| puts s.stock_name }
puts

puts title 'Company Names'
m.each { |s| puts s.company_name }