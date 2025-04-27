#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "back_prop_kernel_batch_llm.cu"
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
    float *device_output = NULL;
hipMalloc(&device_output, XSIZE*YSIZE);
float *inP = NULL;
hipMalloc(&inP, XSIZE*YSIZE);
float *m_hidden = NULL;
hipMalloc(&m_hidden, XSIZE*YSIZE);
float *weights_2 = NULL;
hipMalloc(&weights_2, XSIZE*YSIZE);
float *o_errG = NULL;
hipMalloc(&o_errG, XSIZE*YSIZE);
int nInput = 1;
int nHidden = 1;
int nOutput = 1;
float l_R = 1;
int batchSize = XSIZE*YSIZE;
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
back_prop_kernel_batch<<<gridBlock, threadBlock>>>(device_output,inP,m_hidden,weights_2,o_errG,nInput,nHidden,nOutput,l_R,batchSize);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
back_prop_kernel_batch<<<gridBlock, threadBlock>>>(device_output,inP,m_hidden,weights_2,o_errG,nInput,nHidden,nOutput,l_R,batchSize);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
back_prop_kernel_batch<<<gridBlock, threadBlock>>>(device_output,inP,m_hidden,weights_2,o_errG,nInput,nHidden,nOutput,l_R,batchSize);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}