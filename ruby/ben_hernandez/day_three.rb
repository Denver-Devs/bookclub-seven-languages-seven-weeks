# This is a class.
class ActsAsCsv
  def read
    file = File.new(self.class.to_s.downcase + '.csv')
    @headers = file.gets.chomp.split(', ')
    file.each do |row|
      @result << row.chomp.split(', ')
    end
  end

  attr_reader :headers
  attr_reader :csv_contents

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

# This is another class.
class CsvRow
  def method_missing(name)
    if @map[name]
      @row[@map[name]]
    else super
    end
  end

  def respond_to_missing?(method_name)
    super(method_name)
  end

  def initialize(headers, row)
    @row = row
    @map = {}
    headers.each_with_index { |h, i| @map[h.to_sym] = i }
  end
end

def title(text)
  " (╯ರ ~ ರ）╯︵ ┻━┻ #{text} "
end

m = RubyCsv.new

puts title 'Symbols'
m.each { |s| puts s.stock_name }
puts

puts title 'Company Names'
m.each { |s| puts s.company_name }
