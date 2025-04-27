#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double complexMagnitude(double2 in){
    return sqrt(in.x * in.x + in.y * in.y);
}

__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) +
                   (threadIdx.y * blockDim.x) +
                   (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void complexMagnitude(double2 *in, double *out){
    // Use shared memory for faster access
    __shared__ double2 sharedIn[256]; // Assuming blockDim.x * blockDim.y * blockDim.z <= 256

    int tid = threadIdx.x + threadIdx.y * blockDim.x + threadIdx.z * blockDim.x * blockDim.y;
    int gid = getGid3d3d();

    // Load data into shared memory
    sharedIn[tid] = in[gid];
    __syncthreads();

    // Compute magnitude using shared memory
    if (gid < gridDim.x * gridDim.y * gridDim.z * blockDim.x * blockDim.y * blockDim.z) { // Check boundary condition
        out[gid] = sqrt(sharedIn[tid].x * sharedIn[tid].x + sharedIn[tid].y * sharedIn[tid].y);
    }
}