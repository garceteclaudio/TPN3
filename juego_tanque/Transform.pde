// Clase Transform para manejar la ubicación
class Transform {
  float x, y;
  
  Transform(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void mover(float dx, float dy) {
    x += dx;
    y += dy;
  }
}
