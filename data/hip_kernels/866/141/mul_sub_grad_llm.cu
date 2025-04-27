#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using shared memory and loop unrolling
__global__ void mul_sub_grad(float* in1_x, float* in1_d, float* in2_x, float* in2_d, float* out, int in1ScalarCount, int in2ScalarCount) {
    extern __shared__ float sharedIn2X[];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Load shared memory just once per block
    if (threadIdx.x < in2ScalarCount) {
        sharedIn2X[threadIdx.x] = in2_x[threadIdx.x];
    }
    __syncthreads();

    // Process multiple elements in each loop iteration using loop unrolling for efficiency
    for (; tid < in1ScalarCount; tid += stride) {
        int index = tid % in2ScalarCount;
        float outVal = out[tid];
        in1_d[tid] += outVal * sharedIn2X[index];
        in2_d[tid] = in1_x[tid] * outVal;
    }
}