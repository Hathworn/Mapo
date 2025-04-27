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

__global__ void is_eq(bool *a, bool *b, bool *ans){
    // Initialize thread-specific answer
    int gid = getGid3d3d();
    if (a[gid] != b[gid]){
        ans[gid] = false;  // Store result per thread
    } else {
        ans[gid] = true;
    }
}