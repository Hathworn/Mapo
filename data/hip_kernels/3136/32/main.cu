#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cudaclaw5_update_q_cuda.cu"
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
    int mbc = 1;
double dtdx = 1;
double dtdy = 1;
double *qold = NULL;
hipMalloc(&qold, XSIZE*YSIZE);
double *fm = NULL;
hipMalloc(&fm, XSIZE*YSIZE);
double *fp = NULL;
hipMalloc(&fp, XSIZE*YSIZE);
double *gm = NULL;
hipMalloc(&gm, XSIZE*YSIZE);
double *gp = NULL;
hipMalloc(&gp, XSIZE*YSIZE);
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
cudaclaw5_update_q_cuda<<<gridBlock, threadBlock>>>(mbc,dtdx,dtdy,qold,fm,fp,gm,gp);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cudaclaw5_update_q_cuda<<<gridBlock, threadBlock>>>(mbc,dtdx,dtdy,qold,fm,fp,gm,gp);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cudaclaw5_update_q_cuda<<<gridBlock, threadBlock>>>(mbc,dtdx,dtdy,qold,fm,fp,gm,gp);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}