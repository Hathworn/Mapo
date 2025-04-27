#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.z * blockDim.y * blockDim.x)
                 + (threadIdx.y * blockDim.x) + threadIdx.x;
    return threadId;
}

__global__ void set_eq(double *in1, double *in2) {
    // Calculate global thread ID
    int gid = getGid3d3d();
    // Copy data from in1 to in2
    in2[gid] = in1[gid];
}