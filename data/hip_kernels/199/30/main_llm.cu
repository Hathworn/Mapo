#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "gpu_Filter_peaks_kernel_llm.cu"
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
    unsigned int *d_new_peak_list_DM = NULL;
hipMalloc(&d_new_peak_list_DM, XSIZE*YSIZE);
unsigned int *d_new_peak_list_TS = NULL;
hipMalloc(&d_new_peak_list_TS, XSIZE*YSIZE);
unsigned int *d_new_peak_list_BW = NULL;
hipMalloc(&d_new_peak_list_BW, XSIZE*YSIZE);
float *d_new_peak_list_SNR = NULL;
hipMalloc(&d_new_peak_list_SNR, XSIZE*YSIZE);
unsigned int *d_peak_list_DM = NULL;
hipMalloc(&d_peak_list_DM, XSIZE*YSIZE);
unsigned int *d_peak_list_TS = NULL;
hipMalloc(&d_peak_list_TS, XSIZE*YSIZE);
unsigned int *d_peak_list_BW = NULL;
hipMalloc(&d_peak_list_BW, XSIZE*YSIZE);
float *d_peak_list_SNR = NULL;
hipMalloc(&d_peak_list_SNR, XSIZE*YSIZE);
unsigned int nElements = 1;
unsigned int max_distance = 1;
int nLoops = 1;
int max_list_pos = 1;
int *gmem_pos = NULL;
hipMalloc(&gmem_pos, XSIZE*YSIZE);
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
gpu_Filter_peaks_kernel<<<gridBlock, threadBlock>>>(d_new_peak_list_DM,d_new_peak_list_TS,d_new_peak_list_BW,d_new_peak_list_SNR,d_peak_list_DM,d_peak_list_TS,d_peak_list_BW,d_peak_list_SNR,nElements,max_distance,nLoops,max_list_pos,gmem_pos);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
gpu_Filter_peaks_kernel<<<gridBlock, threadBlock>>>(d_new_peak_list_DM,d_new_peak_list_TS,d_new_peak_list_BW,d_new_peak_list_SNR,d_peak_list_DM,d_peak_list_TS,d_peak_list_BW,d_peak_list_SNR,nElements,max_distance,nLoops,max_list_pos,gmem_pos);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
gpu_Filter_peaks_kernel<<<gridBlock, threadBlock>>>(d_new_peak_list_DM,d_new_peak_list_TS,d_new_peak_list_BW,d_new_peak_list_SNR,d_peak_list_DM,d_peak_list_TS,d_peak_list_BW,d_peak_list_SNR,nElements,max_distance,nLoops,max_list_pos,gmem_pos);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}