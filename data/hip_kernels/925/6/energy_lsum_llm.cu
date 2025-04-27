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

__global__ void energy_lsum(double *in1, double2 *in2, double *out){
    int gid = blockIdx.x * blockDim.x * blockDim.y * blockDim.z
            + blockIdx.y * gridDim.x * blockDim.x * blockDim.y * blockDim.z
            + blockIdx.z * gridDim.x * gridDim.y * blockDim.x * blockDim.y * blockDim.z
            + threadIdx.z * blockDim.x * blockDim.y
            + threadIdx.y * blockDim.x
            + threadIdx.x;
    
    // Simplified gid calculation; directly added inputs to output
    if (gid < gridDim.x * gridDim.y * gridDim.z * blockDim.x * blockDim.y * blockDim.z) {
        out[gid] = in1[gid] + in2[gid].x;
    }
}