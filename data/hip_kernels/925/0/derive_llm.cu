#include "hip/hip_runtime.h"
#include "includes.h"
#define THREADS_PER_BLOCK 256

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.y * blockDim.x)
                 + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void derive(double *data, double *out, int stride, int gsize, double dx) {
    // Improved memory coalescing and reduced branching
    int gid = getGid3d3d();
    if (gid < gsize) {
        double dataValue = data[gid];
        double nextDataValue = (gid + stride < gsize) ? data[gid + stride] : dataValue;
        out[gid] = (nextDataValue - dataValue) / dx;
    }
}