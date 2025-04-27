#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "uplo_linear_frac.cu"
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
    const int sd = 1;
const int unit = 1;
const int bottom = 1;
const REAL *a = NULL;
hipMalloc(&a, XSIZE*YSIZE);
const int offset_a = 1;
const int ld_a = 1;
const REAL *b = NULL;
hipMalloc(&b, XSIZE*YSIZE);
const int offset_b = 1;
const int ld_b = 1;
const REAL scalea = 1;
const REAL shifta = 1;
const REAL scaleb = 1;
const REAL shiftb = 1;
REAL *c = NULL;
hipMalloc(&c, XSIZE*YSIZE);
const int offset_c = 1;
const int ld_c = 1;
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
uplo_linear_frac<<<gridBlock, threadBlock>>>(sd,unit,bottom,a,offset_a,ld_a,b,offset_b,ld_b,scalea,shifta,scaleb,shiftb,c,offset_c,ld_c);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
uplo_linear_frac<<<gridBlock, threadBlock>>>(sd,unit,bottom,a,offset_a,ld_a,b,offset_b,ld_b,scalea,shifta,scaleb,shiftb,c,offset_c,ld_c);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
uplo_linear_frac<<<gridBlock, threadBlock>>>(sd,unit,bottom,a,offset_a,ld_a,b,offset_b,ld_b,scalea,shifta,scaleb,shiftb,c,offset_c,ld_c);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}