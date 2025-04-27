#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.z * (blockDim.x * blockDim.y))
                 + (threadIdx.y * blockDim.x) + threadIdx.x;
    return threadId;
}

__global__ void vecSum(double2 *in, double *factor, double2 *out) {
    unsigned int gid = getGid3d3d();

    // Cache the factor to reduce global memory access
    double f = factor[gid];
    
    // Perform computation with cached value
    double2 input = in[gid];
    double2 result;
    result.x = input.x + f;
    result.y = input.y + f;
    
    out[gid] = result;
}