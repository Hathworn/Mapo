#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fmad_kernel(double x, double y, double *out)
{
    // Using shared memory to reduce global memory access
    __shared__ double shared_x;
    __shared__ double shared_y;
    
    if (threadIdx.x == 0)
    {
        shared_x = x;
        shared_y = y;
    }
    __syncthreads();  // Ensure shared memory is initialized
    
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid == 0)
    {
        *out = shared_x * shared_x + shared_y;  // Access shared memory
    }
}