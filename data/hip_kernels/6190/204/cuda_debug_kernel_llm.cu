#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_debug_kernel()
{
    // Calculate the global thread index based on the 3D grid and block indices
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int idy = blockIdx.y * blockDim.y + threadIdx.y;
    const int idz = blockIdx.z * blockDim.z + threadIdx.z;

    // Ensure we're not accessing an out-of-bounds index
    if (idx >= gridDim.x * blockDim.x || 
        idy >= gridDim.y * blockDim.y ||
        idz >= gridDim.z * blockDim.z) {
        return;
    }

    // Add additional computation or data manipulation here if needed
}