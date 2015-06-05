class Airplane

  attr_reader :type, :wingloading, :horsepower, :fuel

  def initialize(type, wingloading, horsepower, fuel=100)
    @type = type
    @wingloading = wingloading
    @horsepower = horsepower
    @engine = false
    @flying = false
    @fuel = fuel
    @enough_fuel = true
  end

  def start
    if @enough_fuel
      if @engine == false
        @engine = true
        @fuel =- 25
        "my_plane started"
      else
        "my_plane already started"
      end
    else
      "not enough fuel to start"
    end
  end

  def takeoff
    if @enough_fuel
      if @engine == false
        "airplane not started, please start"
      else
        @flying = true
        @fuel =- 25
        "airplane launched"
      end
    else
      "not enough fuel to takeoff"
    end
  end

  def land
    if @enough_fuel
      if @engine == false
        "airplane not started, please start"
      elsif @flying == false
        "airplane already on the ground"
      elsif @flying == true
        @flying = false
        @fuel =- 25
        "airplane landed"
      end
    else
      "not enough fuel to land. ruh oh."
    end
  end

  def enough_fuel
    true unless fuel == 0
  end

end
