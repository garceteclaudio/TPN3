// Clase Tanque
class Tanque {
  Transform transform;
  PImage imagen;
  
  Tanque(Transform transform, PImage imagen) {
    this.transform = transform;
    this.imagen = imagen;
  }
  
  void mover(float deltaTime) {
    float velocidad = 200;  // Pixeles por segundo
    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        transform.mover(-velocidad * deltaTime, 0);
      }
      if (key == 'd' || key == 'D') {
        transform.mover(velocidad * deltaTime, 0);
      }
    }
    transform.x = constrain(transform.x, 0, width - 40);
  }
  
  void dibujar() {
    image(imagen, transform.x, transform.y, 40, 40);
  }
  
  
}
