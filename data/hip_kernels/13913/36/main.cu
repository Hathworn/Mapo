#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "__fillToInds4D.cu"
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
    double A = 2;
double *B = NULL;
hipMalloc(&B, XSIZE*YSIZE);
int ldb = 1;
int rdb = 1;
int tdb = 1;
int *I = NULL;
hipMalloc(&I, XSIZE*YSIZE);
int nrows = 1;
int *J = NULL;
hipMalloc(&J, XSIZE*YSIZE);
int ncols = 1;
int *K = NULL;
hipMalloc(&K, XSIZE*YSIZE);
int nk = 1;
int *L = NULL;
hipMalloc(&L, XSIZE*YSIZE);
int nl = 1;
int ntk = 1;
int nbk = 1;
int ntl = 1;
int nbl = 1;
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
__fillToInds4D<<<gridBlock, threadBlock>>>(A,B,ldb,rdb,tdb,I,nrows,J,ncols,K,nk,L,nl,ntk,nbk,ntl,nbl);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
__fillToInds4D<<<gridBlock, threadBlock>>>(A,B,ldb,rdb,tdb,I,nrows,J,ncols,K,nk,L,nl,ntk,nbk,ntl,nbl);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
__fillToInds4D<<<gridBlock, threadBlock>>>(A,B,ldb,rdb,tdb,I,nrows,J,ncols,K,nk,L,nl,ntk,nbk,ntl,nbl);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}