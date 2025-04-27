#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_one(float * prp_0, int sz)
{
    // Calculate linear thread index for 3D grid
    int idx = blockIdx.z * blockDim.z * sz * sz + blockIdx.y * blockDim.y * sz + blockIdx.x * blockDim.x;
    idx += threadIdx.z * sz * sz + threadIdx.y * sz + threadIdx.x;

    // Check if index is within bounds before assignment
    if (idx < sz * sz * sz) {
        prp_0[idx] = 1.0f;
    }
}