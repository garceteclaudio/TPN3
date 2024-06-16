private PImage muroImg, tanqueImg, balaImg;
private GestorMurallas gestorMurallas;
private Tanque tanque;
private ArrayList<Bala> balas;
private int lastUpdateTime;

void setup() {
  size(800, 600);
  
  // Cargar imágenes
  muroImg = loadImage("muro.png");
  tanqueImg = loadImage("tanque.png");
  balaImg = loadImage("bala.png");
  
  gestorMurallas = new GestorMurallas();
  tanque = new Tanque(new Transform(width / 2, height - 60), tanqueImg);
  balas = new ArrayList<Bala>();
  
  // Crear muros en posiciones aleatorias
  for (int i = 0; i < 5; i++) {
    gestorMurallas.agregarMuro(new Muro(new Transform(int(random(width - 40)), int(random(height / 2))), muroImg, int(random(10, 31))));
  }
  
  lastUpdateTime = millis();
}

void draw() {
  background(0);
  
  int currentTime = millis();
  float deltaTime = (currentTime - lastUpdateTime) / 1000.0;
  
  tanque.mover(deltaTime);
  tanque.dibujar();
  
  for (int i = balas.size() - 1; i >= 0; i--) {
    Bala bala = balas.get(i);
    bala.mover(deltaTime);
    bala.dibujar();
    
    if (bala.posicion.y < 0) {
      balas.remove(i);
    }
  }
  
  gestorMurallas.dibujar();
  gestorMurallas.verificarColision(balas);
  
  lastUpdateTime = currentTime;
}

void keyPressed() {
  if (key == ' ' && balas.size() < 3) {  // Limitar a 3 balas en pantalla
    balas.add(new Bala(new Transform(tanque.transform.x + 20, tanque.transform.y - 20), balaImg));
  }
}
