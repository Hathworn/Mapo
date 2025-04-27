#include "hip/hip_runtime.h"
#include "includes.h"

// Calculate unique thread ID for 3D grid and blocks
__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + threadIdx.z * (blockDim.x * blockDim.y)
                 + threadIdx.y * blockDim.x
                 + threadIdx.x;
    return threadId;
}

// Optimized kernel function for scalar division
__global__ void scalarDiv(double* __restrict__ in, double factor, double* __restrict__ out) {
    unsigned int gid = getGid3d3d();

    // Ensure gid does not go out of bounds
    if(gid < gridDim.x * gridDim.y * gridDim.z * blockDim.x * blockDim.y * blockDim.z) {
        out[gid] = in[gid] / factor;
    }
}