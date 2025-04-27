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

__global__ void vecMult(double *in, double *factor, double *out) {
    // Calculate the global thread ID
    unsigned int gid = getGid3d3d();
    
    // Check if thread ID is within array bounds for safety
    if (gid < (gridDim.x * gridDim.y * gridDim.z * blockDim.x * blockDim.y * blockDim.z)) {
        // Perform the vector multiplication
        double result = in[gid] * factor[gid];

        // Store the result
        out[gid] = result;
    }
}