#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fmad_kernel(double x, double y, double *out)
{
    // Use block-level shared memory to store intermediate calculations
    __shared__ double shared_result;
    
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Only the first thread in the block performs the FMA operation
    if (tid == 0)
    {
        shared_result = x * x + y;
    }

    // Ensure all threads see the updated value
    __syncthreads();

    // The output is only written once, avoiding multiple writes
    if (tid == 0)
    {
        *out = shared_result;
    }
}