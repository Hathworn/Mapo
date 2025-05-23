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

__global__ void complexMagnitudeKernel(double2 *in, double *out) {
    int gid = getGid3d3d();
    double2 val = in[gid]; // Cache input value for reuse
    out[gid] = sqrt(val.x * val.x + val.y * val.y);
}