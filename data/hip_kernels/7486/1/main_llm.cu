#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "mandelKernel_llm.cu"
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
    double planoFactorXd = 1;
double planoFactorYd = 1;
double planoVxd = 1;
double planoVyd = 1;
int maxIteracionesd = 1;
unsigned int *coloresd = NULL;
hipMalloc(&coloresd, XSIZE*YSIZE);
int img_width = XSIZE;
int img_height = YSIZE;
int num_processes = 1;
int my_pid = 1;
int rw = 1;
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
mandelKernel<<<gridBlock, threadBlock>>>(planoFactorXd,planoFactorYd,planoVxd,planoVyd,maxIteracionesd,coloresd,img_width,img_height,num_processes,my_pid,rw);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
mandelKernel<<<gridBlock, threadBlock>>>(planoFactorXd,planoFactorYd,planoVxd,planoVyd,maxIteracionesd,coloresd,img_width,img_height,num_processes,my_pid,rw);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
mandelKernel<<<gridBlock, threadBlock>>>(planoFactorXd,planoFactorYd,planoVxd,planoVyd,maxIteracionesd,coloresd,img_width,img_height,num_processes,my_pid,rw);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}