#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "ac_kernel1.cu"
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
    int *d_state_transition = NULL;
hipMalloc(&d_state_transition, XSIZE*YSIZE);
unsigned int *d_state_supply = NULL;
hipMalloc(&d_state_supply, XSIZE*YSIZE);
unsigned int *d_state_final = NULL;
hipMalloc(&d_state_final, XSIZE*YSIZE);
unsigned char *d_text = NULL;
hipMalloc(&d_text, XSIZE*YSIZE);
unsigned int *d_out = NULL;
hipMalloc(&d_out, XSIZE*YSIZE);
size_t pitch = 2;
int m = 2;
int n = XSIZE*YSIZE;
int p_size = XSIZE*YSIZE;
int alphabet = 2;
int numBlocks = 1;
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
ac_kernel1<<<gridBlock, threadBlock>>>(d_state_transition,d_state_supply,d_state_final,d_text,d_out,pitch,m,n,p_size,alphabet,numBlocks);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
ac_kernel1<<<gridBlock, threadBlock>>>(d_state_transition,d_state_supply,d_state_final,d_text,d_out,pitch,m,n,p_size,alphabet,numBlocks);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
ac_kernel1<<<gridBlock, threadBlock>>>(d_state_transition,d_state_supply,d_state_final,d_text,d_out,pitch,m,n,p_size,alphabet,numBlocks);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}