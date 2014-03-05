class Linea
{
  //  Constructores
  int posX;
  int posY;
  int direccion;
  int entradaPd;
  int[] x;
  int[] y;

  Linea( int _posX, int _posY )
  {
    posX = _posX;
    posY = _posY;
    entradaPd = 0;
    x = new int[7000];
    y = new int[7000];
    direccion = 0;
  }

  void dibujar()
  {
    //  desvanecimiento
    for ( int i = x.length-1; i > 0; i-- )
    {
      x[i] = x[i-1];
      y[i] = y[i-1];
    }

    int limitPosX = constrain(posX, 0, width );
    int limitPosY = constrain(posY, 0, height );

    x[0] = limitPosX; 
    y[0] = limitPosY; 

    //  punto
    for (int i = 0; i < x.length; i++)
    {
      stroke(255);
      strokeWeight(3);
      point(x[i], y[i]);
    }
  }

  void caminar(int entrada)
  {
    boolean derecha   = false;
    boolean izquierda = false;
    boolean abajo     = false;
    boolean arriba    = false;


    if ( ( entrada == 1 ) || ( entrada == 5))
    {
      derecha = true;
      posX += 2;
    } 
    else 
    {
      derecha = false;
    }

    if ( ( entrada == 3 ) || ( entrada == 7 ))
    {
      izquierda = true;
      posX -= 2;
    } 
    else
    {
      izquierda = false;
    }

    if ( ( entrada == 2 ) || ( entrada == 8 ) )
    {
      abajo = true;
      posY += 2;
    } 
    else 
    {
      abajo = false;
    }

    if ( ( entrada == 4 ) || ( entrada == 6 ))
    {
      arriba = true;
      posY -= 2;
    } 
    else
    {
      arriba = false;
    }

    if (keyPressed)
    {
      if (key == 'q')
      {
        background( 0 );
        posX = 10 + int (random(width) ) - 10;
        posY = 10 + int (random(height) ) - 10;
      
      }
    }
  }
}

