class Airplane

  def initialize(type, wingloading, horsepower)
    @type = type
    @wingloading = wingloading
    @horsepower = horsepower
    @engine = false
    @flying = false
  end

  def type
    @type
  end

  def wingloading
    @wingloading
  end

  def horsepower
    @horsepower
  end

  def start
    if @engine == false
      @engine = true
      "my_plane started"
    else
      "my_plane already started"
    end
  end

  def takeoff
    if @engine == false
      "airplane not started, please start"
    else
      @flying = true
      "airplane launched"
    end
  end

  def land
    if @engine == false
      "airplane not started, please start"
    elsif @flying == false
      "airplane already on the ground"
    elsif @flying == true
      @flying = false
      "airplane landed"
    end
  end
end
