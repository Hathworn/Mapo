#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void intrinsic_kernel(float a, float *out, int iters)
{
    int tid = (blockDim.x * blockIdx.x) + threadIdx.x;
    // Reduce thread divergence, use shared memory for optimization
    __shared__ float tmp;
    
    if(tid == 0)
    {
        tmp = __powf(a, 2.0f);
    }
    
    __syncthreads();
    
    if(tid == 0)
    {
        *out = tmp; // Single assignment after synchronization
    }
}