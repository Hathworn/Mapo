#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.z * (blockDim.x * blockDim.y)) 
                 + (threadIdx.y * blockDim.x) 
                 + threadIdx.x;
    return threadId;
}

// Optimized global kernel function
__global__ void cMultPhi(double2* in1, double* in2, double2* out) {
    unsigned int gid = getGid3d3d();
    
    double2 in1Val = in1[gid]; // Cache in1[gid]
    double in2Val = in2[gid];  // Cache in2[gid]
    
    // Precompute trigonometric functions
    double cosVal = cos(in2Val);
    double sinVal = sin(in2Val);
    
    // Compute result using precomputed values
    double2 result;
    result.x = cosVal * in1Val.x - in1Val.y * sinVal;
    result.y = in1Val.x * sinVal + in1Val.y * cosVal;
    
    out[gid] = result;
}