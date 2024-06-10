Snake snake;
int lastUpdateTime, tiempoInicial;

void setup() {
  size(800, 600);
  snake = new Snake();
  
  tiempoInicial = millis();
  lastUpdateTime = millis();
}

void draw() {
  background(0);  
  int currentTime = millis();
  if (currentTime - lastUpdateTime >= 200) {  // Actualizar cada 200 ms
    snake.mover();
    lastUpdateTime = currentTime;
  }
  
  snake.dibujar();

}
