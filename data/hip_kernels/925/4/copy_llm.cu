#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) 
                + (threadIdx.z * (blockDim.x * blockDim.y))
                + (threadIdx.y * blockDim.x)
                + threadIdx.x;
    return threadId;
}

// Optimized kernel function
__global__ void copy(double2 *in, double2 *out) {
    int gid = getGid3d3d();
    // Use shared memory to optimize data access. Assume grid and block sizes are manageable.
    __shared__ double2 sharedMem[1024]; // Adjust size according to block size constraints
    sharedMem[threadIdx.x + threadIdx.y * blockDim.x + threadIdx.z * blockDim.x * blockDim.y] = in[gid];
    __syncthreads(); // Synchronize threads within block
    out[gid] = sharedMem[threadIdx.x + threadIdx.y * blockDim.x + threadIdx.z * blockDim.x * blockDim.y];
}