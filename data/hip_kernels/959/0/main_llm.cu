#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "inverse_dft_with_w_correction_llm.cu"
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
    double2 *grid = NULL;
hipMalloc(&grid, XSIZE*YSIZE);
size_t grid_pitch = 2;
const double3 *visibilities = NULL;
hipMalloc(&visibilities, XSIZE*YSIZE);
const double2 *vis_intensity = NULL;
hipMalloc(&vis_intensity, XSIZE*YSIZE);
int vis_count = 1;
int batch_count = 2;
int x_offset = 1;
int y_offset = 1;
int render_size = XSIZE*YSIZE;
double cell_size = XSIZE*YSIZE;
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
inverse_dft_with_w_correction<<<gridBlock, threadBlock>>>(grid,grid_pitch,visibilities,vis_intensity,vis_count,batch_count,x_offset,y_offset,render_size,cell_size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
inverse_dft_with_w_correction<<<gridBlock, threadBlock>>>(grid,grid_pitch,visibilities,vis_intensity,vis_count,batch_count,x_offset,y_offset,render_size,cell_size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
inverse_dft_with_w_correction<<<gridBlock, threadBlock>>>(grid,grid_pitch,visibilities,vis_intensity,vis_count,batch_count,x_offset,y_offset,render_size,cell_size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}