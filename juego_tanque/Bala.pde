// Clase Bala
class Bala {
  Transform transform;
  PImage imagen;

  Bala(Transform transform, PImage imagen) {
    this.transform = transform;
    this.imagen = imagen;
  }

  void mover(float deltaTime, float velocidadBalas) {
    transform.mover(0, -velocidadBalas * deltaTime);
  }

  void dibujar() {
    image(imagen, transform.getX(), transform.getY(), 10, 20);
  }
}
