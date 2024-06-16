// Clase Muro
class Muro {
  Transform posicion;
  PImage imagen;
  int resistencia;
  
  Muro(Transform posicion, PImage imagen, int resistencia) {
    this.posicion = posicion;
    this.imagen = imagen;
    this.resistencia = resistencia;
  }
  
  void dibujar() {
    image(imagen, posicion.x, posicion.y, 40, 40);
  }
  
  void debilitar(int puntos) {
    resistencia -= puntos;
  }
  
  boolean destruido() {
    return resistencia <= 0;
  }
}
