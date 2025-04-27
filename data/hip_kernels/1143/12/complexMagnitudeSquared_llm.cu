#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double complexMagnitude(double2 in){
    return sqrt(in.x*in.x + in.y*in.y);
}

__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.z * blockDim.y * blockDim.x) // Reordered for better memory access pattern
                 + (threadIdx.y * blockDim.x)
                 + threadIdx.x;
    return threadId;
}

__global__ void complexMagnitudeSquared(double2 *in, double2 *out) {
    int gid = getGid3d3d();
    if(gid < gridDim.x * gridDim.y * gridDim.z * blockDim.x * blockDim.y * blockDim.z) { // Global boundary check
        double2 val = in[gid];
        out[gid].x = val.x * val.x + val.y * val.y; // Localize memory access
        out[gid].y = 0;
    }
}