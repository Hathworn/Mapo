#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "sd_t_s1_6_kernel_llm.cu"
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
    int h1d = 1;
int h2d = 1;
int h3d = 1;
int p4d = 1;
int p5d = 1;
int p6d = 1;
int p4ld_t2 = 1;
int h1ld_t2 = 1;
int h3ld_v2 = 1;
int h2ld_v2 = 1;
int p6ld_v2 = 1;
int p5ld_v2 = 1;
int h3ld_t3 = 1;
int h2ld_t3 = 1;
int h1ld_t3 = 1;
int p6ld_t3 = 1;
int p5ld_t3 = 1;
int p4ld_t3 = 1;
double *t3d = NULL;
hipMalloc(&t3d, XSIZE*YSIZE);
double *t2_d = NULL;
hipMalloc(&t2_d, XSIZE*YSIZE);
double *v2_d = NULL;
hipMalloc(&v2_d, XSIZE*YSIZE);
int p4 = 1;
int total_x = 1;
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
sd_t_s1_6_kernel<<<gridBlock, threadBlock>>>(h1d,h2d,h3d,p4d,p5d,p6d,p4ld_t2,h1ld_t2,h3ld_v2,h2ld_v2,p6ld_v2,p5ld_v2,h3ld_t3,h2ld_t3,h1ld_t3,p6ld_t3,p5ld_t3,p4ld_t3,t3d,t2_d,v2_d,p4,total_x);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
sd_t_s1_6_kernel<<<gridBlock, threadBlock>>>(h1d,h2d,h3d,p4d,p5d,p6d,p4ld_t2,h1ld_t2,h3ld_v2,h2ld_v2,p6ld_v2,p5ld_v2,h3ld_t3,h2ld_t3,h1ld_t3,p6ld_t3,p5ld_t3,p4ld_t3,t3d,t2_d,v2_d,p4,total_x);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
sd_t_s1_6_kernel<<<gridBlock, threadBlock>>>(h1d,h2d,h3d,p4d,p5d,p6d,p4ld_t2,h1ld_t2,h3ld_v2,h2ld_v2,p6ld_v2,p5ld_v2,h3ld_t3,h2ld_t3,h1ld_t3,p6ld_t3,p5ld_t3,p4ld_t3,t3d,t2_d,v2_d,p4,total_x);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}