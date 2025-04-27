#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "__ADAGrad.cu"
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
int ncols = 1;
float *mm = NULL;
hipMalloc(&mm, XSIZE*YSIZE);
float *um = NULL;
hipMalloc(&um, XSIZE*YSIZE);
float *ssq = NULL;
hipMalloc(&ssq, XSIZE*YSIZE);
float *mask = NULL;
hipMalloc(&mask, XSIZE*YSIZE);
int maskr = 1;
float nw = 1;
float *ve = NULL;
hipMalloc(&ve, XSIZE*YSIZE);
int nve = 1;
float *ts = NULL;
hipMalloc(&ts, XSIZE*YSIZE);
int nts = 1;
float *lr = NULL;
hipMalloc(&lr, XSIZE*YSIZE);
int nlr = 1;
float langevin = 1;
float eps = 1;
int doupdate = 1;
curandState *rstates = NULL;
hipMalloc(&rstates, XSIZE*YSIZE);
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
__ADAGrad<<<gridBlock, threadBlock>>>(nrows,ncols,mm,um,ssq,mask,maskr,nw,ve,nve,ts,nts,lr,nlr,langevin,eps,doupdate,rstates);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
__ADAGrad<<<gridBlock, threadBlock>>>(nrows,ncols,mm,um,ssq,mask,maskr,nw,ve,nve,ts,nts,lr,nlr,langevin,eps,doupdate,rstates);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
__ADAGrad<<<gridBlock, threadBlock>>>(nrows,ncols,mm,um,ssq,mask,maskr,nw,ve,nve,ts,nts,lr,nlr,langevin,eps,doupdate,rstates);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}