#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 256  // Define block size for better occupancy

__device__ float in1[1000];
__device__ __constant__ float in2[1000];

// Optimized kernel using shared memory
__global__ void vecadd_shared_memory(float* out, int N) {
    __shared__ float shared_in1[BLOCK_SIZE];
    __shared__ float shared_in2[BLOCK_SIZE];

    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    int threadIdxInBlock = threadIdx.x;

    // Load data into shared memory
    if (idx < N) {
        shared_in1[threadIdxInBlock] = in1[idx];
        shared_in2[threadIdxInBlock] = in2[idx];
    }
    __syncthreads();
    
    // Perform vector addition using shared memory
    if (idx < N) {
        out[idx] = shared_in1[threadIdxInBlock] + shared_in2[threadIdxInBlock];
    }
}

// Separately optimized kernel for external input arrays
__global__ void vecadd(float* in1, float* in2, float* out, int N) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    if (idx < N) {
        out[idx] = in1[idx] + in2[idx];
    }
}