#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
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
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
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
  # step 1: include Enumerable mixin
  include Enumerable
  acts_as_csv

  # step 1.5: define each block
  def each &block
    @csv_contents.each {|row| block.call(row.first.split(','))}
  end
end

# step 2: extend Array to catch missing methods
class Array
  def method_missing name
    words = ['one', 'two', 'three'] # TODO: add infinite more words
    self[words.index name.to_s]
  end
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

puts
puts 'col one'
m.each {|r| puts r.one}
puts
puts 'col two'
m.each {|r| puts r.two}
