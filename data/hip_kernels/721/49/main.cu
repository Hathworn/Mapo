#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "EFD_2dBM.cu"
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
    int width = XSIZE;
int height = YSIZE;
int pitch_n = 2;
int pitch_npo = 2;
float *d_val_n = NULL;
hipMalloc(&d_val_n, XSIZE*YSIZE);
float *d_val_npo = NULL;
hipMalloc(&d_val_npo, XSIZE*YSIZE);
float alpha = 2;
float beta = 2;
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
EFD_2dBM<<<gridBlock, threadBlock>>>(width,height,pitch_n,pitch_npo,d_val_n,d_val_npo,alpha,beta);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
EFD_2dBM<<<gridBlock, threadBlock>>>(width,height,pitch_n,pitch_npo,d_val_n,d_val_npo,alpha,beta);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
EFD_2dBM<<<gridBlock, threadBlock>>>(width,height,pitch_n,pitch_npo,d_val_n,d_val_npo,alpha,beta);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}