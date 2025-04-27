#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_div(float* in1, float* in2, float* out, int size) {
    // Improve memory access pattern using shared memory.
    extern __shared__ float shared_data[];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid < size) {
        // Load data into shared memory from global memory.
        shared_data[threadIdx.x] = in2[tid];
        __syncthreads();

        // Perform division if denominator is non-zero to avoid undefined behavior.
        float denominator = shared_data[threadIdx.x];
        out[tid] = denominator != 0.0f ? in1[tid] / denominator : 0.0f; 
    }
}