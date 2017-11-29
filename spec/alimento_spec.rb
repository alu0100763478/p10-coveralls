require 'spec_helper'
require 'benchmark'

RSpec.describe Alimentos do

context "# Alimentos" do
before :all do

        @huevoFrito= Alimentos.new('Huevo frito',14.1,0.0,19.5)
        @leche= Alimentos.new('Leche vaca',3.3,4.8,3.2)
        @yogurt= Alimentos.new('Yogurt',3.8,4.9,3.8)
        @cerdo= Alimentos.new('Cerdo',21.5,0.0,6.3)
        @ternera= Alimentos.new('Ternera',21.1,0.0,3.1)
        @pollo= Alimentos.new('Pollo',20.6,0.0,5.6)
        @bacalo= Alimentos.new('Bacalao',17.7,0.0,0.4)
        @atun= Alimentos.new('Atún',21.5,0.0,15.5)
        @salmon= Alimentos.new('Salmón',19.9,0.0,13.6)
        @aceite= Alimentos.new('Aceite de oliva',0.0,0.2,99.6)
        @chocolate= Alimentos.new('Chocolate',5.3,47.0,30.0)
        @azucar= Alimentos.new('Azúcar', 0.0,99.8,0.0)
        @arroz= Alimentos.new('Arroz',6.8,77.7,0.6)
        @lentejas= Alimentos.new('Lentejas',23.5,52.0,1.4)
        @papas= Alimentos.new('Papas',2.0,15.4,0.1)
        @tomate= Alimentos.new('Tomate', 1.0,3.5,0.2)
        @cebolla= Alimentos.new('Cebolla',1.3,5.8,0.3)
        @manzana= Alimentos.new('Manzana',0.3,12.4,0.4)
        @platanos= Alimentos.new('Plátano',1.2,21.4,0.2)  
end 

context "# Correcto almacenamiento y funcionamiento de los método de la clase Alimentos" do
    describe "Pruebas almacenamiento de las variables: " do
        it "Se almacena correctamente el nombre" do
          expect(@yogurt.nombre).to eq('Yogurt') 
          expect(@leche.nombre).to eq('Leche vaca')
        end
        it "Se almacena correctamente la cantidad de proteínas" do
          expect(@platanos.proteinas).to eq(1.2) 
        end  
        it "Se almacena correctamente la cantidad de glúcidos" do
          expect(@manzana.glucidos).to eq(12.4) 
        end  
        it "Se almacena correctamente la cantidad de lípidos" do
          expect(@cebolla.lipidos).to eq(0.3) 
        end
    end

    describe "Prueba del método ve: " do
        it "Se muestra el valor energético del alimento " do
          expect(@tomate.ve).to eq(19.8)
          expect(@chocolate.ve).to eq(479.2)
          expect(@arroz.ve).to eq(343.4)
          expect(@salmon.ve).to eq(202)
        end
    end

    describe "Prueba del alimento formateado: " do
        it "Se muestra el alimento formateado " do
          expect(@papas.to_s).to eq("Alimento:\sPapas\n------------------------------\nProteínas:\s2.0g\nGlúcidos:\s15.4g\nLípidos:\s0.1g") 
        end
    end 
end

context "# Herencia, tipo de objeto y jerarquía de la clase Alimentos" do
    describe "Pruebas para objeto alimentos" do
        it "un objeto alimentos es una instancia de la clase Alimentos" do
          expect(@huevoFrito).to be_an_instance_of(Alimentos::Alimentos)
        end

        it "un objeto alimentos es una instancia de la clase Object" do
          expect(@huevoFrito).not_to be_an_instance_of(Object)
        end

        it "un objeto alimentos es una instancia de la clase BasicObject" do
          expect(@huevoFrito).not_to be_an_instance_of(BasicObject)
        end

        it "un alientos es un Alimentos" do
          expect(@huevoFrito).to be_a_kind_of(Alimentos::Alimentos)
        end

        it "un aliemntos es un Object" do
          expect(@huevoFrito).to be_a_kind_of(Object)
        end

        it "un aliemntos es un BasicObject" do
          expect(@huevoFrito).to be_a_kind_of(BasicObject)
        end
    end

    describe "Pruebas para el tipo de un objeto Alimentos" do
        it "un objeto alimentos responde al método nombre, proteinas,glucidos y lipidos" do
          expect(@huevoFrito).to respond_to(:nombre,:proteinas,:glucidos,:lipidos)
        end

        it "un objeto alimentos responde al método ve" do
          expect(@huevoFrito).to respond_to('ve')
        end
     end
end    

context "# Módulo Comparable" do
    describe "Pruebas para comprobar que dos alimentos son iguales" do
      it " Alimentos con el mismo nombre" do
        @huevo = Alimentos.new('Huevo frito',14.1,0.0,19.5)
        expect(@huevoFrito==@huevo).to eq(true)
        expect(@atun==@salmon).to eq(false)
        expect(@yogurt==@atun).to eq(false)
      end
      it " Comparación de cantidad de micronutrientes entre alimentos" do
        expect(@atun.glucidos==@salmon.glucidos).to eq(true)
        expect(@huevoFrito.glucidos==@salmon.glucidos).to eq(true)
        expect(@yogurt.glucidos>@atun.glucidos).to eq(true)
        expect(@tomate.lipidos<@cebolla.lipidos).to eq(true)
        expect(@platanos.proteinas<@papas.proteinas).to eq(true)
        expect(@aceite.proteinas>@arroz.proteinas).to eq(false)
        expect(@manzana.proteinas>@yogurt.proteinas).to eq(false)
        expect(@ternera.lipidos>@aceite.lipidos).to eq(false)
      end
   end	  
end
    
end #context Alimentos

context "Listas y Grupos de Alimentos" do
before :all do  
        @huevoFrito= AGrupos.new('Huevo frito',14.1,0.0,19.5,'Huevos, lácteos y helados')
        @leche= AGrupos.new('Leche vaca',3.3,4.8,3.2,'Huevos, lácteos y helados')
        @yogurt= AGrupos.new('Yogurt',3.8,4.9,3.8,'Huevos, lácteos y helados')
        @cerdo= AGrupos.new('Cerdo',21.5,0.0,6.3,'Carnes y derivados')
        @ternera= AGrupos.new('Ternera',21.1,0.0,3.1,'Carnes y derivados')
        @pollo= AGrupos.new('Pollo',20.6,0.0,5.6,'Carnes y derivados')
        @bacalo= AGrupos.new('Bacalao',17.7,0.0,0.4,'Pescados y mariscos')
        @atun= AGrupos.new('Atún',21.5,0.0,15.5,'Pescados y mariscos')
        @salmon= AGrupos.new('Salmón',19.9,0.0,13.6,'Pescados y mariscos')
        @aceite= AGrupos.new('Aceite de oliva',0.0,0.2,99.6,'Alimentos grasos')
        @chocolate= AGrupos.new('Chocolate',5.3,47.0,30.0,'Alimentos grasos')
        @azucar= AGrupos.new('Azúcar', 0.0,99.8,0.0,'Alimentos ricos en carbohidratos')
        @arroz= AGrupos.new('Arroz',6.8,77.7,0.6,'Alimentos ricos en carbohidratos')
        @lentejas= AGrupos.new('Lentejas',23.5,52.0,1.4,'Alimentos ricos en carbohidratos')
        @papas= AGrupos.new('Papas',2.0,15.4,0.1,'Alimentos ricos en carbohidratos')
        @tomate= AGrupos.new('Tomate',1.0,3.5,0.2,'Verduras y Hortalizas')
        @cebolla= AGrupos.new('Cebolla',1.3,5.8,0.3,'Verduras y Hortalizas')
        @manzana= AGrupos.new('Manzana',0.3,12.4,0.4,'Frutas')
        @platanos= AGrupos.new('Plátano',1.2,21.4,0.2,'Frutas')

        @nodo1 = Node.new(@huevoFrito)
        @nodo2 = Node.new(@leche)
        @nodo3 = Node.new(@yogurt)
        @nodo4 = Node.new(@cerdo)
        @nodo5 = Node.new(@ternera)
        @nodo6 = Node.new(@pollo)
        @nodo7 = Node.new(@bacalo)
        @nodo8 = Node.new(@atun)
        @nodo9 = Node.new(@salmon)
        @nodo10 = Node.new(@aceite)
        @nodo11 = Node.new(@chocolate)
        @nodo12 = Node.new(@azucar)
        @nodo13 = Node.new(@arroz)
        @nodo14 = Node.new(@lentejas)
        @nodo15 = Node.new(@papas)
        @nodo16 = Node.new(@tomate)
        @nodo17 = Node.new(@cebolla)
        @nodo18 = Node.new(@manzana)
        @nodo19 = Node.new(@platanos)
        
        @lista = Lista.new
        @lista.push(@nodo1)
        @lista.push(@nodo2)
        @lista.push(@nodo3)
        @lista.push(@nodo4)
        @lista.push(@nodo5)
        @lista.push(@nodo6)
        @lista.push(@nodo7)
        @lista.push(@nodo8)
        @lista.push(@nodo9)
        @lista.push(@nodo10)
        @lista.push(@nodo11)
        @lista.push(@nodo12)
        @lista.push(@nodo13)
        @lista.push(@nodo14)
        @lista.push(@nodo15)
        @lista.push(@nodo16)
        @lista.push(@nodo17)
        @lista.push(@nodo18)
        @lista.push(@nodo19)
end

context "# Correcto almacenamiento y funcionamiento de los métodos de la clase Node" do

   describe "Prueba de nodos" do
        it "Debe de existir un nodo con sus datos, siguiente y previo" do
          expect(@nodo1.value.nombre).to eq("Huevo frito")
          expect(@nodo2.value.nombre).to eq("Leche vaca")
          expect(@nodo10.value.nombre).to eq("Aceite de oliva")
          expect(@nodo14.value.nombre).to eq("Lentejas")
          expect(@nodo11.value.nombre).to eq('Chocolate')
          expect(@nodo11.next.value.nombre).to eq('Azúcar')
          expect(@nodo12.value.nombre).to eq('Azúcar')
          expect(@nodo12.next.value.nombre).to eq('Arroz')
          expect(@nodo8.prev.value.nombre).to eq('Bacalao')
          expect(@nodo9.prev.value.nombre).to eq('Atún')
          expect(@nodo3.value.nombre).to eq('Yogurt')
          expect(@nodo3.next.value.nombre).to eq('Cerdo')
          expect(@nodo3.prev.value.nombre).to eq('Leche vaca')
        end
    end
end    
    
context "# Correcto almacenamiento y funcionamiento de los métodos de la clase Lista" do
    describe "Pruebas para la lista: " do
        it "Se inserta un nodo en la lista" do
          expect(@lista.cabeza.next.value.nombre).to eq('Leche vaca')
          expect(@lista.cabeza.prev.value.nombre).to eq('Plátano')
          expect(@lista.cabeza.value.nombre).to eq('Huevo frito')
          expect(@lista.cola.next.value.nombre).to eq('Huevo frito')
          expect(@lista.cola.prev.value.nombre).to eq('Manzana')
          expect(@lista.cola.value.nombre).to eq('Plátano')
        end

        it "Se extrae el primer elemento de la Lista: " do
#          expect(@lista.cabeza.value.nombre).to eq('Huevo frito')
#          @lista.pop_first
#          expect(@lista.cabeza.value.nombre).to eq('Leche vaca')
        end
        it "Se extrae el último elemento de la Lista: " do
#          expect(@lista.cola.value.nombre).to eq('Plátano')
#          @lista.pop_last
#          expect(@lista.cola.value.nombre).to eq('Manzana')
        end
    end
end

context "# Herencia, tipo y jerarquía de la clase AGrupos" do
   describe "Pruebas para objeto agrupos" do
        it "un objeto agrupos es una instancia de la clase AGrupos" do
          expect(@huevoFrito).to be_an_instance_of(AGrupos::AGrupos)
        end

        it "un objeto agrupos es una instancia de la clase Object" do
          expect(@huevoFrito).not_to be_an_instance_of(Object)
        end

        it "un objeto agrupos es una instancia de la clase BasicObject" do
          expect(@huevoFrito).not_to be_an_instance_of(BasicObject)
        end

        it "un agrupos es un AGrupos" do
          expect(@huevoFrito).to be_a_kind_of(AGrupos::AGrupos)
        end

        it "un agrupos es un Object" do
          expect(@huevoFrito).to be_a_kind_of(Object)
        end

        it "un agrupos es un BasicObject" do
          expect(@huevoFrito).to be_a_kind_of(BasicObject)
        end
    end
    describe "Pruebas para el tipo de un objeto AGrupos" do
        it "un objeto agrupos responde al método nombre, proteinas,glucidos y lipidos" do
          expect(@huevoFrito).to respond_to(:nombre,:proteinas,:glucidos,:lipidos)
        end

        it "un objeto agrupos responde al método nombre, proteinas,glucidos y lipidos" do
          expect(@huevoFrito).to respond_to(:ngrupo)
        end

        it "un objeto agrupos responde al método ve" do
          expect(@huevoFrito).to respond_to('ve')
        end
    end

    describe "Pruebas para la permanencia de una jerarquía" do
        it "un agrupos es un Alimentos" do
          expect(@huevoFrito).to be_a_kind_of(Alimentos::Alimentos)
        end
    end
    
end

context "# Correcto formateo de la clase AGrupos" do
    describe "Pruebas para el formateo de los grupos de alimentos" do
        it "Grupos de alimentos formateados" do
          expect(@papas.to_s).to eq("Grupo: Alimentos ricos en carbohidratos\nAlimento:\sPapas\n------------------------------\nProteínas:\s2.0g\nGlúcidos:\s15.4g\nLípidos:\s0.1g")
       end
    end
end

context "# Módulo Enumerable" do
  describe "Pruebas para el módulo Enumerable incluído en la clase Lista" do    
      it " Núnero de nodos en la lista" do
        expect(@lista.count).to eq(19) 
      end
      it " Mínimos del valor energético" do
        expect(@lista.min.ve).to eq(19.8)
      end
      it " Máximos del valor energético" do
        expect(@lista.max.ve).to eq(897.2)
      end  
  end
end

context "# Programación funcional y Benchmarks" do

before :all do
        @huevoFrito= AGrupos.new('Huevo frito',14.1,0.0,19.5,'Huevos, lácteos y helados')
        @leche= AGrupos.new('Leche vaca',3.3,4.8,3.2,'Huevos, lácteos y helados')
        @yogurt= AGrupos.new('Yogurt',3.8,4.9,3.8,'Huevos, lácteos y helados')
        @cerdo= AGrupos.new('Cerdo',21.5,0.0,6.3,'Carnes y derivados')
        @ternera= AGrupos.new('Ternera',21.1,0.0,3.1,'Carnes y derivados')
        @pollo= AGrupos.new('Pollo',20.6,0.0,5.6,'Carnes y derivados')
        @bacalo= AGrupos.new('Bacalao',17.7,0.0,0.4,'Pescados y mariscos')
        @atun= AGrupos.new('Atún',21.5,0.0,15.5,'Pescados y mariscos')
        @salmon= AGrupos.new('Salmón',19.9,0.0,13.6,'Pescados y mariscos')
        @aceite= AGrupos.new('Aceite de oliva',0.0,0.2,99.6,'Alimentos grasos')
        @chocolate= AGrupos.new('Chocolate',5.3,47.0,30.0,'Alimentos grasos')
        @azucar= AGrupos.new('Azúcar', 0.0,99.8,0.0,'Alimentos ricos en carbohidratos')
        @arroz= AGrupos.new('Arroz',6.8,77.7,0.6,'Alimentos ricos en carbohidratos')
        @lentejas= AGrupos.new('Lentejas',23.5,52.0,1.4,'Alimentos ricos en carbohidratos')
        @papas= AGrupos.new('Papas',2.0,15.4,0.1,'Alimentos ricos en carbohidratos')
        @tomate= AGrupos.new('Tomate',1.0,3.5,0.2,'Verduras y Hortalizas')
        @cebolla= AGrupos.new('Cebolla',1.3,5.8,0.3,'Verduras y Hortalizas')
        @manzana= AGrupos.new('Manzana',0.3,12.4,0.4,'Frutas')
        @platanos= AGrupos.new('Plátano',1.2,21.4,0.2,'Frutas') 

    @array = [@huevoFrito,@leche,@yogurt,@cerdo,@ternera,@pollo,@bacalo,@atun,@salmon,@aceite,@chocolate,@azucar,@arroz,@lentejas,
                @papas,@tomate,@cebolla,@manzana,@platanos]
end  

    describe "Permite obtener un nuevo array con los elementos ordenados por su valor energético usando bucles for"
         it "for" do
          expect((ordenados_for(@array)).collect{|a| a.ve}).to eq([19.8, 31.1, 54.4, 61.2, 69.0, 70.5, 74.4, 92.2, 112.3, 132.8, 142.7, 202.0, 225.5, 231.9, 314.6, 343.4, 399.2, 479.2, 897.2])
        end
         it "each" do
          expect((ordenados_each(@array)).collect{|a| a.ve}).to eq([19.8, 31.1, 54.4, 61.2, 69.0, 70.5, 74.4, 92.2, 112.3, 132.8, 142.7, 202.0, 225.5, 231.9, 314.6, 343.4, 399.2, 479.2, 897.2])
        end  
        it "Benchmark" do
          Benchmark.bm(10) do |b|
          b.report("Ordenados usando for") { ordenados_for(@array) }
          b.report("Ordenados usando each") { ordenados_each(@array) }
          b.report("Ordenados usando sort") { @array.sort }
          end
	end
   end 		
end 

end #context AGrupos



