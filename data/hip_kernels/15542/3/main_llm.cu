#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "Kernel_polimoniale_llm.cu"
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
    float *Vd = NULL;
hipMalloc(&Vd, XSIZE*YSIZE);
float *Ris = NULL;
hipMalloc(&Ris, XSIZE*YSIZE);
int N = XSIZE*YSIZE;
int C = 2;
int dim_indici = 1;
int *ind = NULL;
hipMalloc(&ind, XSIZE*YSIZE);
int *Vp = NULL;
hipMalloc(&Vp, XSIZE*YSIZE);
int *Vnp = NULL;
hipMalloc(&Vnp, XSIZE*YSIZE);
int nr_max_val = 1;
int s = 1;
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
Kernel_polimoniale<<<gridBlock, threadBlock>>>(Vd,Ris,N,C,dim_indici,ind,Vp,Vnp,nr_max_val,s);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
Kernel_polimoniale<<<gridBlock, threadBlock>>>(Vd,Ris,N,C,dim_indici,ind,Vp,Vnp,nr_max_val,s);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
Kernel_polimoniale<<<gridBlock, threadBlock>>>(Vd,Ris,N,C,dim_indici,ind,Vp,Vnp,nr_max_val,s);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}