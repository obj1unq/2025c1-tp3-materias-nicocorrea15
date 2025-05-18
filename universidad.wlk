import estudiantes.*

class Materia {
    
    var property requisitos = #{}
    var property estudiantesInscriptos = #{}
    var property listaDeEspera = #{}
    var property cupo = 30

    method hayCupo() {
       return estudiantesInscriptos.size() < cupo
    }
    method inscribir(estudiante) {
        if (self.hayCupo() and estudiante.puedeInscribirse(self)) {
            estudiantesInscriptos.add(estudiante)
            estudiante.materiasInscriptas().add(self)
        }  else if (!self.hayCupo()) {
           listaDeEspera.add(estudiante)
        }
    }

    method inscribirEstudianteEnEspera() {
        const primeroEnLista = listaDeEspera.first()

        estudiantesInscriptos.add(primeroEnLista)
        listaDeEspera.remove(primeroEnLista)
    }

    method darDeBaja(estudiante) {
        if (estudiantesInscriptos.constains(estudiante)
        and estudiante.materiasInscriptas(self)) {
            self.inscribirEstudianteEnEspera()
        }
    }
}

class Registro {
    var property materia = null
    var property nota = 0

     method materiaYnota(unaMateria, unaNota) {
        materia = unaMateria
        nota = unaNota
    }

    method apruebaA(unaMateria) {
        return materia == unaMateria
    }
}

object objetos1 inherits Materia{}

object objetos2 inherits Materia {}
object objetos3 inherits  Materia {}
object baseDeDatos inherits  Materia {}
object programacionConcurrente inherits  Materia {}
object epyl inherits  Materia {}
object trabajoFinal inherits  Materia {}
object matematicas inherits  Materia {}
object quimica inherits  Materia {}
object biologia inherits  Materia {}
object biologia1 inherits  Materia {}
object anatomia inherits  Materia {}
object derechoRomano inherits  Materia {}
object historiaArgentina inherits  Materia {}
object derechoPenal inherits  Materia {}
object derechoPenal1 inherits  Materia {}

object programacion {
    const property materias = #{objetos1, objetos2, objetos3, baseDeDatos, epyl, trabajoFinal, matematicas}
}
object medicina {
    const property materias = #{quimica, biologia, biologia1, anatomia}
}
object derecho {
    const property materias = #{derechoRomano, historiaArgentina, derechoPenal, derechoPenal1}
}

