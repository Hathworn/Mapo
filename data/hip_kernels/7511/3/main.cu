#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "format_nlist_fill_b_se_a.cu"
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
    int *nlist = NULL;
hipMalloc(&nlist, XSIZE*YSIZE);
const int nlist_size = 1;
const int nloc = 1;
const int *jrange = NULL;
hipMalloc(&jrange, XSIZE*YSIZE);
const int *jlist = NULL;
hipMalloc(&jlist, XSIZE*YSIZE);
int_64 *key = NULL;
hipMalloc(&key, XSIZE*YSIZE);
const int *sec_a = NULL;
hipMalloc(&sec_a, XSIZE*YSIZE);
const int sec_a_size = 1;
int *nei_iter_dev = NULL;
hipMalloc(&nei_iter_dev, XSIZE*YSIZE);
const int MAGIC_NUMBER = 1;
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
format_nlist_fill_b_se_a<<<gridBlock, threadBlock>>>(nlist,nlist_size,nloc,jrange,jlist,key,sec_a,sec_a_size,nei_iter_dev,MAGIC_NUMBER);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
format_nlist_fill_b_se_a<<<gridBlock, threadBlock>>>(nlist,nlist_size,nloc,jrange,jlist,key,sec_a,sec_a_size,nei_iter_dev,MAGIC_NUMBER);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
format_nlist_fill_b_se_a<<<gridBlock, threadBlock>>>(nlist,nlist_size,nloc,jrange,jlist,key,sec_a,sec_a_size,nei_iter_dev,MAGIC_NUMBER);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}