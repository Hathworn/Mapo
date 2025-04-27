#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) 
                 + (threadIdx.y * blockDim.x)
                 + (threadIdx.z * (blockDim.x * blockDim.y)) 
                 + threadIdx.x;
    return threadId;
}

__global__ void complexAbsSum(double2 *in1, double2 *in2, double *out) {
    int gid = getGid3d3d();
    
    // Utilize shared memory to reduce global memory access for better performance
    __shared__ double2 sharedMem1[256]; // Assuming a maximum block size of 256 threads
    __shared__ double2 sharedMem2[256];

    // Load data from global to shared memory
    sharedMem1[threadIdx.x] = in1[gid];
    sharedMem2[threadIdx.x] = in2[gid];
    __syncthreads();

    // Compute sum and magnitude in shared memory
    double2 temp;
    temp.x = sharedMem1[threadIdx.x].x + sharedMem2[threadIdx.x].x;
    temp.y = sharedMem1[threadIdx.x].y + sharedMem2[threadIdx.x].y;
    out[gid] = sqrt(temp.x * temp.x + temp.y * temp.y);
}