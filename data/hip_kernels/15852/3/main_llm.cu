#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "_calculate_edge_num_llm.cu"
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
    long *edge_num = NULL;
hipMalloc(&edge_num, XSIZE*YSIZE);
const long *edge_num_sum = NULL;
hipMalloc(&edge_num_sum, XSIZE*YSIZE);
const long *edge_idx_sort = NULL;
hipMalloc(&edge_idx_sort, XSIZE*YSIZE);
const int b = 1;
const int n = 1;
const int orig_p_num = 1;
const long p_num = 1;
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
_calculate_edge_num<<<gridBlock, threadBlock>>>(edge_num,edge_num_sum,edge_idx_sort,b,n,orig_p_num,p_num);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
_calculate_edge_num<<<gridBlock, threadBlock>>>(edge_num,edge_num_sum,edge_idx_sort,b,n,orig_p_num,p_num);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
_calculate_edge_num<<<gridBlock, threadBlock>>>(edge_num,edge_num_sum,edge_idx_sort,b,n,orig_p_num,p_num);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}