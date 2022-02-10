//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int       populationSize  = 100;    
float[]   bedstweights = {0, 0, 0, 0, 0, 0, 0, 0};
float[]   bedstbiases = {0, 0, 0};
float     generation = 1;
int       BedstLap = 1111;
int       resetCounter;

boolean letThemRace;
int x=60, y=232;
//int x=360, y=517;

//CarSystem: Indholder en population af "controllere" 
CarSystem carSystem       = new CarSystem(populationSize);

//trackImage: RacerBanen , Vejen=sort, Udenfor=hvid, Målstreg= 100%grøn 
PImage    trackImage;

void setup() {
  size(900, 600);
  trackImage = loadImage("track.png");
}

void draw() {
  background(255);
  image(trackImage, 0, 80);  

  carSystem.updateAndDisplay();

  fill(0);
  text("Bedst laptime: " + BedstLap, 20, 20);
  text("Generation: " + int(generation), 20, 30);
  
  for(int i=0; i<bedstweights.length;i++){
    text("bedstweight "+i+": "+ bedstweights[i],550,i*20+50);
  }
  
  for(int i=0; i<bedstbiases.length;i++){
    text("bedstbias "+i+": "+ bedstbiases[i],550,i*20+230);
  }

  if (resetCounter < frameCount-500) {
    nextGen();
  }
}

void nextGen() {
  if(!letThemRace){
    generation++;
    resetCounter = frameCount;
    carSystem = new CarSystem(populationSize);
  }
}

void keyPressed(){
  if(key == 'r'){
    letThemRace = true;
  }
}
