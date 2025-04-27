#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cumo_iter_copy_bytes_kernel.cu"
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
    char *p1 = NULL;
hipMalloc(&p1, XSIZE*YSIZE);
char *p2 = NULL;
hipMalloc(&p2, XSIZE*YSIZE);
ssize_t s1 = 1;
ssize_t s2 = 1;
size_t *idx1 = NULL;
hipMalloc(&idx1, XSIZE*YSIZE);
size_t *idx2 = NULL;
hipMalloc(&idx2, XSIZE*YSIZE);
uint64_t n = XSIZE*YSIZE;
ssize_t elmsz = 1;
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
cumo_iter_copy_bytes_kernel<<<gridBlock, threadBlock>>>(p1,p2,s1,s2,idx1,idx2,n,elmsz);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cumo_iter_copy_bytes_kernel<<<gridBlock, threadBlock>>>(p1,p2,s1,s2,idx1,idx2,n,elmsz);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cumo_iter_copy_bytes_kernel<<<gridBlock, threadBlock>>>(p1,p2,s1,s2,idx1,idx2,n,elmsz);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}