#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.z * blockDim.x * blockDim.y) // Optimize thread index calculation
                 + (threadIdx.y * blockDim.x)
                 + threadIdx.x;
    return threadId;
}

__global__ void thread_test(double *in, double *out){
    unsigned int Gid = getGid3d3d();

    // Write Gid to the output array
    out[Gid] = static_cast<double>(Gid); // Use explicit type cast for consistency
}