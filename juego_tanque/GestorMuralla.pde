// Clase GestorMurallas
class GestorMurallas {
  ArrayList<Muro> muros;
  
  GestorMurallas() {
    muros = new ArrayList<Muro>();
  }
  
  void agregarMuro(Muro muro) {
    muros.add(muro);
  }
  
  void dibujar() {
    for (Muro muro : muros) {
      muro.dibujar();
    }
  }
  
  void verificarColision(ArrayList<Bala> balas) {
    for (int i = balas.size() - 1; i >= 0; i--) {
      Bala bala = balas.get(i);
      for (int j = muros.size() - 1; j >= 0; j--) {
        Muro muro = muros.get(j);
        if (colision(bala, muro)) {
          muro.debilitar(10);
          balas.remove(i);
          if (muro.destruido()) {
            muros.remove(j);
          }
          break;
        }
      }
    }
  }
  
  boolean colision(Bala bala, Muro muro) {
    return !(bala.posicion.x > muro.posicion.x + 40 || bala.posicion.x + 10 < muro.posicion.x ||
             bala.posicion.y > muro.posicion.y + 40 || bala.posicion.y + 10 < muro.posicion.y);
  }
}
