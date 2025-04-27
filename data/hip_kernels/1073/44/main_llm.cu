#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kMultiSoftmaxCost_llm.cu"
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
    float *probs = NULL;
hipMalloc(&probs, XSIZE*YSIZE);
float *labels = NULL;
hipMalloc(&labels, XSIZE*YSIZE);
float *maxProbs = NULL;
hipMalloc(&maxProbs, XSIZE*YSIZE);
float *labelLogProbs = NULL;
hipMalloc(&labelLogProbs, XSIZE*YSIZE);
float *correctProbs = NULL;
hipMalloc(&correctProbs, XSIZE*YSIZE);
float *top5Probs = NULL;
hipMalloc(&top5Probs, XSIZE*YSIZE);
const int numCases = 1;
const int numOut = 1;
const int setSize = 1;
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
kMultiSoftmaxCost<<<gridBlock, threadBlock>>>(probs,labels,maxProbs,labelLogProbs,correctProbs,top5Probs,numCases,numOut,setSize);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kMultiSoftmaxCost<<<gridBlock, threadBlock>>>(probs,labels,maxProbs,labelLogProbs,correctProbs,top5Probs,numCases,numOut,setSize);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kMultiSoftmaxCost<<<gridBlock, threadBlock>>>(probs,labels,maxProbs,labelLogProbs,correctProbs,top5Probs,numCases,numOut,setSize);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}