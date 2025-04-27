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

__global__ void vecMult(double2 *in, double *factor, double2 *out){
    unsigned int gid = getGid3d3d();
    
    // Load input values to registers to avoid repeated global memory access
    double2 inputVal = in[gid];
    double factorVal = factor[gid];
    
    // Perform computation in registers
    double2 result;
    result.x = inputVal.x * factorVal;
    result.y = inputVal.y * factorVal;
    
    // Write result back to global memory
    out[gid] = result;
}