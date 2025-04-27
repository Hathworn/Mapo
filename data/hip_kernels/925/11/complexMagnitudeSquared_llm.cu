#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double complexMagnitude(double2 in) {
    return sqrt(in.x * in.x + in.y * in.y);
}

// Use faster calculation for global thread ID
__device__ unsigned int getGid3d3d() {
    return threadIdx.x + blockIdx.x * blockDim.x + 
           (threadIdx.y + blockIdx.y * blockDim.y) * gridDim.x * blockDim.x + 
           (threadIdx.z + blockIdx.z * blockDim.z) * gridDim.x * gridDim.y * blockDim.x * blockDim.y;
}

// Optimize kernel by avoiding redundant index calculation and using memory coalescing
__global__ void complexMagnitudeSquared(double2 *in, double *out) {
    unsigned int gid = getGid3d3d();
    double2 val = in[gid]; // Access input once
    out[gid] = val.x * val.x + val.y * val.y; // Perform squared magnitude operation
}