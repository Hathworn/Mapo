#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getTid3d3d() {
    return blockDim.x * (blockDim.y * threadIdx.z + threadIdx.y) + threadIdx.x;
}

__device__ unsigned int getBid3d3d() {
    return blockIdx.x + gridDim.x * (blockIdx.y + gridDim.y * blockIdx.z);
}

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    return blockId * (blockDim.x * blockDim.y * blockDim.z) +
           (threadIdx.z * blockDim.x * blockDim.y) +
           (threadIdx.y * blockDim.x) +
           threadIdx.x;
}

__device__ double2 mult(double2 a, double2 b) {
    return {a.x * b.x - a.y * b.y, a.x * b.y + a.y * b.x};
}

__device__ double2 mult(double2 a, double b) {
    return {a.x * b, a.y * b};
}

__global__ void multipass(double* input, double* output) {
    unsigned int tid = getTid3d3d();  // Simplify thread index calculation
    unsigned int gid = getGid3d3d();  // Simplify global index calculation
    
    extern __shared__ double sdatad[];
    
    sdatad[tid] = input[gid];  // Load input into shared memory
    __syncthreads();
    
    for(int i = blockDim.x >> 1; i > 0; i >>= 1) {
        if(tid < i) {
            sdatad[tid] += sdatad[tid + i];  // Reduce in shared memory
        }
        __syncthreads();
    }
    
    if(tid == 0) {
        output[getBid3d3d()] = sdatad[0];  // Write result from block to output
    }
}