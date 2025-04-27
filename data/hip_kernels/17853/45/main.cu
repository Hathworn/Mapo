#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "update_kernel.cu"
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
    uint32_t hash_value_index_count_num = 1;
int embedding_vec_size = XSIZE*YSIZE;
const size_t *deltaw_hash_value_index = NULL;
hipMalloc(&deltaw_hash_value_index, XSIZE*YSIZE);
const float *deltaw = NULL;
hipMalloc(&deltaw, XSIZE*YSIZE);
float *hash_table_value = NULL;
hipMalloc(&hash_table_value, XSIZE*YSIZE);
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
update_kernel<<<gridBlock, threadBlock>>>(hash_value_index_count_num,embedding_vec_size,deltaw_hash_value_index,deltaw,hash_table_value);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
update_kernel<<<gridBlock, threadBlock>>>(hash_value_index_count_num,embedding_vec_size,deltaw_hash_value_index,deltaw,hash_table_value);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
update_kernel<<<gridBlock, threadBlock>>>(hash_value_index_count_num,embedding_vec_size,deltaw_hash_value_index,deltaw,hash_table_value);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}