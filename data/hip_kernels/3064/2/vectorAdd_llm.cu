#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(int* a, int* b, int* c, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure tid is within bounds and process in a single if statement
    if (tid < n) c[tid] = a[tid] + b[tid];
}