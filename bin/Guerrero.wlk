import Traje.*

class Guerrero {
	
	var property potencialOfensivo
	var nivelExperiencia
	var nivelEnergia
	var nivelEnergiaOriginal
	
	var traje
	
	method morirse() {
		nivelEnergia = 0
	}
	
	method atacar(unGuerrero) {
		unGuerrero.serAtacado(self)
		unGuerrero.aumentarExperiencia()
	}
	
	method serAtacado(unGuerrero) {
		const porcentajeProteccion = traje.porcentajeDanioReducido()
		nivelEnergia -= unGuerrero.potencialOfensivo() * (1 - porcentajeProteccion)
		traje.desgastarse()
	}
	
	method aumentarExperiencia() {
		nivelExperiencia += traje.porcentajeExperiencia()
	}
	
	method comerSemillaDelErmitanio() {
		nivelEnergia = nivelEnergiaOriginal
	}
	
	method cantidadElementosEnTraje() {
		return traje.cantidadPiezas()
	}
	
}

class Saiyan inherits Guerrero {
	
	var nivel
	var resistencia
	var potencialOfensivoOriginal
	
	method convertirseEnSuperSaiyan() {
		if(self.puedeConvertirse()) {
			nivel ++
			potencialOfensivo += potencialOfensivo * 0.5
			self.mejorarResistencia()
		}
	}
	
	method puedeConvertirse() {
		return nivel < 3
	}
	
	method mejorarResistencia() {
		if(nivel == 1) resistencia = 0.05
		if(nivel == 2) resistencia = 0.07
		if(nivel == 3) resistencia = 0.15
	}
	
	method volverEstadoOriginal() {
		if(self.puedeDesconvertirse()) {
			nivel = 0
			resistencia = 0
		}
	}
	
	method puedeDesconvertirse() {
		return nivelEnergia < nivelEnergiaOriginal * (0.01)
	}
	
	override method comerSemillaDelErmitanio() {
		potencialOfensivo = potencialOfensivoOriginal * 0.05
	}
	
	override method serAtacado(unGuerrero) {
		const porcentajeProteccion = traje.porcentajeDanioReducido() + resistencia
		nivelEnergia -= unGuerrero.potencialOfensivo() * (1 - porcentajeProteccion)
		traje.desgastarse()
	}
	
}