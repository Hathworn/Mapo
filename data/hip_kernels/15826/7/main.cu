#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "compute_Gamma_kernel.cu"
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
    double *Gamma = NULL;
hipMalloc(&Gamma, XSIZE*YSIZE);
int Gamma_n = 1;
int Gamma_ld = 1;
double *N = NULL;
hipMalloc(&N, XSIZE*YSIZE);
int N_r = 1;
int N_c = 1;
int N_ld = 1;
double *G = NULL;
hipMalloc(&G, XSIZE*YSIZE);
int G_r = 1;
int G_c = 1;
int G_ld = 1;
int *random_vertex_vector = NULL;
hipMalloc(&random_vertex_vector, XSIZE*YSIZE);
double *exp_V = NULL;
hipMalloc(&exp_V, XSIZE*YSIZE);
double *exp_delta_V = NULL;
hipMalloc(&exp_delta_V, XSIZE*YSIZE);
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
compute_Gamma_kernel<<<gridBlock, threadBlock>>>(Gamma,Gamma_n,Gamma_ld,N,N_r,N_c,N_ld,G,G_r,G_c,G_ld,random_vertex_vector,exp_V,exp_delta_V);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
compute_Gamma_kernel<<<gridBlock, threadBlock>>>(Gamma,Gamma_n,Gamma_ld,N,N_r,N_c,N_ld,G,G_r,G_c,G_ld,random_vertex_vector,exp_V,exp_delta_V);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
compute_Gamma_kernel<<<gridBlock, threadBlock>>>(Gamma,Gamma_n,Gamma_ld,N,N_r,N_c,N_ld,G,G_r,G_c,G_ld,random_vertex_vector,exp_V,exp_delta_V);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}