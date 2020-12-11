import Pieza.*

class Traje {
	
	var desgaste = 0
	var desgastado = false
	
	method porcentajeDanioReducido() {
		return 0.1
	}
	
	method porcentajeExperiencia() {
		return 1
	}
	
	method desgastarse() {
		desgaste += 5
		if(desgaste >= 100) {
			desgastado = true
		}
	}
	
	method cantidadPiezas() {
		return 1
	}
	
}

class TrajeComun inherits Traje {
	
	var porcentajeProteccion
	
	
	override method porcentajeDanioReducido() {
		if(!desgastado) {
			return 0.1 - porcentajeProteccion
		}
		else return super()
	}
	
}

class TrajeDeEntrenamiento inherits Traje {
	
	var property porcentajeExperienciaAdicional = 1
	
	override method porcentajeExperiencia() {
		if(!desgastado) {
			return 1 + porcentajeExperienciaAdicional
		}
		else return super()
	}
	
}

class TrajeModularizado inherits Traje {
	
	var piezas = []
	
	override method porcentajeDanioReducido() {
		const piezasNoGastadas = self.piezasSinDesgaste()
		return self.totalPorcentajeResistenciaPiezas(piezasNoGastadas)
	}
	
	method piezasSinDesgaste() {
		return piezas.filter({unaPieza => unaPieza.estaGastada().negate()})
	}
	
	method totalPorcentajeResistenciaPiezas(unasPiezas) {
		return unasPiezas.sum({unaPieza => unaPieza.porcentajeResistencia()})
	}
	
	override method porcentajeExperiencia() {
		if(!desgastado) {
			return self.piezasSinDesgaste().size() / self.cantidadPiezas()
		}
		else return super()
	}
	
	override method cantidadPiezas() {
		return piezas.size()
	}
	
}
