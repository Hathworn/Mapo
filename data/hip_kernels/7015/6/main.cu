#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernel_calc_gL_2.cu"
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
    int layer_id = 1;
int *l = NULL;
hipMalloc(&l, XSIZE*YSIZE);
int *s_ext = NULL;
hipMalloc(&s_ext, XSIZE*YSIZE);
float *z_ext_arr = NULL;
hipMalloc(&z_ext_arr, XSIZE*YSIZE);
float *a_ext_arr = NULL;
hipMalloc(&a_ext_arr, XSIZE*YSIZE);
float *t_arr = NULL;
hipMalloc(&t_arr, XSIZE*YSIZE);
float *gjl_ext = NULL;
hipMalloc(&gjl_ext, XSIZE*YSIZE);
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
kernel_calc_gL_2<<<gridBlock, threadBlock>>>(layer_id,l,s_ext,z_ext_arr,a_ext_arr,t_arr,gjl_ext);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernel_calc_gL_2<<<gridBlock, threadBlock>>>(layer_id,l,s_ext,z_ext_arr,a_ext_arr,t_arr,gjl_ext);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernel_calc_gL_2<<<gridBlock, threadBlock>>>(layer_id,l,s_ext,z_ext_arr,a_ext_arr,t_arr,gjl_ext);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}