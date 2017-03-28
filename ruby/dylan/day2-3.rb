def ruby_grep(filename, pattern)
    regExp = Regexp.new(pattern)
    File.open(filename, 'r') do |file|
        file.each_line {|line| puts line if regExp =~line}
    end
end

ruby_grep('object_70249756086560.txt', 'matz')