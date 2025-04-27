#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "create_FF_full_FoXS_surf_grad.cu"
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
    float *FF_table = NULL;
hipMalloc(&FF_table, XSIZE*YSIZE);
float *V = NULL;
hipMalloc(&V, XSIZE*YSIZE);
float c2 = 1;
int *Ele = NULL;
hipMalloc(&Ele, XSIZE*YSIZE);
float *FF_full = NULL;
hipMalloc(&FF_full, XSIZE*YSIZE);
float *surf_grad = NULL;
hipMalloc(&surf_grad, XSIZE*YSIZE);
int num_q = 1;
int num_ele = 1;
int num_atom = 1;
int num_atom2 = 1;
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
create_FF_full_FoXS_surf_grad<<<gridBlock, threadBlock>>>(FF_table,V,c2,Ele,FF_full,surf_grad,num_q,num_ele,num_atom,num_atom2);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
create_FF_full_FoXS_surf_grad<<<gridBlock, threadBlock>>>(FF_table,V,c2,Ele,FF_full,surf_grad,num_q,num_ele,num_atom,num_atom2);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
create_FF_full_FoXS_surf_grad<<<gridBlock, threadBlock>>>(FF_table,V,c2,Ele,FF_full,surf_grad,num_q,num_ele,num_atom,num_atom2);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}