#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __extractmat2d(double *a, long long *b, int nrows, int ncols) {
    // Calculate unique thread index for 2D grid using blockDim.x, blockIdx.x and blockIdx.y
    int tid = threadIdx.x + blockDim.x * blockIdx.x + blockDim.x * gridDim.x * blockIdx.y;
    const int signbit = 0x80000000;
    const int mag = 0x7fffffff;
    const int totalThreads = blockDim.x * gridDim.x * gridDim.y;

    // Use tid and totalThreads for iterating over elements more efficiently
    for (int i = tid; i < nrows * ncols; i += totalThreads) {
        int vi = *((int *)&b[i]);
        if (vi & signbit) {
            vi = -(vi & mag);
        }
        a[i] = *((double *)&vi);
    }
}