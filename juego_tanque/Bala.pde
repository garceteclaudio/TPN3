
// Clase Bala
class Bala {
  Transform posicion;
  PImage imagen;
  
  Bala(Transform posicion, PImage imagen) {
    this.posicion = posicion;
    this.imagen = imagen;
  }
  
  void mover(float deltaTime) {
    float velocidad = 300;  // Pixeles por segundo
    posicion.mover(0, -velocidad * deltaTime);
  }
  
  void dibujar() {
    image(imagen, posicion.x, posicion.y, 10, 20);
  }
}
