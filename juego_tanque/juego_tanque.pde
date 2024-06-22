// JuegoTanque
PImage muroImg, tanqueImg, balaImg;
GestorMurallas gestorMurallas;
Tanque tanque;
ArrayList<Bala> balas;
int lastUpdateTime;

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
  for (int i = 0; i < 6; i++) {
    gestorMurallas.agregarMuro(new Muro(new Transform(int(random(width - 40)), int(random(height / 2))), muroImg, int(random(10, 31))));
  }

  frameRate(60);
}

void draw() {
  background(0);


  float deltaTime = Time.getDeltaTime(frameRate);

  tanque.mover(deltaTime,200);
  tanque.dibujar();

  for (int i = balas.size() - 1; i >= 0; i--) {
    Bala bala = balas.get(i);
    bala.mover(deltaTime, 1700);
    bala.dibujar();

    if (bala.transform.getY() < 0) {
      balas.remove(i);
    }
  }

  gestorMurallas.dibujar();
  gestorMurallas.verificarColision(balas);


}

void keyPressed() {
  if (key == ' ' && balas.size() < 3) {  // Limitar a 3 balas en pantalla
    balas.add(new Bala(new Transform(tanque.transform.getX() + 20, tanque.transform.getY() - 20), balaImg));
  }
}
