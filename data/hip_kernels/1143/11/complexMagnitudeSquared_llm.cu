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

__global__ void complexMagnitudeSquared(double2 *in, double *out) {
    int gid = getGid3d3d();
    if (gid < (gridDim.x * gridDim.y * gridDim.z * blockDim.x * blockDim.y * blockDim.z)) { // Prevent out of bounds
        double2 input = in[gid]; // Efficient memory access
        out[gid] = input.x * input.x + input.y * input.y;
    }
}