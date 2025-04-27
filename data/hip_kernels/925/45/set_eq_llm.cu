#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.z * blockDim.y + threadIdx.y) * blockDim.x + threadIdx.x;
    return threadId;
}

__global__ void set_eq(double *in1, double *in2) {
    int gid = getGid3d3d();
    if (gid < gridDim.x * gridDim.y * gridDim.z * blockDim.x * blockDim.y * blockDim.z)  // Boundary check
        in2[gid] = in1[gid];
}