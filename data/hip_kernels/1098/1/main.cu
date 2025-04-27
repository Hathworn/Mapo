#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "ApplyCorrections.cu"
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
    unsigned char *g_pSLM_uc = NULL;
hipMalloc(&g_pSLM_uc, XSIZE*YSIZE);
unsigned char *g_LUT = NULL;
hipMalloc(&g_LUT, XSIZE*YSIZE);
float *g_AberrationCorr_f = NULL;
hipMalloc(&g_AberrationCorr_f, XSIZE*YSIZE);
float *g_LUTPolCoeff_f = NULL;
hipMalloc(&g_LUTPolCoeff_f, XSIZE*YSIZE);
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
ApplyCorrections<<<gridBlock, threadBlock>>>(g_pSLM_uc,g_LUT,g_AberrationCorr_f,g_LUTPolCoeff_f);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
ApplyCorrections<<<gridBlock, threadBlock>>>(g_pSLM_uc,g_LUT,g_AberrationCorr_f,g_LUTPolCoeff_f);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
ApplyCorrections<<<gridBlock, threadBlock>>>(g_pSLM_uc,g_LUT,g_AberrationCorr_f,g_LUTPolCoeff_f);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}