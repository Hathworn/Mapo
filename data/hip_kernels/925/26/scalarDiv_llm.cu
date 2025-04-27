#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.y * blockDim.x)
                 + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void scalarDiv(double2* in, double factor, double2* out){
    // Improved memory access coalescing
    unsigned int gid = getGid3d3d();
    double2 input = in[gid];
    double invFactor = 1.0 / factor;  // Use reciprocal for division

    double2 result;
    result.x = input.x * invFactor;
    result.y = input.y * invFactor;

    out[gid] = result;
}