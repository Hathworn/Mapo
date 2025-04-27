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

__global__ void energy_lsum(double *in1, double2 *in2, double *out){
    // Calculate global thread ID more efficiently using a function
    int gid = getGid3d3d();

    // Use shared memory to reduce global memory accesses
    extern __shared__ double sharedData[];
    sharedData[threadIdx.x] = in1[gid] + in2[gid].x;
    __syncthreads();

    // Write result back to global memory
    out[gid] = sharedData[threadIdx.x];
}