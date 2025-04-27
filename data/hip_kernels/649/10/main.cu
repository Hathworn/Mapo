#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "calculate_A_ch_1_2.cu"
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
    float *rho = NULL;
hipMalloc(&rho, XSIZE*YSIZE);
float *dz = NULL;
hipMalloc(&dz, XSIZE*YSIZE);
float *s_a = NULL;
hipMalloc(&s_a, XSIZE*YSIZE);
float *xx_or_yy = NULL;
hipMalloc(&xx_or_yy, XSIZE*YSIZE);
float *s_b = NULL;
hipMalloc(&s_b, XSIZE*YSIZE);
float K = 1;
int npix = 1;
int nchannels = 1;
int nimages = 1;
float *A_ch = NULL;
hipMalloc(&A_ch, XSIZE*YSIZE);
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
calculate_A_ch_1_2<<<gridBlock, threadBlock>>>(rho,dz,s_a,xx_or_yy,s_b,K,npix,nchannels,nimages,A_ch);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
calculate_A_ch_1_2<<<gridBlock, threadBlock>>>(rho,dz,s_a,xx_or_yy,s_b,K,npix,nchannels,nimages,A_ch);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
calculate_A_ch_1_2<<<gridBlock, threadBlock>>>(rho,dz,s_a,xx_or_yy,s_b,K,npix,nchannels,nimages,A_ch);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}