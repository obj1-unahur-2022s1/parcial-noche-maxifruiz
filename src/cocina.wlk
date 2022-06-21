import comidas.*
import comensales.*

object Cocina {
	const platos = []
	
	method prepararPlato(unPlato) {platos.add(unPlato)}
	method quitarPlato(unPlato) {platos.remove(unPlato)}
	method buenaOfertaVegetariana() = self.cantDePlatosNoVegetarianos() <=2
	method cantDePlatosNoVegetarianos() = platos.size() - self.cantDePlatosVegetarianos()
	method cantDePlatosVegetarianos() = platos.count { p => p.aptoVegetariano() }
	method platoFuerteCarnivoro() = self.cantDePlatosNoVegetarianos().max { p => p.valoracion() }
	method platosQueLeGustanA(unComensal) = platos.filter { p => unComensal.leAgrada(p) }
	method elegirPlatoPara(unComensal) {
		if(self.platosQueLeGustanA(unComensal).isEmpty()) self.error("No hay ningun plato que le guste")
		const platoAleatorio = self.platosQueLeGustanA(unComensal).anyOne()
		platos.remove(platoAleatorio)
		unComensal.comer(platoAleatorio)
	}
}