module Cool
  class MyNewException < Exception
  end
end

raise Cool::MyNewException, "MyNewException happened here"

