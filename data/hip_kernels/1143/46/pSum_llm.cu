#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                    + threadIdx.x 
                    + threadIdx.y * blockDim.x 
                    + threadIdx.z * blockDim.x * blockDim.y;
    return threadId;
}

__global__ void pSum(double* in1, double* output, int pass){
    unsigned int tid = threadIdx.x;
    unsigned int bid = blockIdx.y * gridDim.x * blockDim.x + blockIdx.x;
    unsigned int gid = getGid3d3d(); // Global ID assignment
    extern __shared__ double sdata2[];

    // Load input data into shared memory
    sdata2[tid] = in1[gid];
    __syncthreads();

    // Reduce using the shared memory
    for(int i = blockDim.x >> 1; i > 0; i >>= 1){
        if(tid < i){ // Correction in conditional check
            sdata2[tid] += sdata2[tid + i];
        }
        __syncthreads();
    }

    if(tid == 0){
        output[bid] = sdata2[0]; // Write result for this block to output
    }
}