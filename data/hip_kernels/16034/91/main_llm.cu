#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "vec_computePSF_phaseNwithOil_llm.cu"
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
double *kx = NULL;
hipMalloc(&kx, XSIZE*YSIZE);
double *ky = NULL;
hipMalloc(&ky, XSIZE*YSIZE);
double *kz = NULL;
hipMalloc(&kz, XSIZE*YSIZE);
double *kz_is_imag = NULL;
hipMalloc(&kz_is_imag, XSIZE*YSIZE);
double *kz_oil = NULL;
hipMalloc(&kz_oil, XSIZE*YSIZE);
double *kz_oil_is_imag = NULL;
hipMalloc(&kz_oil_is_imag, XSIZE*YSIZE);
double *pupil = NULL;
hipMalloc(&pupil, XSIZE*YSIZE);
double *phase = NULL;
hipMalloc(&phase, XSIZE*YSIZE);
double dx = 1;
double dy = 1;
double dz = 1;
double dz_oil = 1;
int *sparseIndexEvenDisk = NULL;
hipMalloc(&sparseIndexEvenDisk, XSIZE*YSIZE);
int *sparseIndexOddDisk = NULL;
hipMalloc(&sparseIndexOddDisk, XSIZE*YSIZE);
double *fft = NULL;
hipMalloc(&fft, XSIZE*YSIZE);
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
vec_computePSF_phaseNwithOil<<<gridBlock, threadBlock>>>(n,kx,ky,kz,kz_is_imag,kz_oil,kz_oil_is_imag,pupil,phase,dx,dy,dz,dz_oil,sparseIndexEvenDisk,sparseIndexOddDisk,fft);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
vec_computePSF_phaseNwithOil<<<gridBlock, threadBlock>>>(n,kx,ky,kz,kz_is_imag,kz_oil,kz_oil_is_imag,pupil,phase,dx,dy,dz,dz_oil,sparseIndexEvenDisk,sparseIndexOddDisk,fft);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
vec_computePSF_phaseNwithOil<<<gridBlock, threadBlock>>>(n,kx,ky,kz,kz_is_imag,kz_oil,kz_oil_is_imag,pupil,phase,dx,dy,dz,dz_oil,sparseIndexEvenDisk,sparseIndexOddDisk,fft);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}