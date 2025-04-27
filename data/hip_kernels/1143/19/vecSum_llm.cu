#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    // Simplified global index calculation
    return threadIdx.x + blockDim.x * (threadIdx.y + blockDim.y * (threadIdx.z + blockDim.z * (blockIdx.x + gridDim.x * (blockIdx.y + gridDim.y * blockIdx.z))));
}

__global__ void vecSum(double *in, double *factor, double *out) {
    unsigned int gid = getGid3d3d();
    // Combine operations to reduce overhead
    out[gid] = in[gid] + factor[gid];
}