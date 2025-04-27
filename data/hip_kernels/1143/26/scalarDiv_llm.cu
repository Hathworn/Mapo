#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + threadIdx.x 
                 + threadIdx.y * blockDim.x 
                 + threadIdx.z * (blockDim.x * blockDim.y);
    return threadId;
}

__global__ void scalarDiv(double2* in, double factor, double2* out){
    unsigned int gid = getGid3d3d();
    if (gid < gridDim.x * gridDim.y * gridDim.z * blockDim.x * blockDim.y * blockDim.z) {
        // Check if gid is within bounds
        double2 result;
        result.x = in[gid].x / factor;  // Perform division for x
        result.y = in[gid].y / factor;  // Perform division for y
        out[gid] = result;  // Store result in output array
    }
}