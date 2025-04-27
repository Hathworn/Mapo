#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                   + (threadIdx.y * blockDim.x)
                   + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void simple_K(double *xp, double *yp, double *zp, double mass, double *K) {
    unsigned int gid = getGid3d3d();

    // Use better indexing to avoid multiple global memory accesses
    double x = xp[blockDim.x * blockIdx.x + threadIdx.x];
    double y = yp[blockDim.y * blockIdx.y + threadIdx.y];
    double z = zp[blockDim.z * blockIdx.z + threadIdx.z];

    // Simplify computation
    K[gid] = (HBAR * HBAR / (2 * mass)) * (x * x + y * y + z * z);
}