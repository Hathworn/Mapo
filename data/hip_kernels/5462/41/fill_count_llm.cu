#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_count(float *prp_0, int sz)
{
    // Calculate linear index for 3D grid
    int tid = blockIdx.z * blockDim.z * sz * sz + 
              blockIdx.y * blockDim.y * sz + 
              blockIdx.x * blockDim.x + 
              threadIdx.z * sz * sz + 
              threadIdx.y * sz + 
              threadIdx.x;

    if (tid < sz * sz * sz) // Ensure write is within bounds
    {
        prp_0[tid] = tid; // Assign the value directly using the calculated index
    }
}