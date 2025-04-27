#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double complexMagnitude(double2 in) {
    return sqrt(in.x * in.x + in.y * in.y);
}

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                  + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                   + (threadIdx.y * blockDim.x)
                   + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void complexMagnitudeSquared(double2 *in, double2 *out) {
    // Calculate the global ID
    int gid = blockIdx.x * blockDim.x + threadIdx.x 
              + (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x 
              + (blockIdx.z * blockDim.z + threadIdx.z) * gridDim.x * blockDim.x * gridDim.y * blockDim.y;

    // Optimize by re-using computations
    double x = in[gid].x;
    double y = in[gid].y;
    out[gid].x = x * x + y * y; // Store magnitude squared
    out[gid].y = 0;             // Ensure imaginary part is zero
}