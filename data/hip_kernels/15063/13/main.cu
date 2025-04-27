#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "updateHiddenWeights.cu"
#include <chrono>
#include <iostream>
using namespace std;
using namespace std::chrono;
int main(int argc, char **argv) {
hipSetDevice(0);

    int XSIZE = 512; 
    int YSIZE = 512;
    int BLOCKX = 16;
    int BLOCKY = 16;

    if (argc > 1) XSIZE = atoi(argv[1]);
    if (argc > 2) YSIZE = atoi(argv[2]);
    if (argc > 3) BLOCKX = atoi(argv[3]);
    if (argc > 4) BLOCKY = atoi(argv[4]);
    float *d_weights = NULL;
hipMalloc(&d_weights, XSIZE*YSIZE);
float error = 1;
float lr = 1;
int keyPress = 1;
float *d_outputweights = NULL;
hipMalloc(&d_outputweights, XSIZE*YSIZE);
int screenSize = XSIZE*YSIZE;
int numHiddenNeurons = 1;
float *d_bias = NULL;
hipMalloc(&d_bias, XSIZE*YSIZE);
float *firstFire = NULL;
hipMalloc(&firstFire, XSIZE*YSIZE);
int iXSIZE= XSIZE;
int iYSIZE= YSIZE;
while(iXSIZE%BLOCKX!=0) {
iXSIZE++;
}
while(iYSIZE%BLOCKY!=0) {
iYSIZE++;
}
dim3 gridBlock(iXSIZE/BLOCKX, iYSIZE/BLOCKY);
dim3 threadBlock(BLOCKX, BLOCKY);
hipFree(0);
updateHiddenWeights<<<gridBlock, threadBlock>>>(d_weights,error,lr,keyPress,d_outputweights,screenSize,numHiddenNeurons,d_bias,firstFire);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
updateHiddenWeights<<<gridBlock, threadBlock>>>(d_weights,error,lr,keyPress,d_outputweights,screenSize,numHiddenNeurons,d_bias,firstFire);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
updateHiddenWeights<<<gridBlock, threadBlock>>>(d_weights,error,lr,keyPress,d_outputweights,screenSize,numHiddenNeurons,d_bias,firstFire);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}