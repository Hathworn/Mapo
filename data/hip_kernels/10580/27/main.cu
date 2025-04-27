#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "__pairmult2.cu"
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
    int nrows = 1;
int bncols = 1;
int brows1 = 1;
int brows2 = 1;
float *A = NULL;
hipMalloc(&A, XSIZE*YSIZE);
int lda = 1;
float *A2 = NULL;
hipMalloc(&A2, XSIZE*YSIZE);
int lda2 = 1;
float *Bdata = NULL;
hipMalloc(&Bdata, XSIZE*YSIZE);
int *Bir = NULL;
hipMalloc(&Bir, XSIZE*YSIZE);
int *Bjc = NULL;
hipMalloc(&Bjc, XSIZE*YSIZE);
int broff = 1;
int bcoff = 1;
float *C = NULL;
hipMalloc(&C, XSIZE*YSIZE);
int ldc = 1;
int transpose = 1;
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
__pairmult2<<<gridBlock, threadBlock>>>(nrows,bncols,brows1,brows2,A,lda,A2,lda2,Bdata,Bir,Bjc,broff,bcoff,C,ldc,transpose);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
__pairmult2<<<gridBlock, threadBlock>>>(nrows,bncols,brows1,brows2,A,lda,A2,lda2,Bdata,Bir,Bjc,broff,bcoff,C,ldc,transpose);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
__pairmult2<<<gridBlock, threadBlock>>>(nrows,bncols,brows1,brows2,A,lda,A2,lda2,Bdata,Bir,Bjc,broff,bcoff,C,ldc,transpose);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}