#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void arrayReduce(int *m, int *ms) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    // Load ms[blockIdx.x] into shared memory for faster access
    __shared__ int shared_ms;
    if (threadIdx.x == 0) {
        shared_ms = ms[blockIdx.x];
    }
    __syncthreads();
    
    // Perform reduction only if condition is met
    if (m[id] > -1) {
        m[id] -= shared_ms; // Direct subtraction to optimize
    }
}