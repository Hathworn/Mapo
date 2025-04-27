#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    // Optimize block and thread indices calculation.
    int blockId = blockIdx.z * gridDim.x * gridDim.y + blockIdx.y * gridDim.x + blockIdx.x;
    int threadId = threadIdx.z * blockDim.y * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x;
    return blockId * (blockDim.x * blockDim.y * blockDim.z) + threadId;
}

__global__ void scalarDiv_wfcNorm(double2* in, double dr, double* pSum, double2* out) {
    // Use shared memory for norm calculation
    __shared__ double sharedNorm;

    if (threadIdx.x == 0 && threadIdx.y == 0 && threadIdx.z == 0) {
        sharedNorm = sqrt((pSum[0]) * dr);
    }
    
    __syncthreads(); // Ensure all threads have the loaded norm

    unsigned int gid = getGid3d3d();
    double2 result;
    double norm = sharedNorm;
    result.x = (in[gid].x / norm);
    result.y = (in[gid].y / norm);
    out[gid] = result;
}