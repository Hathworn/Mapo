#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "final_map_index_to_prefix.cu"
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
    uint8_t *hashes = NULL;
hipMalloc(&hashes, XSIZE*YSIZE);
uint32_t *sort_indices = NULL;
hipMalloc(&sort_indices, XSIZE*YSIZE);
uint32_t *off_map = NULL;
hipMalloc(&off_map, XSIZE*YSIZE);
uint32_t *comb_count = NULL;
hipMalloc(&comb_count, XSIZE*YSIZE);
uint32_t *comb_sum = NULL;
hipMalloc(&comb_sum, XSIZE*YSIZE);
uint32_t *comb_prefix = NULL;
hipMalloc(&comb_prefix, XSIZE*YSIZE);
uint32_t r = 1;
uint32_t size = XSIZE*YSIZE;
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
final_map_index_to_prefix<<<gridBlock, threadBlock>>>(hashes,sort_indices,off_map,comb_count,comb_sum,comb_prefix,r,size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
final_map_index_to_prefix<<<gridBlock, threadBlock>>>(hashes,sort_indices,off_map,comb_count,comb_sum,comb_prefix,r,size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
final_map_index_to_prefix<<<gridBlock, threadBlock>>>(hashes,sort_indices,off_map,comb_count,comb_sum,comb_prefix,r,size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}