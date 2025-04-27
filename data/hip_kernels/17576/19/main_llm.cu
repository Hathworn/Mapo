#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "force_calc_llm.cu"
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
    float *Force = NULL;
hipMalloc(&Force, XSIZE*YSIZE);
int num_atom = 1;
int num_q = 1;
float *f_ptxc = NULL;
hipMalloc(&f_ptxc, XSIZE*YSIZE);
float *f_ptyc = NULL;
hipMalloc(&f_ptyc, XSIZE*YSIZE);
float *f_ptzc = NULL;
hipMalloc(&f_ptzc, XSIZE*YSIZE);
int num_atom2 = 1;
int num_q2 = 1;
int *Ele = NULL;
hipMalloc(&Ele, XSIZE*YSIZE);
float force_ramp = XSIZE*YSIZE;
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
force_calc<<<gridBlock, threadBlock>>>(Force,num_atom,num_q,f_ptxc,f_ptyc,f_ptzc,num_atom2,num_q2,Ele,force_ramp);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
force_calc<<<gridBlock, threadBlock>>>(Force,num_atom,num_q,f_ptxc,f_ptyc,f_ptzc,num_atom2,num_q2,Ele,force_ramp);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
force_calc<<<gridBlock, threadBlock>>>(Force,num_atom,num_q,f_ptxc,f_ptyc,f_ptzc,num_atom2,num_q2,Ele,force_ramp);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}