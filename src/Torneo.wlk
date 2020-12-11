class Torneo {
	
	const postulantes = []
	var participantes = postulantes
	
	method seleccionarCompetidores() {
		self.criterioTorneo()
		participantes = participantes.take(16)
	}
	
	method criterioTorneo()
	
}

class TorneoPowerlsBest inherits Torneo {
	
	override method criterioTorneo() {
		participantes.sortBy({unPostulante, otroPostulante => unPostulante.potencialOfensivo() > otroPostulante.potencialOfensivo()})
	}
	
}

class TorneoFunny inherits Torneo {
	
	override method criterioTorneo() {
		participantes.sortBy({unPostulante, otroPostulante => unPostulante.cantidadElementosEnTraje() > otroPostulante.cantidadElementosEnTraje()})
	}
	
}

class TorneoSurprise inherits Torneo {
	
	override method criterioTorneo() {
		// ???
	}
	
}
