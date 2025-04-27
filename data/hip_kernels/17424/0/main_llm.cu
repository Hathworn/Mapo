#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "mvm_gpu_llm.cu"
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
    double *A_cuda = NULL;
hipMalloc(&A_cuda, XSIZE*YSIZE);
double *X_cuda = NULL;
hipMalloc(&X_cuda, XSIZE*YSIZE);
double *Y_cuda = NULL;
hipMalloc(&Y_cuda, XSIZE*YSIZE);
int *m_locals_cuda = NULL;
hipMalloc(&m_locals_cuda, XSIZE*YSIZE);
int *A_all_pos_cuda = NULL;
hipMalloc(&A_all_pos_cuda, XSIZE*YSIZE);
int n = XSIZE*YSIZE;
int nthreads = 1;
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
mvm_gpu<<<gridBlock, threadBlock>>>(A_cuda,X_cuda,Y_cuda,m_locals_cuda,A_all_pos_cuda,n,nthreads);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
mvm_gpu<<<gridBlock, threadBlock>>>(A_cuda,X_cuda,Y_cuda,m_locals_cuda,A_all_pos_cuda,n,nthreads);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
mvm_gpu<<<gridBlock, threadBlock>>>(A_cuda,X_cuda,Y_cuda,m_locals_cuda,A_all_pos_cuda,n,nthreads);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}