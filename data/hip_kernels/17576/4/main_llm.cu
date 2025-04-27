#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "FF_calc_llm.cu"
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
    float *q_S_ref_dS = NULL;
hipMalloc(&q_S_ref_dS, XSIZE*YSIZE);
float *WK = NULL;
hipMalloc(&WK, XSIZE*YSIZE);
float *vdW = NULL;
hipMalloc(&vdW, XSIZE*YSIZE);
int num_q = 1;
int num_ele = 1;
float c1 = 1;
float r_m = 1;
float *FF_table = NULL;
hipMalloc(&FF_table, XSIZE*YSIZE);
float rho = 1;
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
FF_calc<<<gridBlock, threadBlock>>>(q_S_ref_dS,WK,vdW,num_q,num_ele,c1,r_m,FF_table,rho);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
FF_calc<<<gridBlock, threadBlock>>>(q_S_ref_dS,WK,vdW,num_q,num_ele,c1,r_m,FF_table,rho);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
FF_calc<<<gridBlock, threadBlock>>>(q_S_ref_dS,WK,vdW,num_q,num_ele,c1,r_m,FF_table,rho);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}