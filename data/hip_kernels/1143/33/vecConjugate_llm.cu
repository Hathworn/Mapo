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

__global__ void vecConjugate(double2 *in, double2 *out){
    // Calculate 3D thread ID
    unsigned int gid = getGid3d3d();
    
    // Ensure the thread is within bounds
    if (gid < (gridDim.x * gridDim.y * gridDim.z * blockDim.x * blockDim.y * blockDim.z)) {
        // Read input and compute conjugate
        double2 result;
        result.x = in[gid].x;
        result.y = -in[gid].y;
    
        // Write result to output
        out[gid] = result;
    }
}