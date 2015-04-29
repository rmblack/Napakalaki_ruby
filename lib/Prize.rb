#encoding: UTF-8

class Prize
  
  def initialize (treasures, levels)
    @treasures = treasures
    @levels = levels
  end
  # def levels
  #   @levels
  # end
  # def treasures
  #   @treasures
  # end
  
  attr_accessor :treasures, :levels
  
  def to_s
    "Treasures = #{treasures} Levels = #{levels}" #Debug_1: must be similar to java version
  end

end
