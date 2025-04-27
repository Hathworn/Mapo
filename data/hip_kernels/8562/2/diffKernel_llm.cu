#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void diffKernel(float *in, float *out, int n)
{
    // Calculate global thread ID, use blockDim.x for efficient calculation
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use conditional statement to ensure out-of-bound access is prevented
    if (id < n - 1) 
    {
        // Perform the difference operation
        out[id] = in[id + 1] - in[id];
    }
}