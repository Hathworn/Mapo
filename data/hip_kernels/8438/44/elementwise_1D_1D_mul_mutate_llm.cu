#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_mul_mutate(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use shared memory to optimize memory access
    extern __shared__ float sharedIn1[];
    extern __shared__ float sharedIn2[];

    if (tid < size) {
        sharedIn1[threadIdx.x] = in1[tid];
        sharedIn2[threadIdx.x] = in2[tid];
    }
    __syncthreads();

    for (; tid < size; tid += stride) {
        if (tid < size) {
            // Update output using shared memory
            out[tid] += sharedIn1[threadIdx.x] * sharedIn2[threadIdx.x];
        }
    }
}