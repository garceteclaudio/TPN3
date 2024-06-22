class Jugador {
  private PVector position;
  private int statePlayer;
  private PVector velocity;
  private SpritePlayer spritePlayer;

  public Jugador() {
    this.position = new PVector(width / 2, height / 2);
    this.spritePlayer = new SpritePlayer();
    this.statePlayer = PlayerStateMachine.IDLE;
    this.velocity = new PVector(100, 100);
  }

  public Jugador(PVector position, PVector velocity) {
    this.position = position;
    this.spritePlayer = new SpritePlayer();
    this.statePlayer = PlayerStateMachine.IDLE;
    this.velocity = velocity;
  }

  public void display(float deltaTime) {
    spritePlayer.renderPlayer(this.statePlayer, this.position, deltaTime);
  }// fin display

  public void move(float deltaTime) {
    switch (this.statePlayer) {
      case PlayerStateMachine.MOVE_RIGHT: {
        this.position.x += (this.velocity.x * deltaTime);
        break;
      }
      case PlayerStateMachine.MOVE_LEFT: {
        this.position.x -= (this.velocity.x * deltaTime);
        break;
      }
    }
  }// fin move

  public void setStatePlayer(int statePlayer) {
    this.statePlayer = statePlayer;
  }

  public PVector getPosition() {
    return this.position;
  }

  public void setPosition(PVector position) {
    this.position = position;
  }

  public PVector getVelocity() {
    return this.velocity;
  }
}
