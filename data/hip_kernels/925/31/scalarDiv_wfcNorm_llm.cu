#include "hip/hip_runtime.h"
#include "includes.h"
#define THREADS_PER_BLOCK_X blockDim.x
#define THREADS_PER_BLOCK_Y blockDim.y
#define THREADS_PER_BLOCK_Z blockDim.z

__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
                + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (THREADS_PER_BLOCK_X * THREADS_PER_BLOCK_Y * THREADS_PER_BLOCK_Z)
                 + (threadIdx.z * THREADS_PER_BLOCK_Y * THREADS_PER_BLOCK_X)
                 + (threadIdx.y * THREADS_PER_BLOCK_X) + threadIdx.x;
    return threadId;
}

__global__ void scalarDiv_wfcNorm(double2* in, double dr, double* pSum, double2* out){
    unsigned int gid = getGid3d3d(); // Compute unique thread index

    if (gid < gridDim.x * gridDim.y * gridDim.z * THREADS_PER_BLOCK_X * THREADS_PER_BLOCK_Y * THREADS_PER_BLOCK_Z) {
        double2 result;
        double norm = rsqrt(pSum[0] * dr); // Use rsqrt for performance

        result.x = in[gid].x * norm; // Optimize division to multiplication
        result.y = in[gid].y * norm;

        out[gid] = result;
    }
}