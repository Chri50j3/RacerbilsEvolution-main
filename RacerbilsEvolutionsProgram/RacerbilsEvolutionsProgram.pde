//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int       populationSize  = 200;    
float[]   bedstweights = {0, 0, 0, 0, 0, 0, 0, 0};
float[]   bedstbiases = {0, 0, 0};
float     generation;
int       BedstLap = 1111;
int       resetCounter;

//CarSystem: Indholder en population af "controllere" 
CarSystem carSystem       = new CarSystem(populationSize);

//trackImage: RacerBanen , Vejen=sort, Udenfor=hvid, Målstreg= 100%grøn 
PImage    trackImage;

void setup() {
  size(500, 600);
  trackImage = loadImage("track.png");
}

void draw() {
  background(255);
  image(trackImage, 0, 80);  

  carSystem.updateAndDisplay();

  fill(0);
  text("Bedst laptime: " + BedstLap, 20, 20);
  text("Generation: " + generation, 20, 30);


  if (resetCounter < frameCount-500) {
    nextGen();
  }
}

void nextGen() {
  generation++;
  resetCounter = frameCount;
  carSystem = new CarSystem(populationSize);
}
