abstract class Animal {
  PVector posicion;
  PImage imagen;
  int puntaje;
  
  Animal(PVector posicion, PImage imagen, int puntaje) {
    this.posicion = posicion;
    this.imagen = imagen;
    this.puntaje = puntaje;
  }
  
  void dibujar() {
    image(imagen, posicion.x, posicion.y, 40, 40);
  }
  
  int getPuntaje() {
    return puntaje;
  }
}
