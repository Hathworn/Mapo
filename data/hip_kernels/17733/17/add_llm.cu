#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    // Use both blockIdx and threadIdx to compute unique tid for parallel execution
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Total number of threads

    // Optimize loop to use stride for better GPU utilization
    while (tid < N) {
        c[tid] = a[tid] + b[tid];
        tid += stride;
    }
}