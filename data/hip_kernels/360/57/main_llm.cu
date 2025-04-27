#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "packcoo_kernel_llm.cu"
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
    int num_entries = 1;
int *row_indices = NULL;
hipMalloc(&row_indices, XSIZE*YSIZE);
int *column_indices = NULL;
hipMalloc(&column_indices, XSIZE*YSIZE);
int *aggridx = NULL;
hipMalloc(&aggridx, XSIZE*YSIZE);
int *partidx = NULL;
hipMalloc(&partidx, XSIZE*YSIZE);
int *partlabel = NULL;
hipMalloc(&partlabel, XSIZE*YSIZE);
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
packcoo_kernel<<<gridBlock, threadBlock>>>(num_entries,row_indices,column_indices,aggridx,partidx,partlabel);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
packcoo_kernel<<<gridBlock, threadBlock>>>(num_entries,row_indices,column_indices,aggridx,partidx,partlabel);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
packcoo_kernel<<<gridBlock, threadBlock>>>(num_entries,row_indices,column_indices,aggridx,partidx,partlabel);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}