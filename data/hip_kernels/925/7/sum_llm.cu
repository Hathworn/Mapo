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

__global__ void sum(double2 *in1, double2 *in2, double2 *out){
    int gid = getGid3d3d();
    if(gid < gridDim.x * gridDim.y * gridDim.z * blockDim.x * blockDim.y * blockDim.z) {
        // Ensure gid is within bounds
        out[gid].x = in1[gid].x + in2[gid].x;
        out[gid].y = in1[gid].y + in2[gid].y;
    }
}