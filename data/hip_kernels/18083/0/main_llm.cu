#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "conv_llm.cu"
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
    fmap *input = NULL;
hipMalloc(&input, XSIZE*YSIZE);
int *ip = NULL;
hipMalloc(&ip, XSIZE*YSIZE);
int *weights = NULL;
hipMalloc(&weights, XSIZE*YSIZE);
int R = 1;
int S = 1;
fmap *output = NULL;
hipMalloc(&output, XSIZE*YSIZE);
int Sx = 1;
int Sy = 1;
int *op = NULL;
hipMalloc(&op, XSIZE*YSIZE);
int Px = 1;
int Py = 1;
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
conv<<<gridBlock, threadBlock>>>(input,ip,weights,R,S,output,Sx,Sy,op,Px,Py);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
conv<<<gridBlock, threadBlock>>>(input,ip,weights,R,S,output,Sx,Sy,op,Px,Py);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
conv<<<gridBlock, threadBlock>>>(input,ip,weights,R,S,output,Sx,Sy,op,Px,Py);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}