#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addToKPlus(int msize, double* a,  double* b, double* c, double* d)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (tid < msize) {
        d[tid] = a[tid] + b[tid] + c[tid]; // Perform addition efficiently
    }
}