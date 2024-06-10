class Snake {
  PVector cabeza;
  ArrayList<Cuerpo> cuerpo;
  PVector direccion;
  
  Snake() {
    cabeza = new PVector(width / 2, height / 2);
    cuerpo = new ArrayList<Cuerpo>();
    direccion = new PVector(1, 0);
    // Iniciar con una longitud de 1
    cuerpo.add(new Cuerpo(new PVector(cabeza.x - 40, cabeza.y)));
  }
  
  void mover() {
    if (keyPressed) {
      if (key == 'w') direccion.set(0, -1);
      if (key == 's') direccion.set(0, 1);
      if (key == 'a') direccion.set(-1, 0);
      if (key == 'd') direccion.set(1, 0);
    }
    PVector nuevaCabeza = PVector.add(cabeza, direccion.copy().mult(40));
    cuerpo.add(0, new Cuerpo(cabeza.copy()));
    cabeza = nuevaCabeza;
    // Solo eliminar la última parte si no ha crecido recientemente
    if (cuerpo.size() > 1) cuerpo.remove(cuerpo.size() - 1);
  }
  
  void dibujar() {
    fill(255);
    rect(cabeza.x, cabeza.y, 40, 40);
    for (Cuerpo c : cuerpo) {
      c.dibujar();
    }
  }
  

}
