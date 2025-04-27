#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void mul_sub(float* in1, float* in2, float* out, int in1ScalarCount, int in2ScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Use shared memory to reduce global memory access
    __shared__ float sharedIn2[256]; // Assumes blockDim.x <= 256
    if (threadIdx.x < in2ScalarCount) {
        sharedIn2[threadIdx.x] = in2[threadIdx.x];
    }
    __syncthreads();

    for (; tid < in1ScalarCount; tid += stride) {
        out[tid] = in1[tid] * sharedIn2[tid % in2ScalarCount];
    }
}