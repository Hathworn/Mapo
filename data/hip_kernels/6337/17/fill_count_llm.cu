#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fill_count(float * prp_0, int sz)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;
    int idz = blockIdx.z * blockDim.z + threadIdx.z;

    // Optimize array access and update when within bounds
    int index = idz * sz * sz + idy * sz + idx;
    if (idx < sz && idy < sz && idz < sz) {
        prp_0[index] = index; // Simplified computation and ensure in-bounds operation
    }
}