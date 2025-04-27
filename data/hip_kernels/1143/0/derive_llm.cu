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

__global__ void derive(double *data, double *out, int stride, int gsize, double dx){
    int gid = getGid3d3d();
    if (gid >= gsize) return;  // Early exit for threads with gid >= gsize

    double result = data[gid] / dx;  // Calculate initial result

    if (gid + stride < gsize) {
        result = (data[gid + stride] - data[gid]) / dx; // Update result when gid + stride < gsize
    }

    out[gid] = result;  // Store computed result in out array
}