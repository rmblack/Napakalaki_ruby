# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


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
end