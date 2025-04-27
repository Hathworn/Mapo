#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.z * blockDim.x * blockDim.y) // Moved threadIdx.z earlier for better coalescing
                 + (threadIdx.y * blockDim.x) + threadIdx.x;
    return threadId;
}

__global__ void thread_test(double *in, double *out){
    unsigned int Gid = getGid3d3d();
    
    // Use direct store for single transaction. Avoid direct computation to reduce warp divergence.
    out[Gid] = static_cast<double>(Gid);
    // in[Gid] = static_cast<double>(Gid); // Comment preserved for potential future use
}