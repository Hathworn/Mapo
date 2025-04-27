#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "input_shortcut_kernel.cu"
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
    float *in = NULL;
hipMalloc(&in, XSIZE*YSIZE);
int size = XSIZE*YSIZE;
int minw = 1;
int minh = 1;
int minc = 1;
int stride = 2;
int sample = 1;
int batch = 2;
int w1 = 1;
int h1 = 1;
int c1 = 1;
float *add = NULL;
hipMalloc(&add, XSIZE*YSIZE);
int w2 = 1;
int h2 = 1;
int c2 = 1;
float *out = NULL;
hipMalloc(&out, XSIZE*YSIZE);
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
input_shortcut_kernel<<<gridBlock, threadBlock>>>(in,size,minw,minh,minc,stride,sample,batch,w1,h1,c1,add,w2,h2,c2,out);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
input_shortcut_kernel<<<gridBlock, threadBlock>>>(in,size,minw,minh,minc,stride,sample,batch,w1,h1,c1,add,w2,h2,c2,out);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
input_shortcut_kernel<<<gridBlock, threadBlock>>>(in,size,minw,minh,minc,stride,sample,batch,w1,h1,c1,add,w2,h2,c2,out);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}