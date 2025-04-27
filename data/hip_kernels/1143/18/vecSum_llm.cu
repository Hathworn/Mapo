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
__global__ void vecSum(double2 *in, double *factor, double2 *out){
    unsigned int gid = getGid3d3d();
    // Load input values into registers to optimize memory access
    double2 in_val = in[gid];
    double factor_val = factor[gid];
    double2 result;
    // Perform computation using registers
    result.x = in_val.x + factor_val;
    result.y = in_val.y + factor_val;
    // Store result back to global memory
    out[gid] = result;
}