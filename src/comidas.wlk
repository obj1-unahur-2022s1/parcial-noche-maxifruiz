class Plato {
	 
	method peso()
	method aptoVegetariano()  
	method valoracion() 
	method esAbundante() = self.peso() > 250

}

class Provoleta inherits Plato {
	var property peso
	var tieneEspecias  
	
	override method aptoVegetariano() = !tieneEspecias
	method esEspecial() = self.esAbundante() || tieneEspecias
	override method valoracion() = if(self.esEspecial()) 120 else 85

}

class HamburguesaDeCarne inherits Plato {
	var pan = panCasero
	
	override method peso() = 250
	override method aptoVegetariano() = false
	method usarPan(unPan) {pan = unPan}
	override method valoracion() = 60 + pan.valoracion()

}

object panIndustrial {
	
	method valoracion() = 0
	
}

object panCasero {
	
	method valoracion() = 20

}

object panMasaMadre {
	
	method valoracion() = 45

}

class HamburguesaVegetariana inherits HamburguesaDeCarne {
	const legumbre
	
	override method aptoVegetariano() = true
	override method valoracion() = super() + 17.min( 2 * legumbre.size() )

}

class Parrillada inherits Plato {
	const cortesDeCarne = []
	
	method agregarCorte(corteDeCarne) {cortesDeCarne.add(corteDeCarne)}
    method quitarCorte(corteDeCarne) {cortesDeCarne.remove(corteDeCarne)}
	override method aptoVegetariano() = false
	override method peso() = cortesDeCarne.sum { c => c.peso() }
	override method valoracion() = 0.max(15 * self.maximaCalidadDeSusCortes() - self.cantidadDeCortes())	
	method cantidadDeCortes() = cortesDeCarne.size()
	method maximaCalidadDeSusCortes() = cortesDeCarne.max ({ c => c.calidad() }).calidad()

}

class CorteDeCarne {
	
	const nombre
	const property calidad
	const property peso
	
}







