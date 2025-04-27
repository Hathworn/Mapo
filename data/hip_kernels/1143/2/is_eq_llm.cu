#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) + (threadIdx.y * blockDim.x) + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void is_eq(bool *a, bool *b, bool *ans) {
    // Get unique global thread index
    int gid = getGid3d3d();

    // Use shared memory for comparison result
    __shared__ bool isEqualShared;

    if (threadIdx.x == 0 && threadIdx.y == 0 && threadIdx.z == 0) {
        isEqualShared = true; // Initialize shared memory
    }
    __syncthreads();

    if (a[gid] != b[gid]) {
        isEqualShared = false; // Update shared memory on mismatch
    }
    __syncthreads();

    // Only first thread writes the result back to global memory
    if (threadIdx.x == 0 && threadIdx.y == 0 && threadIdx.z == 0) {
        ans[0] = isEqualShared;
    }
}