#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "calculateDelaysAndPhases_llm.cu"
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
    double *gpuDelays = NULL;
hipMalloc(&gpuDelays, XSIZE*YSIZE);
double lo = 1;
double sampletime = 1;
int fftsamples = 1;
int fftchannels = 1;
int samplegranularity = 1;
float *rotationPhaseInfo = NULL;
hipMalloc(&rotationPhaseInfo, XSIZE*YSIZE);
int *sampleShifts = NULL;
hipMalloc(&sampleShifts, XSIZE*YSIZE);
float *fractionalSampleDelays = NULL;
hipMalloc(&fractionalSampleDelays, XSIZE*YSIZE);
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
calculateDelaysAndPhases<<<gridBlock, threadBlock>>>(gpuDelays,lo,sampletime,fftsamples,fftchannels,samplegranularity,rotationPhaseInfo,sampleShifts,fractionalSampleDelays);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
calculateDelaysAndPhases<<<gridBlock, threadBlock>>>(gpuDelays,lo,sampletime,fftsamples,fftchannels,samplegranularity,rotationPhaseInfo,sampleShifts,fractionalSampleDelays);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
calculateDelaysAndPhases<<<gridBlock, threadBlock>>>(gpuDelays,lo,sampletime,fftsamples,fftchannels,samplegranularity,rotationPhaseInfo,sampleShifts,fractionalSampleDelays);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}