#encoding UTF-8
  
class Dice
  include Singleton
  @@prng = Random.new
  def nextNumber
    prng.rand(5)+1
  end
end

