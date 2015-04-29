# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Test

  attr_reader :a,:b,:c,:d

  def initialize(a,b,c,d)
    @a=a
    @b=b
    @c=c
    @d=d
  end  
  
  def to_s
    "Objeto de test #{@a},#{@b},#{@c},#{@d}"
  end  
  
  #Métodos de instancia de clase que son los nuevos constructores

  def self.newAB(a,b)  
       new(a,b,nil,nil) # entrar con nil no es una buena opción, habría que entrar con los valores.  
  end
  
  def self.newCD(c,d)
       new(nil,nil,c,d)
  end 
  
end