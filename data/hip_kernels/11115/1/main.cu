#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "inject_Source.cu"
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
    int id = 1;
int ii = 1;
float *p = NULL;
hipMalloc(&p, XSIZE*YSIZE);
float *_tableS = NULL;
hipMalloc(&_tableS, XSIZE*YSIZE);
float *_sourceV = NULL;
hipMalloc(&_sourceV, XSIZE*YSIZE);
int *_locsS = NULL;
hipMalloc(&_locsS, XSIZE*YSIZE);
int _dir = 1;
int _jt = 1;
int _ntSrc = 1;
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
inject_Source<<<gridBlock, threadBlock>>>(id,ii,p,_tableS,_sourceV,_locsS,_dir,_jt,_ntSrc);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
inject_Source<<<gridBlock, threadBlock>>>(id,ii,p,_tableS,_sourceV,_locsS,_dir,_jt,_ntSrc);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
inject_Source<<<gridBlock, threadBlock>>>(id,ii,p,_tableS,_sourceV,_locsS,_dir,_jt,_ntSrc);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}