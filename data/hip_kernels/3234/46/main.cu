#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "apply_lifter_and_floor_energy.cu"
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
    int num_frames = 1;
int num_cols = 1;
float cepstral_lifter = 1;
bool use_energy = 1;
float energy_floor = 1;
float *log_energy = NULL;
hipMalloc(&log_energy, XSIZE*YSIZE);
float *lifter_coeffs = NULL;
hipMalloc(&lifter_coeffs, XSIZE*YSIZE);
float *features = NULL;
hipMalloc(&features, XSIZE*YSIZE);
int32_t ldf = 1;
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
apply_lifter_and_floor_energy<<<gridBlock, threadBlock>>>(num_frames,num_cols,cepstral_lifter,use_energy,energy_floor,log_energy,lifter_coeffs,features,ldf);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
apply_lifter_and_floor_energy<<<gridBlock, threadBlock>>>(num_frames,num_cols,cepstral_lifter,use_energy,energy_floor,log_energy,lifter_coeffs,features,ldf);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
apply_lifter_and_floor_energy<<<gridBlock, threadBlock>>>(num_frames,num_cols,cepstral_lifter,use_energy,energy_floor,log_energy,lifter_coeffs,features,ldf);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}