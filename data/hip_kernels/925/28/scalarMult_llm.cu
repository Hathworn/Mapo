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

__global__ void scalarMult(double2* in, double factor, double2* out){
    // Calculate global thread ID directly, avoiding repeated operations
    unsigned int gid = blockIdx.x * blockDim.x + threadIdx.x 
                     + (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x
                     + (blockIdx.z * blockDim.z + threadIdx.z) * gridDim.x * gridDim.y * blockDim.x * blockDim.y;
    
    // Perform multiplication and store result using fewer temporary variables
    out[gid].x = in[gid].x * factor;
    out[gid].y = in[gid].y * factor;
}