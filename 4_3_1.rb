class Student
  def method_missing(m, *args)
    if m.to_s.start_with?("grade_for_")
      puts "returns the appropriate grade, based on parsing the method name: #{m}"
    else
      super
    end
  end
end