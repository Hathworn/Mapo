#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "blur.cu"
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
    int *B = NULL;
hipMalloc(&B, XSIZE*YSIZE);
int *G = NULL;
hipMalloc(&G, XSIZE*YSIZE);
int *R = NULL;
hipMalloc(&R, XSIZE*YSIZE);
int *RB = NULL;
hipMalloc(&RB, XSIZE*YSIZE);
int *RG = NULL;
hipMalloc(&RG, XSIZE*YSIZE);
int *RR = NULL;
hipMalloc(&RR, XSIZE*YSIZE);
int *K = NULL;
hipMalloc(&K, XSIZE*YSIZE);
int rows = XSIZE;
int cols = YSIZE;
int krows = 1;
int kcols = 1;
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
blur<<<gridBlock, threadBlock>>>(B,G,R,RB,RG,RR,K,rows,cols,krows,kcols);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
blur<<<gridBlock, threadBlock>>>(B,G,R,RB,RG,RR,K,rows,cols,krows,kcols);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
blur<<<gridBlock, threadBlock>>>(B,G,R,RB,RG,RR,K,rows,cols,krows,kcols);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}