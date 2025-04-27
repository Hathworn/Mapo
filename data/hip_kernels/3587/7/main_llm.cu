#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "update_e_llm.cu"
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
    int objs = 1;
double *e = NULL;
hipMalloc(&e, XSIZE*YSIZE);
double *kval = NULL;
hipMalloc(&kval, XSIZE*YSIZE);
double b_old = 1;
double b_new = 1;
int i = 1;
int j = 1;
int yi = 1;
int yj = 1;
double ai_old = 1;
double ai_new = 1;
double aj_old = 1;
double aj_new = 1;
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
update_e<<<gridBlock, threadBlock>>>(objs,e,kval,b_old,b_new,i,j,yi,yj,ai_old,ai_new,aj_old,aj_new);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
update_e<<<gridBlock, threadBlock>>>(objs,e,kval,b_old,b_new,i,j,yi,yj,ai_old,ai_new,aj_old,aj_new);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
update_e<<<gridBlock, threadBlock>>>(objs,e,kval,b_old,b_new,i,j,yi,yj,ai_old,ai_new,aj_old,aj_new);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}