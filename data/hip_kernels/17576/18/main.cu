#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "sum_S_calc.cu"
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
    float *S_calcc = NULL;
hipMalloc(&S_calcc, XSIZE*YSIZE);
float *f_ptxc = NULL;
hipMalloc(&f_ptxc, XSIZE*YSIZE);
float *f_ptyc = NULL;
hipMalloc(&f_ptyc, XSIZE*YSIZE);
float *f_ptzc = NULL;
hipMalloc(&f_ptzc, XSIZE*YSIZE);
float *S_calc = NULL;
hipMalloc(&S_calc, XSIZE*YSIZE);
float *Aq = NULL;
hipMalloc(&Aq, XSIZE*YSIZE);
float *q_S_ref_dS = NULL;
hipMalloc(&q_S_ref_dS, XSIZE*YSIZE);
int num_q = 1;
int num_atom = 1;
int num_atom2 = 1;
float alpha = 2;
float k_chi = 1;
float *sigma2 = NULL;
hipMalloc(&sigma2, XSIZE*YSIZE);
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
sum_S_calc<<<gridBlock, threadBlock>>>(S_calcc,f_ptxc,f_ptyc,f_ptzc,S_calc,Aq,q_S_ref_dS,num_q,num_atom,num_atom2,alpha,k_chi,sigma2);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
sum_S_calc<<<gridBlock, threadBlock>>>(S_calcc,f_ptxc,f_ptyc,f_ptzc,S_calc,Aq,q_S_ref_dS,num_q,num_atom,num_atom2,alpha,k_chi,sigma2);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
sum_S_calc<<<gridBlock, threadBlock>>>(S_calcc,f_ptxc,f_ptyc,f_ptzc,S_calc,Aq,q_S_ref_dS,num_q,num_atom,num_atom2,alpha,k_chi,sigma2);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}