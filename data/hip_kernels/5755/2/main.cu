#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cosineSimilarityKernel.cu"
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
    double *dot_products = NULL;
hipMalloc(&dot_products, XSIZE*YSIZE);
int a_size = XSIZE*YSIZE;
int b_size = XSIZE*YSIZE;
double *a_norms = NULL;
hipMalloc(&a_norms, XSIZE*YSIZE);
double *b_norms = NULL;
hipMalloc(&b_norms, XSIZE*YSIZE);
double *results = NULL;
hipMalloc(&results, XSIZE*YSIZE);
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
cosineSimilarityKernel<<<gridBlock, threadBlock>>>(dot_products,a_size,b_size,a_norms,b_norms,results);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cosineSimilarityKernel<<<gridBlock, threadBlock>>>(dot_products,a_size,b_size,a_norms,b_norms,results);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cosineSimilarityKernel<<<gridBlock, threadBlock>>>(dot_products,a_size,b_size,a_norms,b_norms,results);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}