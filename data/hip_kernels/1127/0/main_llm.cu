#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "update_mean_llm.cu"
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
    double *pressure_mean_d = NULL;
hipMalloc(&pressure_mean_d, XSIZE*YSIZE);
double *pressure_d = NULL;
hipMalloc(&pressure_d, XSIZE*YSIZE);
double *Rho_mean_d = NULL;
hipMalloc(&Rho_mean_d, XSIZE*YSIZE);
double *Rho_d = NULL;
hipMalloc(&Rho_d, XSIZE*YSIZE);
double *Mh_mean_d = NULL;
hipMalloc(&Mh_mean_d, XSIZE*YSIZE);
double *Mh_d = NULL;
hipMalloc(&Mh_d, XSIZE*YSIZE);
double *Wh_mean_d = NULL;
hipMalloc(&Wh_mean_d, XSIZE*YSIZE);
double *Wh_d = NULL;
hipMalloc(&Wh_d, XSIZE*YSIZE);
int n_since_out = 1;
int num = 1;
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
update_mean<<<gridBlock, threadBlock>>>(pressure_mean_d,pressure_d,Rho_mean_d,Rho_d,Mh_mean_d,Mh_d,Wh_mean_d,Wh_d,n_since_out,num);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
update_mean<<<gridBlock, threadBlock>>>(pressure_mean_d,pressure_d,Rho_mean_d,Rho_d,Mh_mean_d,Mh_d,Wh_mean_d,Wh_d,n_since_out,num);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
update_mean<<<gridBlock, threadBlock>>>(pressure_mean_d,pressure_d,Rho_mean_d,Rho_d,Mh_mean_d,Mh_d,Wh_mean_d,Wh_d,n_since_out,num);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}