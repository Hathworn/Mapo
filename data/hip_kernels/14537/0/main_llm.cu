#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "subtract_psf_kernel_llm.cu"
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
    double *res_p_trans = NULL;
hipMalloc(&res_p_trans, XSIZE*YSIZE);
const double *psf_p_trans = NULL;
hipMalloc(&psf_p_trans, XSIZE*YSIZE);
const int stopx = 1;
const int stopy = 1;
const int diff = 1;
const int linsize = 1;
const double peak_x_gain = 1;
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
subtract_psf_kernel<<<gridBlock, threadBlock>>>(res_p_trans,psf_p_trans,stopx,stopy,diff,linsize,peak_x_gain);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
subtract_psf_kernel<<<gridBlock, threadBlock>>>(res_p_trans,psf_p_trans,stopx,stopy,diff,linsize,peak_x_gain);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
subtract_psf_kernel<<<gridBlock, threadBlock>>>(res_p_trans,psf_p_trans,stopx,stopy,diff,linsize,peak_x_gain);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}