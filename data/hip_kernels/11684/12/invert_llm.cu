#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

/*
* Perform a reduction from data of length 'size' to result, 
* where length of result will be 'number of blocks'.
*/
extern "C"
__global__ void invert(int n, float *a, float *result)
{
    // Using shared memory to reduce global memory access latency
    __shared__ float shared_a[256];
    
    int tid = threadIdx.x;
    int index = blockIdx.x * blockDim.x + tid;

    if (index < n) {
        // Load data into shared memory
        shared_a[tid] = a[index];
        __syncthreads();
        
        // Perform inversion using shared memory
        result[index] = 1.0f / shared_a[tid];
    }
}