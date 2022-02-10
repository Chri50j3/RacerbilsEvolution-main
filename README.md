# RacerbilsEvolution-main

Når en bil køre over målsktregen med en hurtigere laptime end den hurtigeste laptime, så bliver dens weights og biases gemt.

Når en ny generation bliver lavet så bliver deres weights og biases bestemt ud fra den hurtigeste bils weights og biases + random(-varians,varians), og varians bliver mindre for hver generation, men bliver aldrig mindre end 0,1.

Hvis en bil rammer det hvide, så bliver den elimineret, og hvis den køre den forkerte vej rundt, så gælder dens tid ikke.
