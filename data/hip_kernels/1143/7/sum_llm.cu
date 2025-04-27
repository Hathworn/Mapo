#include "hip/hip_runtime.h"
#include "includes.h"
#define THREADS_PER_BLOCK 256

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) 
                 + (threadIdx.z * blockDim.y * blockDim.x) 
                 + (threadIdx.y * blockDim.x) + threadIdx.x;
    return threadId;
}

__global__ void sum(double2 *in1, double2 *in2, double2 *out) {
    // Optimize by computing gid using built-in functionality
    unsigned int gid = blockIdx.x * blockDim.x + threadIdx.x + 
                       blockIdx.y * blockDim.x * gridDim.x + 
                       blockIdx.z * gridDim.x * gridDim.y * blockDim.x;
    if (gid < gridDim.x * gridDim.y * gridDim.z * blockDim.x * blockDim.y * blockDim.z) {
        out[gid].x = in1[gid].x + in2[gid].x;
        out[gid].y = in1[gid].y + in2[gid].y;
    }
}