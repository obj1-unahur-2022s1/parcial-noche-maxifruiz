import comidas.*

class Comensales {
	var peso
	const comidasQueComio = []
	
	method leAgrada(unaComida)
	method comer(unaComida) {comidasQueComio.add(unaComida)}
	method estaSatisfecho() = self.pesoDePlatosQueComio() >= peso * 0.01 && self.condicion()
	method pesoDePlatosQueComio() = comidasQueComio.sum { c => c.peso() }	
	method condicion()

}

class Vegetariano inherits Comensales {
	
	override method leAgrada(unaComida) = unaComida.aptoVegetariano() && unaComida.valoracion() > 85 
	override method condicion() = comidasQueComio.all { c => !c.esAbundante() }

}

class HambrePopular inherits Comensales {
	
	override method leAgrada(unaComida) = unaComida.esAbundante()

}

class PaladarFino inherits Comensales {
	
	override method leAgrada(unaComida) = unaComida.peso().between(150,300) && unaComida.valoracion() > 100
	override method condicion() = comidasQueComio.size().even()
	
}

