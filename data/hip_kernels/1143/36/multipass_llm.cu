#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getTid3d3d(){
    return threadIdx.x + blockDim.x * (threadIdx.y + blockDim.y * threadIdx.z);
}

__device__ unsigned int getBid3d3d(){
    return blockIdx.x + gridDim.x * (blockIdx.y + gridDim.y * blockIdx.z);
}

__device__ unsigned int getGid3d3d(){
    return (blockIdx.z * gridDim.y + blockIdx.y) * gridDim.x + blockIdx.x;
}

__device__ double2 mult(double2 a, double2 b){
    return {a.x * b.x - a.y * b.y, a.x * b.y + a.y * b.x};
}

__device__ double2 mult(double2 a, double b){
    return {a.x * b, a.y * b};
}

__global__ void multipass(double2* input, double2* output, int pass){
    unsigned int tid = threadIdx.x + blockDim.x * (threadIdx.y + blockDim.y * threadIdx.z);
    unsigned int bid = (blockIdx.z * gridDim.y + blockIdx.y) * gridDim.x + blockIdx.x;
    unsigned int gid = tid + blockDim.x * blockDim.y * blockDim.z * bid;
    
    extern __shared__ double2 sdata[];
    sdata[tid] = input[gid];
    __syncthreads();
    
    for(int i = blockDim.x >> 1; i > 0; i >>= 1){
        if(tid < i){
            sdata[tid].x += sdata[tid + i].x;  // Reduce x components
            sdata[tid].y += sdata[tid + i].y;  // Reduce y components
        }
        __syncthreads();
    }
    
    if(tid == 0){
        output[bid] = sdata[0];  // Store the result
    }
}