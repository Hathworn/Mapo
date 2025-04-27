#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "sd_t_s1_1_kernel_llm.cu"
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
    size_t h1d = 1;
size_t h2d = 1;
size_t h3d = 1;
size_t p4d = 1;
size_t p6d = 1;
size_t p4ld_t2 = 1;
size_t h1ld_t2 = 1;
size_t h3ld_v2 = 1;
size_t h2ld_v2 = 1;
size_t p6ld_v2 = 1;
size_t h3ld_t3 = 1;
size_t h2ld_t3 = 1;
size_t h1ld_t3 = 1;
size_t p6ld_t3 = 1;
size_t p4ld_t3 = 1;
double *t2_d = NULL;
hipMalloc(&t2_d, XSIZE*YSIZE);
double *v2_d = NULL;
hipMalloc(&v2_d, XSIZE*YSIZE);
size_t p4 = 1;
size_t total_x = 1;
double *t3d = NULL;
hipMalloc(&t3d, XSIZE*YSIZE);
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
sd_t_s1_1_kernel<<<gridBlock, threadBlock>>>(h1d,h2d,h3d,p4d,p6d,p4ld_t2,h1ld_t2,h3ld_v2,h2ld_v2,p6ld_v2,h3ld_t3,h2ld_t3,h1ld_t3,p6ld_t3,p4ld_t3,t2_d,v2_d,p4,total_x,t3d);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
sd_t_s1_1_kernel<<<gridBlock, threadBlock>>>(h1d,h2d,h3d,p4d,p6d,p4ld_t2,h1ld_t2,h3ld_v2,h2ld_v2,p6ld_v2,h3ld_t3,h2ld_t3,h1ld_t3,p6ld_t3,p4ld_t3,t2_d,v2_d,p4,total_x,t3d);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
sd_t_s1_1_kernel<<<gridBlock, threadBlock>>>(h1d,h2d,h3d,p4d,p6d,p4ld_t2,h1ld_t2,h3ld_v2,h2ld_v2,p6ld_v2,h3ld_t3,h2ld_t3,h1ld_t3,p6ld_t3,p4ld_t3,t2_d,v2_d,p4,total_x,t3d);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}