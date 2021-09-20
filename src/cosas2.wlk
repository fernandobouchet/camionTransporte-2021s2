object knightRider {	
	method cantidadBultos() { return 1 }
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method reaccionar() {
	}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method cantidadBultos() { return 2 }
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method reaccionar() {
		self.transformar()
	}
}

object paqueteDeLadrillos {
	var cant = 0
	var bultos = 1
	
	method cantidadBultos() {
		if (cant <= 100) {bultos = 1} else if (cant.between(101, 300)) {bultos = 3} else {bultos = 3}
		return bultos
	}
	method setCantidad(ladrillos) {
		cant += ladrillos
	}
	method peso() { return cant* 2 }
	method nivelPeligrosidad() { return 2 }
	method reaccionar() {
		self.setCantidad(12)
	}
}

object arenaAGranel {
	var peso = 0
	
	method cantidadBultos() { return 1 }

	method setPeso(cant) {
		peso += cant
	}
	method peso() { return peso }
	method nivelPeligrosidad() { return 1 }
	method reaccionar() {
		self.setPeso(20)
	}
}

object bateriaAntiaerea {
	var misiles = false
	var bultos = 1
	
	method cantidadBultos() {
		if (!misiles) {bultos = 1} else {bultos = 2}
		return bultos
	}
	method cargarMisiles() {
		misiles = true
	}
	method peso() { return if (misiles) 300 else 200 }
	method nivelPeligrosidad() { return if (misiles) 100 else 0 }
	method reaccionar() {
		self.cargarMisiles()
	}
}

object contenedorPortuario {
	const property contiene = []
	var bultos = 1
	
	method cantidadBultos() {
		bultos += contiene.sum({ cosa => cosa.cantidadBultos() })
		return bultos
	}
	
	method agregar(unaCosa) {
		contiene.add(unaCosa)
	}
	method peso() { return contiene.sum({cosa => cosa.peso()}) + 100}
	method nivelPeligrosidad() { return if (contiene.isEmpty()) {0} else {contiene.max({ cosa => cosa.nivelPeligrosidad() }).nivelPeligrosidad()}}
	method reaccionar() {
		contiene.forEach({ cosa => cosa.reaccionar() })
	}
}

object residuosRadioactivos {
	var peso = 0
	
	method cantidadBultos() { return 1 }
	method setPeso(cant) {
		peso += cant
	}
	method peso() { return peso }
	method nivelPeligrosidad() { return 200 }
	method reaccionar() {
		self.setPeso(15)
	}
}

object embalajeDeSeguridad {
	var property envuelve = []
	const bultos = 2
	
	method cantidadBultos() {
		return bultos
	}

	method envuelve(unaCosa) {
		envuelve.add(unaCosa)
	}
	method peso() { return envuelve.sum({ cosa => cosa.peso() }) }
	method nivelPeligrosidad() { return envuelve.sum({ cosa => cosa.nivelPeligrosidad() / 2 })}
	method reaccionar() {
	}
}

