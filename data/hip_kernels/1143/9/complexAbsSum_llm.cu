#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) + (threadIdx.y * blockDim.x) + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void complexAbsSum(double2 *in1, double2 *in2, double2 *in3, double *out){
    // Compute global index using HIP built-in functions for improved readability
    int gid = getGid3d3d();
    // Preload input values for better memory access efficiency
    double2 val1 = in1[gid];
    double2 val2 = in2[gid];
    double2 val3 = in3[gid];
    
    // Accumulate values with fewer operations
    double sumX = val1.x + val2.x + val3.x;
    double sumY = val1.y + val2.y + val3.y;
    
    out[gid] = sqrt(sumX * sumX + sumY * sumY);
}