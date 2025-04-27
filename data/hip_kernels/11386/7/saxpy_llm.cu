#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void saxpy(float scalar, float * x, float * y)
{
    // Calculate the global thread index for processing data
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure all memory accesses are coalesced and within bounds
    if (tid < N) {
        y[tid] = scalar * x[tid] + y[tid];
    }
}