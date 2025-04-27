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

__global__ void l2_norm(double *in1, double *in2, double *out) {
    // Use built-in function to improve performance of this kernel
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    double val1 = in1[gid];
    double val2 = in2[gid];
    out[gid] = sqrt(val1 * val1 + val2 * val2);
}