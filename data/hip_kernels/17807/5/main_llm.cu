#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "frontier_init_kernel_llm.cu"
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
    int *p_frontier_tail_d = NULL;
hipMalloc(&p_frontier_tail_d, XSIZE*YSIZE);
int *c_frontier_tail_d = NULL;
hipMalloc(&c_frontier_tail_d, XSIZE*YSIZE);
int *p_frontier_d = NULL;
hipMalloc(&p_frontier_d, XSIZE*YSIZE);
int *visited_d = NULL;
hipMalloc(&visited_d, XSIZE*YSIZE);
int *label_d = NULL;
hipMalloc(&label_d, XSIZE*YSIZE);
int source = 1;
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
frontier_init_kernel<<<gridBlock, threadBlock>>>(p_frontier_tail_d,c_frontier_tail_d,p_frontier_d,visited_d,label_d,source);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
frontier_init_kernel<<<gridBlock, threadBlock>>>(p_frontier_tail_d,c_frontier_tail_d,p_frontier_d,visited_d,label_d,source);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
frontier_init_kernel<<<gridBlock, threadBlock>>>(p_frontier_tail_d,c_frontier_tail_d,p_frontier_d,visited_d,label_d,source);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}