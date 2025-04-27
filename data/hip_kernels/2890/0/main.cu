#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "Compute_psi_phi_Kernel.cu"
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
    float *psi = NULL;
hipMalloc(&psi, XSIZE*YSIZE);
float *phi = NULL;
hipMalloc(&phi, XSIZE*YSIZE);
const float *gAbsIx = NULL;
hipMalloc(&gAbsIx, XSIZE*YSIZE);
const float *gAbsIy = NULL;
hipMalloc(&gAbsIy, XSIZE*YSIZE);
const float *gIx = NULL;
hipMalloc(&gIx, XSIZE*YSIZE);
const float *gIy = NULL;
hipMalloc(&gIy, XSIZE*YSIZE);
int nPixels = 1;
float norm_for_contrast_num = XSIZE*YSIZE;
float norm_for_contrast_denom = XSIZE*YSIZE;
float eps = 1;
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
Compute_psi_phi_Kernel<<<gridBlock, threadBlock>>>(psi,phi,gAbsIx,gAbsIy,gIx,gIy,nPixels,norm_for_contrast_num,norm_for_contrast_denom,eps);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
Compute_psi_phi_Kernel<<<gridBlock, threadBlock>>>(psi,phi,gAbsIx,gAbsIy,gIx,gIy,nPixels,norm_for_contrast_num,norm_for_contrast_denom,eps);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
Compute_psi_phi_Kernel<<<gridBlock, threadBlock>>>(psi,phi,gAbsIx,gAbsIy,gIx,gIy,nPixels,norm_for_contrast_num,norm_for_contrast_denom,eps);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}