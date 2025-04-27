#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diffKernel( float *in, float *out, int n )
{
    // Calculate the thread's unique index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure id is within bounds and apply diff operation
    if(id < n - 1) {
        out[id] = in[id + 1] - in[id];
    }
}