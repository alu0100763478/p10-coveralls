# encoding: utf-8
# Este módulo se ha creado para describir
# distintas metodologías de programación
# haciendo uso del Lenguaje de Programación
# Ruby.  
# Con ella se han desarrollado los ejemplos
# de la asignatura Lenguajes y Paradigmas 
# de Programación.
#
# Author::    Rossiel D. González
# Copyright:: Cretive
# License::   Distributes under the same terms as Ruby
require "alimento/version"


class Alimentos

    include Comparable

    attr_reader :nombre,:proteinas,:glucidos,:lipidos
    
    def initialize(nombre,proteinas,glucidos,lipidos)
        
        @nombre,@proteinas,@glucidos,@lipidos= nombre,proteinas,glucidos,lipidos

    end

    def <=>(other)
        nombre.size <=> other.nombre.size
        ve <=> other.ve
    end

    def ve
        (@proteinas*4+@glucidos*4+@lipidos*9).round(3)
    end    

    
    def aibc(g)
        i = 0
        r = []
        while i < g.size
            index = 1
            s = []
            while index < g[i].size
                if g[i][index] < g[i][0]
                    s << 0.0
                else
                    s << (((g[i][index] - g[i][0]) + (g[i][index-1] - g[i][0]))/2)*5
                end
                index = index + 1
            end
            r << s
            i = i + 1
        end
        suma = []
        j = 0
        while j < g.size
            k = 0
            s = 0
            while k < r[j].size
                s = s + r[j][k]
                k = k + 1
            end
            suma << s
            j = j + 1
        end
        suma
    end      

    def to_s
    
        "Alimento: #{@nombre}\n------------------------------\nProteínas:\s#{@proteinas}g\nGlúcidos:\s#{@glucidos}g\nLípidos:\s#{@lipidos}g"  
       
    end  

end

class AGrupos < Alimentos
    
    attr_reader :ngrupo
    
    def initialize(nombre,proteinas,glucidos,lipidos,ngrupo)
        super(nombre,proteinas,glucidos,lipidos)
        @ngrupo = ngrupo
    end
    
    def to_s
        s = "Grupo: #{@ngrupo}\n"
        s << super.to_s
        s
    end  

end
