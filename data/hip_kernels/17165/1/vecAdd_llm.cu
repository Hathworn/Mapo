#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(double *a, double *b, double *c, int n) {
    // Use shared memory to reduce global memory access latency
    extern __shared__ double sharedData[];

    int tid = threadIdx.x;
    int id = blockIdx.x * blockDim.x + tid;

    // Load elements into shared memory
    if (id < n) {
        sharedData[tid] = a[id] + b[id];
        __syncthreads();
        
        // Write results back to global memory
        c[id] = sharedData[tid];
    }
}