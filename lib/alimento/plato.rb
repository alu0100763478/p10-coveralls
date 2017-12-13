class Equivalencia
     attr_accessor :porcion,:equivalencia
     
     def initialize(porcion,equivalencia)
         @porcion,@equivalencia = porcion,equivalencia
     end
end    
        
class Plato
    attr_accessor :nombre,:vegetales,:frutas,:granos,:proteinas, :vet
    
    TABLA_PORCIONES = [Equivalencia.new('2 piezas pequeñas',20),Equivalencia.new('1 taza',30),Equivalencia.new('1/2 cucharón',50),Equivalencia.new('1 pieza',60)]
    TABLA_ALIMENTOS = [Alimentos.new('Huevo',12.1,0.0,10.5),Alimentos.new('Leche vaca',3.3,4.8,3.2), Alimentos.new('Yogurt',3.8,4.9,3.8), Alimentos.new('Cerdo',21.5,0.0,6.3),Alimentos.new('Ternera',21.1,0.0,3.1),Alimentos.new('Pollo',20.6,0.0,5.6),Alimentos.new('Bacalao',17.7,0.0,0.4),Alimentos.new('Atún',21.5,0.0,15.5),Alimentos.new('Salmón',19.9,0.0,13.6),Alimentos.new('Aceite de oliva',0.0,0.2,99.6),Alimentos.new('Chocolate',5.3,47.0,30.0),Alimentos.new('Azúcar', 0.0,99.8,0.0),Alimentos.new('Arroz',6.8,77.7,0.6),Alimentos.new('Lentejas',23.5,52.0,1.4),Alimentos.new('Papas',2.0,15.4,0.1),Alimentos.new('Tomate', 1.0,3.5,0.2),Alimentos.new('Cebolla',1.3,5.8,0.3),Alimentos.new('Manzana',0.3,12.4,0.4),Alimentos.new('Plátano',1.2,21.4,0.2) ]
    def initialize(name, &block)
        @nombre = name
        @vegetales = []
        @frutas = []
        @granos = []
        @proteinas = []
        @vet = 0
        

        if block_given?  
            if block.arity == 1
                yield self
            else
            instance_eval(&block) 
            end
        end
    end
    def to_s
        output = @nombre
        output << "\n#{'=' * @nombre.size}\n"
        output << "Composición nutricional: Glúcidos|Lípídos|Proteínas|Valor Energético\n"
        output << "#{@vegetales.join("\n")}\n"
        output << "#{@frutas.join("\n")}\n"
        output << "#{@granos.join("\n")}\n"
        output << "#{@proteinas.join("\n")}\n"
        output << "Valor energético total: #{@vet}\n"
        output
  end    
    def vegetal(nombre,options={})
        alimento = TABLA_ALIMENTOS.find{|i| i.nombre == nombre}
        vegetal = alimento.nombre
        vegetal << ": #{alimento.glucidos}"
        vegetal << "|#{alimento.lipidos}"
        vegetal << "|#{alimento.proteinas}"
        if options[:porcion]
            equivalencia = TABLA_PORCIONES.find{|i| i.porcion == options[:porcion] }.equivalencia     
            vegetal << "|#{(alimento.ve*equivalencia).round(3)}" 
            @vet =+  alimento.ve*equivalencia
        else
            vegetal << "|#{alimento.ve}"
            @vet =+  alimento.ve
        end
        @vegetales << vegetal
        
    end 
    def fruta(nombre,options={})
        alimento = TABLA_ALIMENTOS.find{|i| i.nombre == nombre}
        fruta = alimento.nombre
        fruta = alimento.nombre 
        fruta << ": #{alimento.glucidos}"
        fruta << "|#{alimento.lipidos}"
        fruta << "|#{alimento.proteinas}"
        if options[:gramos]
            fruta << "|#{(alimento.ve*options[:gramos]).round(3)}"
            @vet =+ alimento.ve*options[:gramos]
        else
            fruta << "|#{alimento.ve}"
            @vet =+ alimento.ve
        end    
        @frutas << fruta
    end 
    def grano(nombre,options={})
        alimento = TABLA_ALIMENTOS.find{|i| i.nombre == nombre}
        grano = alimento.nombre
        grano << ": #{alimento.glucidos}"
        grano << "|#{alimento.lipidos}"
        grano << "|#{alimento.proteinas}"
        if options[:porcion]
            equivalencia = TABLA_PORCIONES.find{|i| i.porcion == options[:porcion] }.equivalencia
            grano << "|#{(alimento.ve*equivalencia).round(3)}"
            @vet =+ alimento.ve*equivalencia
        else
            grano << "|#{alimento.ve}"
            @vet =+ alimento.ve
        end    
        @granos << grano
    end 
    def proteina(nombre,options={})
        alimento = TABLA_ALIMENTOS.find{|i| i.nombre == nombre}
        proteina = alimento.nombre
        proteina << ": #{alimento.glucidos}"
        proteina << "|#{alimento.lipidos}"
        proteina << "|#{alimento.proteinas}"
        if options[:porcion] 
            equivalencia = TABLA_PORCIONES.find{|i| i.porcion == options[:porcion] }.equivalencia
            proteina << "|#{(alimento.ve*equivalencia).round(3)}"
            @vet =+ alimento.ve*equivalencia
        else
            proteina << "|#{alimento.ve}"
            @vet =+ alimento.ve
        end    
        @proteinas << proteina
    end     
end

