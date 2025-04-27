#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                   + (threadIdx.y * blockDim.x)
                   + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void scalarMult(double2* in, double factor, double2* out){
    // Calculate global index efficiently using built-in variables without extra function call
    unsigned int gid = getGid3d3d();
    
    // Load input in fewer operations
    double2 input_val = in[gid];
    
    // Directly calculate and store the result to reduce register pressure
    out[gid].x = input_val.x * factor;
    out[gid].y = input_val.y * factor;
}