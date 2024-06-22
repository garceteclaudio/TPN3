private Jugador jugador;

void setup(){
  size(800,800);
  jugador = new Jugador();
}

void draw(){
  float deltaTime = Time.getDeltaTime(frameRate);
  background(0);
  jugador.display(deltaTime);
  jugador.move(deltaTime);
  frameRate(60);
}

void keyPressed() {
  switch (key) {
    case 'd':
    case 'D': {
      jugador.setStatePlayer(PlayerStateMachine.MOVE_RIGHT);
      break;
    }
    case 'a':
    case 'A': {
      jugador.setStatePlayer(PlayerStateMachine.MOVE_LEFT);
      break;
    }
  }
}

void keyReleased() {
  switch (key) {
    case 'd':
    case 'D':
    case 'a':
    case 'A': {
      jugador.setStatePlayer(PlayerStateMachine.IDLE);
      break;
    }
  }
}
