class Nave {
  var velocidad = 0
  var direccionRespectoAlSol = 0

  method velocidad() = velocidad
  method direccionRespectoAlSol() = direccionRespectoAlSol  
  method acelerar(caunto) {
    velocidad =(velocidad + caunto).min(100000)
  }
  method desacelerar(caunto) {
    velocidad =(velocidad - caunto).max(0)
  } 
  method irHaciaElSol() {
    direccionRespectoAlSol = 10
  }
  method escaparDelSol(){
    direccionRespectoAlSol = -10
  }
  method ponerseParaleloAlSol() {
    direccionRespectoAlSol = 0
  }
  method acercarseUnPocoAlSol() {
    direccionRespectoAlSol = 
    (direccionRespectoAlSol + 1).min(10)
  }
  method alejarseUnPocoDelSol() {
    direccionRespectoAlSol = 
    (direccionRespectoAlSol - 1).max(-10)
  }
  method prepararViaje()
  method superViaje(caunto) {//codigo para mandar error, que algo fallo
    if(!caunto.between(0, 50000)){
      throw new Exception
      (message="El valor debe estar entre el 0 y el 50.000")
    }
      self.acelerar(50000)
      /*self.error
      ("El valor debe estar entre el 0 y el 50.000")*/
      
  }
}
class NaveBaliza inherits Nave {
  var color

  method cambiarColorBaliza(colorNuevo) {
    color = colorNuevo
  }
  method color() = color 
  override method prepararViaje() {
    self.cambiarColorBaliza("Verde") 
    self.ponerseParaleloAlSol()
  }
}
class NavePasajeros inherits Nave {
  const property cantidadDePasajeros 
  var comida =0
  var bebida =0

  method comida() =comida
  method bebida() =bebida  
  method cargarComida(cantidad){
    comida = cantidad
  }
  method descarcarComida(cantidad){
    comida = (comida -cantidad).max(0)
  }
  method cargarBebida(cantidad){
    bebida += cantidad
  }
  method descarcarBebida(cantidad){
    bebida = (bebida -cantidad).max(0)
  }
  override method prepararViaje() {
    self.cargarComida(4 * cantidadDePasajeros)
    self.cargarBebida(6 * cantidadDePasajeros)
    self.acercarseUnPocoAlSol()
  }
}
class NaveCombate inherits Nave {
  var estaInvisisble = false
  var misilesDesplegados = true
  const property menajesEmitidos =  [] 

  method ponerseVisible() {
    estaInvisisble =false
  }
  method ponerseInvisible() {
    estaInvisisble = false
  } 
  method estaInvisible() = estaInvisisble
  method desplegarMisiles() {
    misilesDesplegados = true
  }
  method replegarMisiles() {
    misilesDesplegados = false
  }
  method misilesDesplegados() = misilesDesplegados
  method emitirMensaje(mensaje){
    menajesEmitidos.add(mensaje)
  }
  method primerMensajeEmitido() {
    menajesEmitidos.first()
  }
  method ultimoMensajeEmitido() {
    menajesEmitidos.last()
  }
  method esEscueta() = !menajesEmitidos.any
    ({unMensaje => unMensaje.length() > 30})
    /*menajesEmitidos.all
    ({unMensaje => unMensaje.length() <= 30})
    */
  method emitioMensaje(mensaje) = 
    menajesEmitidos.contains(mensaje) 
  override method prepararViaje() {
    self.ponerseVisible()
    self.replegarMisiles()
    self.acelerar(15000)
    self.emitirMensaje("Saliendo En Mision")
  }
}