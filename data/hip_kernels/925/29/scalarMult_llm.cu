#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                  + (threadIdx.y * blockDim.x)
                  + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void scalarMult(double* __restrict__ in, double factor, double* __restrict__ out){
    unsigned int gid = getGid3d3d();
    // Use registers for intermediate computation
    double result = in[gid] * factor;
    // Minimize memory writes
    out[gid] = result;
}