// Clase Tanque
class Tanque {
  Transform transform;
  PImage imagen;

  Tanque(Transform transform, PImage imagen) {
    this.transform = transform;
    this.imagen = imagen;
  }

  void mover(float deltaTime, float velocidadTanque) {

    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        transform.mover(-velocidadTanque * deltaTime, 0);
      }
      if (key == 'd' || key == 'D') {
        transform.mover(velocidadTanque * deltaTime, 0);
      }
    }
    transform.setX(constrain(transform.getX(), 0, width - 40));
  }

  void dibujar() {
    image(imagen, transform.getX(), transform.getY(), 40, 40);
  }
}
