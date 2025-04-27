#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "field_summary_llm.cu"
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
    const int x_inner = 1;
const int y_inner = 1;
const int halo_depth = 1;
const double *volume = NULL;
hipMalloc(&volume, XSIZE*YSIZE);
const double *density = NULL;
hipMalloc(&density, XSIZE*YSIZE);
const double *energy0 = NULL;
hipMalloc(&energy0, XSIZE*YSIZE);
const double *u = NULL;
hipMalloc(&u, XSIZE*YSIZE);
double *vol_out = NULL;
hipMalloc(&vol_out, XSIZE*YSIZE);
double *mass_out = NULL;
hipMalloc(&mass_out, XSIZE*YSIZE);
double *ie_out = NULL;
hipMalloc(&ie_out, XSIZE*YSIZE);
double *temp_out = NULL;
hipMalloc(&temp_out, XSIZE*YSIZE);
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
field_summary<<<gridBlock, threadBlock>>>(x_inner,y_inner,halo_depth,volume,density,energy0,u,vol_out,mass_out,ie_out,temp_out);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
field_summary<<<gridBlock, threadBlock>>>(x_inner,y_inner,halo_depth,volume,density,energy0,u,vol_out,mass_out,ie_out,temp_out);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
field_summary<<<gridBlock, threadBlock>>>(x_inner,y_inner,halo_depth,volume,density,energy0,u,vol_out,mass_out,ie_out,temp_out);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}