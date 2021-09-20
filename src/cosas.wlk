object knightRider {	
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos {
	var cant = 0

	method setCantidad(ladrillos) {
		cant += ladrillos
	}
	method peso() { return cant* 2 }
	method nivelPeligrosidad() { return 2 }
}

object arenaAGranel {
	var peso = 0
	
	method setPeso(cant) {
		peso += cant
	}
	method peso() { return peso }
	method nivelPeligrosidad() { return 1 }
}

object bateriaAntiaerea {
	var misiles = false

	method cargarMisiles() {
		misiles = true
	}
	method peso() { return if (misiles) 300 else 200 }
	method nivelPeligrosidad() { return if (misiles) 100 else 0 }
}

object contenedorPortuario {
	const property contiene = []
	
	method agregar(unaCosa) {
		contiene.add(unaCosa)
	}
	method peso() { return contiene.sum({cosa => cosa.peso()}) + 100}
	method nivelPeligrosidad() { return if (contiene.isEmpty()) {0} else {contiene.max({ cosa => cosa.nivelPeligrosidad() }).nivelPeligrosidad()}}
}

object residuosRadioactivos {
	var peso = 0
	
	method setPeso(cant) {
		peso += cant
	}
	method peso() { return peso }
	method nivelPeligrosidad() { return 200 }
}

object embalajeDeSeguridad {
	var property envuelve = []

	method envuelve(unaCosa) {
		envuelve.add(unaCosa)
	}
	method peso() { return envuelve.sum({ cosa => cosa.peso() }) }
	method nivelPeligrosidad() { return envuelve.sum({ cosa => cosa.nivelPeligrosidad() / 2 })}
}
