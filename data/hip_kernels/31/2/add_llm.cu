#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(float *x, float *y, float *z, float *deltaX, float *deltaY, float *deltaZ) {
    // More efficient indexing using built-in thread and block index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;  
    if (tid < N) {
        x[tid] += deltaX[tid];
        y[tid] += deltaY[tid];
        z[tid] += deltaZ[tid];
    }
}