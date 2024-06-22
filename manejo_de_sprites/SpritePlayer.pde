class SpritePlayer {
  protected int xFrame;
  protected int yFrame;
  protected PImage sprite;
  protected int widthFrame;
  protected int heightFrame;
  private float xFrameFloat;
  private float nextxFrameFloat;
  private float velTransicion;

  public SpritePlayer() {
    this.sprite = requestImage("/data/player.png"); // Asegúrate de cargar la imagen correctamente
    this.widthFrame = 96; // 9 frames por fila
    this.heightFrame = 74; // 4 filas
    this.xFrame = 0;
    this.yFrame = 0;
    this.xFrameFloat = 0;
    this.nextxFrameFloat = widthFrame;
    this.velTransicion = 20;
  }

  public void renderPlayer(int state, PVector position, float deltaTime) {
    imageMode(CENTER);

    switch (state) {
    case PlayerStateMachine.IDLE:
      {
        this.yFrame=0;
        image(sprite.get(this.xFrame, yFrame, widthFrame, heightFrame), position.x, position.y);
        //xFrame+=widthFrame;
        xFrameFloat+=(widthFrame*velTransicion*deltaTime);
        if (xFrameFloat>=nextxFrameFloat) {
          this.xFrame+=this.widthFrame;
          nextxFrameFloat=xFrame+this.widthFrame;
          if (this.xFrame>=this.sprite.width) {
            this.xFrame=0;
            this.xFrameFloat=0;
            this.nextxFrameFloat=this.widthFrame;
          }
        }
        break;
      }
    case PlayerStateMachine.MOVE_RIGHT:{
        this.yFrame=heightFrame;
        image(sprite.get(this.xFrame, yFrame, widthFrame, heightFrame), position.x, position.y);
        //xFrame+=widthFrame;
        xFrameFloat+=(widthFrame*velTransicion*deltaTime);

        if (xFrameFloat>=nextxFrameFloat) {
          this.xFrame+=this.widthFrame;
          nextxFrameFloat=xFrame+this.widthFrame;
          if (this.xFrame>=(this.sprite.width-2*widthFrame)) {
            this.xFrame=0;
            this.xFrameFloat=0;
            this.nextxFrameFloat=this.widthFrame;
          }
        }
        break;
    }
    case PlayerStateMachine.MOVE_LEFT:{
        this.yFrame= 2*heightFrame;
        image(sprite.get(this.xFrame, yFrame, widthFrame, heightFrame), position.x, position.y);
        xFrameFloat+=(widthFrame*velTransicion*deltaTime);
        
        if (xFrameFloat >= nextxFrameFloat) {
          this.xFrame += this.widthFrame;
          nextxFrameFloat=xFrame+this.widthFrame;
          if (this.xFrame >= (this.sprite.width-2*widthFrame)) {
            this.xFrame = 0;
            this.xFrameFloat = 0;
            this.nextxFrameFloat = this.widthFrame;
          }
        }
        break;
    }

    }
  }
}
