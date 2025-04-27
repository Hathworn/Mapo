#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "softmax_loss_kernel_llm.cu"
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
    float *reduced_loss = NULL;
hipMalloc(&reduced_loss, XSIZE*YSIZE);
float *predict = NULL;
hipMalloc(&predict, XSIZE*YSIZE);
float *target = NULL;
hipMalloc(&target, XSIZE*YSIZE);
float *workspace = NULL;
hipMalloc(&workspace, XSIZE*YSIZE);
int batch_size = XSIZE*YSIZE;
int num_outputs = 1;
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
softmax_loss_kernel<<<gridBlock, threadBlock>>>(reduced_loss,predict,target,workspace,batch_size,num_outputs);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
softmax_loss_kernel<<<gridBlock, threadBlock>>>(reduced_loss,predict,target,workspace,batch_size,num_outputs);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
softmax_loss_kernel<<<gridBlock, threadBlock>>>(reduced_loss,predict,target,workspace,batch_size,num_outputs);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}