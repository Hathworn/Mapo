#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) + (threadIdx.y * blockDim.x) + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void complexAbsSum(double2 *in1, double2 *in2, double2 *in3, double *out){
    int gid = getGid3d3d();

    // Use shared memory to reduce global memory accesses
    __shared__ double2 sharedIn1[BLOCK_SIZE];
    __shared__ double2 sharedIn2[BLOCK_SIZE];
    __shared__ double2 sharedIn3[BLOCK_SIZE];

    // Load data into shared memory
    sharedIn1[threadIdx.x] = in1[gid];
    sharedIn2[threadIdx.x] = in2[gid];
    sharedIn3[threadIdx.x] = in3[gid];
    __syncthreads();

    // Perform computation using shared memory
    double2 temp;
    temp.x = sharedIn1[threadIdx.x].x + sharedIn2[threadIdx.x].x + sharedIn3[threadIdx.x].x;
    temp.y = sharedIn1[threadIdx.x].y + sharedIn2[threadIdx.x].y + sharedIn3[threadIdx.x].y;
    out[gid] = sqrt(temp.x * temp.x + temp.y * temp.y);
}