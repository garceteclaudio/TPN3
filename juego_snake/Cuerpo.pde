class Cuerpo extends GameObject{
  
  
  Cuerpo(PVector posicion) {
    this.posicion = posicion;
  }
  
  void dibujar() {
    rect(posicion.x, posicion.y, 40, 40);
  }
}
