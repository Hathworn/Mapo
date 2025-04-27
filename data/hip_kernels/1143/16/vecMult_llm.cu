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

__global__ void vecMult(double2 *in, double *factor, double2 *out) {
    // Calculate unique global thread ID
    unsigned int gid = blockIdx.x * blockDim.x + threadIdx.x
                     + (blockDim.x * gridDim.x) * (blockIdx.y + blockIdx.z * gridDim.y);

    // Ensure thread is within bounds
    if (gid < gridDim.x * blockDim.x * gridDim.y * gridDim.z * blockDim.y * blockDim.z) {
        // Perform multiplication and store result
        out[gid].x = in[gid].x * factor[gid];
        out[gid].y = in[gid].y * factor[gid];
    }
}