#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fill_one(float * prp_0,int sz)
{
    // Calculate linear thread index
    int linear_index = blockIdx.x * blockDim.x * sz * sz
                     + blockIdx.y * blockDim.y * sz
                     + blockIdx.z * blockDim.z
                     + threadIdx.x * sz * sz
                     + threadIdx.y * sz
                     + threadIdx.z;

    // Assign value only if within valid range
    if (linear_index < sz * sz * sz) {
        prp_0[linear_index] = 1.0f; // Fill with one
    }
}