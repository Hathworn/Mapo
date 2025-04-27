#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.y * blockDim.x)
                 + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void vecSum(double *in, double *factor, double *out) {
    unsigned int gid = getGid3d3d();
    // Load inputs into registers to reduce global memory accesses
    double inVal = in[gid];
    double factorVal = factor[gid];
    // Perform the operation and store the result
    out[gid] = inVal + factorVal;
}