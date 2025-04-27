#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kEltwiseL2SVMCost_llm.cu"
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
    float *ydata = NULL;
hipMalloc(&ydata, XSIZE*YSIZE);
float *ldata = NULL;
hipMalloc(&ldata, XSIZE*YSIZE);
float *pre_grad = NULL;
hipMalloc(&pre_grad, XSIZE*YSIZE);
float *all_cost = NULL;
hipMalloc(&all_cost, XSIZE*YSIZE);
float a = 2;
float b = 2;
int numCases = 1;
int numTasks = 1;
int per_thread_case = 1;
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
kEltwiseL2SVMCost<<<gridBlock, threadBlock>>>(ydata,ldata,pre_grad,all_cost,a,b,numCases,numTasks,per_thread_case);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kEltwiseL2SVMCost<<<gridBlock, threadBlock>>>(ydata,ldata,pre_grad,all_cost,a,b,numCases,numTasks,per_thread_case);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kEltwiseL2SVMCost<<<gridBlock, threadBlock>>>(ydata,ldata,pre_grad,all_cost,a,b,numCases,numTasks,per_thread_case);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}