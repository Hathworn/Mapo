#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + threadIdx.z * (blockDim.x * blockDim.y)
                 + threadIdx.y * blockDim.x + threadIdx.x;
    return threadId;
}

__global__ void cMultPhi(double2* in1, double* in2, double2* out) {
    unsigned int gid = getGid3d3d();
    double phase = in2[gid];  // Pre-compute phase
    double cosPhase = cos(phase);  // Pre-compute cosine
    double sinPhase = sin(phase);  // Pre-compute sine

    double2 input = in1[gid];  // Read input once
    double2 result;
    
    // Use pre-computed values and minimize arithmetic operations
    result.x = cosPhase * input.x - sinPhase * input.y;
    result.y = sinPhase * input.x + cosPhase * input.y;
    
    out[gid] = result;  // Write result
}