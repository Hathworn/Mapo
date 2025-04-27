#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "calcDenseBackwardGPU.cu"
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
    float *dz_in = NULL;
hipMalloc(&dz_in, XSIZE*YSIZE);
float *dz = NULL;
hipMalloc(&dz, XSIZE*YSIZE);
float *in = NULL;
hipMalloc(&in, XSIZE*YSIZE);
float *weights = NULL;
hipMalloc(&weights, XSIZE*YSIZE);
float *biases = NULL;
hipMalloc(&biases, XSIZE*YSIZE);
float *gradients = NULL;
hipMalloc(&gradients, XSIZE*YSIZE);
float *dW = NULL;
hipMalloc(&dW, XSIZE*YSIZE);
float *dB = NULL;
hipMalloc(&dB, XSIZE*YSIZE);
int batch_size = XSIZE*YSIZE;
int in_size_x = XSIZE*YSIZE;
int in_size_y = XSIZE*YSIZE;
int in_size_z = XSIZE*YSIZE;
int out_size_x = XSIZE*YSIZE;
int out_size_y = XSIZE*YSIZE;
int out_size_z = XSIZE*YSIZE;
float momentum = 1;
float decay = 1;
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
calcDenseBackwardGPU<<<gridBlock, threadBlock>>>(dz_in,dz,in,weights,biases,gradients,dW,dB,batch_size,in_size_x,in_size_y,in_size_z,out_size_x,out_size_y,out_size_z,momentum,decay);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
calcDenseBackwardGPU<<<gridBlock, threadBlock>>>(dz_in,dz,in,weights,biases,gradients,dW,dB,batch_size,in_size_x,in_size_y,in_size_z,out_size_x,out_size_y,out_size_z,momentum,decay);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
calcDenseBackwardGPU<<<gridBlock, threadBlock>>>(dz_in,dz,in,weights,biases,gradients,dW,dB,batch_size,in_size_x,in_size_y,in_size_z,out_size_x,out_size_y,out_size_z,momentum,decay);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}