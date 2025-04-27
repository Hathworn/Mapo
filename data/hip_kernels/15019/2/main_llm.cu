#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "histogram_kernel_llm.cu"
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
    float *magnitude = NULL;
hipMalloc(&magnitude, XSIZE*YSIZE);
float *phase = NULL;
hipMalloc(&phase, XSIZE*YSIZE);
float *histograms = NULL;
hipMalloc(&histograms, XSIZE*YSIZE);
int input_width = XSIZE;
int input_height = YSIZE;
int cell_grid_width = XSIZE;
int cell_grid_height = YSIZE;
int magnitude_step = 1;
int phase_step = 1;
int histograms_step = 1;
int cell_width = XSIZE;
int cell_height = YSIZE;
int num_bins = 1;
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
histogram_kernel<<<gridBlock, threadBlock>>>(magnitude,phase,histograms,input_width,input_height,cell_grid_width,cell_grid_height,magnitude_step,phase_step,histograms_step,cell_width,cell_height,num_bins);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
histogram_kernel<<<gridBlock, threadBlock>>>(magnitude,phase,histograms,input_width,input_height,cell_grid_width,cell_grid_height,magnitude_step,phase_step,histograms_step,cell_width,cell_height,num_bins);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
histogram_kernel<<<gridBlock, threadBlock>>>(magnitude,phase,histograms,input_width,input_height,cell_grid_width,cell_grid_height,magnitude_step,phase_step,histograms_step,cell_width,cell_height,num_bins);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}