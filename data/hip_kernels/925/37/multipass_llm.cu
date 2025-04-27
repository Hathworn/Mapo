#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getTid3d3d() {
    return threadIdx.x + threadIdx.y * blockDim.x + threadIdx.z * blockDim.x * blockDim.y;
}

__device__ unsigned int getBid3d3d() {
    return blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
}

__device__ unsigned int getGid3d3d() {
    return (blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z) * (blockDim.x * blockDim.y * blockDim.z) + threadIdx.x + threadIdx.y * blockDim.x + threadIdx.z * blockDim.x * blockDim.y;
}

__device__ double2 mult(double2 a, double2 b) {
    return {a.x * b.x - a.y * b.y, a.x * b.y + a.y * b.x};
}

__device__ double2 mult(double2 a, double b) {
    return {a.x * b, a.y * b};
}

__global__ void multipass(double* input, double* output) {
    unsigned int tid = getTid3d3d();
    unsigned int gid = getGid3d3d();
    extern __shared__ double sdatad[];

    sdatad[tid] = input[gid];
    __syncthreads();

    // Use warp-efficient reduction
    for (int i = blockDim.x * blockDim.y * blockDim.z >> 1; i > 32; i >>= 1) {
        if (tid < i) {
            sdatad[tid] += sdatad[tid + i];
        }
        __syncthreads();
    }

    // Final warp reduction
    if (tid < 32) {
        volatile double* vsmem = sdatad;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    if (tid == 0) {
        output[getBid3d3d()] = sdatad[0];
    }
}