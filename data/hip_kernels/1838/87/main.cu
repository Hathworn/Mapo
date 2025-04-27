#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "normal_eqs_flow_GPU.cu"
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
    float *d_CO = NULL;
hipMalloc(&d_CO, XSIZE*YSIZE);
const float2 *d_flow_compact = NULL;
hipMalloc(&d_flow_compact, XSIZE*YSIZE);
const float *d_Zbuffer_flow_compact = NULL;
hipMalloc(&d_Zbuffer_flow_compact, XSIZE*YSIZE);
const int *d_ind_flow_Zbuffer = NULL;
hipMalloc(&d_ind_flow_Zbuffer, XSIZE*YSIZE);
float fx = 1;
float fy = 1;
float ox = 1;
float oy = 1;
int n_rows = 1;
int n_cols = 1;
const int *d_n_values_flow = NULL;
hipMalloc(&d_n_values_flow, XSIZE*YSIZE);
const int *d_start_ind_flow = NULL;
hipMalloc(&d_start_ind_flow, XSIZE*YSIZE);
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
normal_eqs_flow_GPU<<<gridBlock, threadBlock>>>(d_CO,d_flow_compact,d_Zbuffer_flow_compact,d_ind_flow_Zbuffer,fx,fy,ox,oy,n_rows,n_cols,d_n_values_flow,d_start_ind_flow);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
normal_eqs_flow_GPU<<<gridBlock, threadBlock>>>(d_CO,d_flow_compact,d_Zbuffer_flow_compact,d_ind_flow_Zbuffer,fx,fy,ox,oy,n_rows,n_cols,d_n_values_flow,d_start_ind_flow);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
normal_eqs_flow_GPU<<<gridBlock, threadBlock>>>(d_CO,d_flow_compact,d_Zbuffer_flow_compact,d_ind_flow_Zbuffer,fx,fy,ox,oy,n_rows,n_cols,d_n_values_flow,d_start_ind_flow);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}