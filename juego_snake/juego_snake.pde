/// MAIN CLASS


Snake snake;
ArrayList<Animal> animales;
int puntaje = 0;
int tiempoInicial, lastUpdateTime;
ArrayList<String> historial;
PImage ratonImg, pajaritoImg, insectoImg;




void setup() {
  size(800, 600);
  snake = new Snake();
  animales = new ArrayList<Animal>();
  historial = new ArrayList<String>();
  
  ratonImg = loadImage("raton.png");
  pajaritoImg = loadImage("pajarito.png");
  insectoImg = loadImage("insecto.png");
  
  // Verificar que las imágenes se cargaron correctamente
  if (ratonImg == null || pajaritoImg == null || insectoImg == null) {
    println("Error: Una o más imágenes no se cargaron correctamente.");
    exit();
  }
  
  spawnAnimal();
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
  
  for (Animal animal : animales) {
    animal.dibujar();
    if (snake.comer(animal)) {
      puntaje += animal.getPuntaje();
      historial.add("Animal: " + animal.getClass().getSimpleName() + " Tiempo: " + (millis() - tiempoInicial) / 1000 + "s");
      animales.remove(animal);
      spawnAnimal();
      break;  // Salir del bucle para evitar ConcurrentModificationException
    }
  }
  
  fill(255);
  textSize(20);
  text("Puntaje: " + puntaje, 10, 20);
  text("Tiempo: " + (millis() - tiempoInicial) / 1000 + "s", 10, 40);
  
  if ((millis() - tiempoInicial) / 1000 >= 60) {
    noLoop();
    textSize(30);
    text("Juego Terminado", width / 2 - 100, height / 2);
    mostrarHistorial();
  }
}

void spawnAnimal() {
  int tipo = int(random(3));
  PVector posicion = new PVector(int(random(width / 40)) * 40, int(random(height / 40)) * 40);
  if (tipo == 0) {
    animales.add(new Ratones(posicion, ratonImg));
  } else if (tipo == 1) {
    animales.add(new Pajaritos(posicion, pajaritoImg));
  } else {
    animales.add(new Insectos(posicion, insectoImg));
  }
}

void mostrarHistorial() {
  for (int i = 0; i < historial.size(); i++) {
    text(historial.get(i), 10, 60 + i * 20);
  }
}
