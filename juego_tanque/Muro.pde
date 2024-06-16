// Clase Muro
class Muro {
  Transform transform;
  PImage imagen;
  int resistencia;

  Muro(Transform transform, PImage imagen, int resistencia) {
    this.transform = transform;
    this.imagen = imagen;
    this.resistencia = resistencia;
  }

  void dibujar() {
    image(imagen, transform.getX(), transform.getY(), 40, 40);
  }

  void debilitar(int puntos) {
    resistencia -= puntos;
  }

  boolean destruido() {
    return resistencia <= 0;
  }
}
