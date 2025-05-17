import universidad.*
class Estudiante {
    var property carreras = #{}
    var property aprobadas = #{}
    var property materiasInscriptas = #{}

    method cursar(carrera) {
        carreras.add(carrera)
    }

    method aprobar(materia, nota) {
        if (self.aprobo(materia)) {
            throw "La materia ya está aprobada"
            } else { 
              const nuevaMateria = new Registro()
              nuevaMateria.materiaYnota(materia, nota)
              aprobadas.add(nuevaMateria)
        }
    }

    method aprobo(materia) {
        return aprobadas.any({ c => c.apruebaA(materia) })
    }

   method puedeInscribirseAEstasMaterias(carrera) {
    return  if (!carreras.contains(carrera)) {
           throw "alumno no cursa esta carrera"
         } else {
           carrera.materias().filter({ m => self.puedeInscribirse(m) })
    }
}

    method notaDe(materia) {
        return aprobadas.find({ c => c.apruebaA(materia) }).nota()
    }

    method cantidadDeMateriasAprobadas() {
        return aprobadas.size()
    }

    method promedio() {
      return aprobadas.map({ c => c.nota() }).average()
}

    method materiasDeCarrerasQueCursa() {
        return carreras.map({ carrera => carrera.materias()}).flatten()
    }

    method inscribirseA(materia) {
        if (!self.puedeInscribirse(materia)) {
            throw "No puede inscribirse a la materia"
          } else {
              materiasInscriptas.add(materia)
              materia.inscribir(self)
        }
    }

    method puedeInscribirse(materia) {
        return self.estaEnMateriasValidas(materia)
            and !self.estaEnMateriasInscriptas(materia)
            and !self.aprobo(materia)
            and self.cumpleRequisitosDe(materia)
    }

    method estaEnMateriasValidas(materia) {
        return self.materiasDeCarrerasQueCursa().any({ m => m == materia })
    }

    method estaEnMateriasInscriptas(materia) {
        return materiasInscriptas.any({ m => m == materia })
    }

    method cumpleRequisitosDe(materia) {
        return materia.requisitos().all({ req => self.aprobo(req) })
    }
}

object roque inherits Estudiante {
  
}