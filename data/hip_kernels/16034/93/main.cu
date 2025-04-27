#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "vec_computePSF_phaseNMany_f.cu"
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
    int n = XSIZE*YSIZE;
int sizePart = XSIZE*YSIZE;
int sizeTot = XSIZE*YSIZE;
float *kx = NULL;
hipMalloc(&kx, XSIZE*YSIZE);
float *ky = NULL;
hipMalloc(&ky, XSIZE*YSIZE);
float *kz = NULL;
hipMalloc(&kz, XSIZE*YSIZE);
float *pupil = NULL;
hipMalloc(&pupil, XSIZE*YSIZE);
float *phase = NULL;
hipMalloc(&phase, XSIZE*YSIZE);
float *position = NULL;
hipMalloc(&position, XSIZE*YSIZE);
int *sparseIndexEvenDisk = NULL;
hipMalloc(&sparseIndexEvenDisk, XSIZE*YSIZE);
int *sparseIndexOddDisk = NULL;
hipMalloc(&sparseIndexOddDisk, XSIZE*YSIZE);
float *fft = NULL;
hipMalloc(&fft, XSIZE*YSIZE);
int many = 1;
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
vec_computePSF_phaseNMany_f<<<gridBlock, threadBlock>>>(n,sizePart,sizeTot,kx,ky,kz,pupil,phase,position,sparseIndexEvenDisk,sparseIndexOddDisk,fft,many);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
vec_computePSF_phaseNMany_f<<<gridBlock, threadBlock>>>(n,sizePart,sizeTot,kx,ky,kz,pupil,phase,position,sparseIndexEvenDisk,sparseIndexOddDisk,fft,many);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
vec_computePSF_phaseNMany_f<<<gridBlock, threadBlock>>>(n,sizePart,sizeTot,kx,ky,kz,pupil,phase,position,sparseIndexEvenDisk,sparseIndexOddDisk,fft,many);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}