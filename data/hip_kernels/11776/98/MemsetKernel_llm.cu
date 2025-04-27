#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val) {
    return val.y;
}

__global__ void MemsetKernel(const float value, int w, int h, float *image) {
    // Calculate a unique global thread ID
    int global_id = threadIdx.x + blockDim.x * (threadIdx.y + blockDim.y * blockIdx.y);

    // Calculate the total number of threads globally
    int total_threads = blockDim.x * blockDim.y * gridDim.y;

    // Use stride to optimize global memory access
    for (int idx = global_id; idx < w * h; idx += total_threads) {
        image[idx] = value;
    }
}