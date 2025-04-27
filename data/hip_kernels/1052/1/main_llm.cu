#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "GaussianBlur_llm.cu"
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
    unsigned int *B = NULL;
hipMalloc(&B, XSIZE*YSIZE);
unsigned int *G = NULL;
hipMalloc(&G, XSIZE*YSIZE);
unsigned int *R = NULL;
hipMalloc(&R, XSIZE*YSIZE);
int numberOfPixels = 1;
unsigned int width = 1;
int *B_new = NULL;
hipMalloc(&B_new, XSIZE*YSIZE);
int *G_new = NULL;
hipMalloc(&G_new, XSIZE*YSIZE);
int *R_new = NULL;
hipMalloc(&R_new, XSIZE*YSIZE);
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
GaussianBlur<<<gridBlock, threadBlock>>>(B,G,R,numberOfPixels,width,B_new,G_new,R_new);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
GaussianBlur<<<gridBlock, threadBlock>>>(B,G,R,numberOfPixels,width,B_new,G_new,R_new);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
GaussianBlur<<<gridBlock, threadBlock>>>(B,G,R,numberOfPixels,width,B_new,G_new,R_new);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}