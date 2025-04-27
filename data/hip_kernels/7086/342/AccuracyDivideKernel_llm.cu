#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel with individual block reduction
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    __shared__ float cache[256]; // Shared memory cache

    int tid = threadIdx.x;
    int index = blockIdx.x * blockDim.x + tid;
    
    // Use warp-wide reduction for better efficiency
    float temp_acc = (index < N) ? 1.0 : 0.0;

    // First phase of reduction
    for (int i = blockDim.x / 2; i > 0; i >>= 1) {
        temp_acc += __shfl_down_sync(0xFFFFFFFF, temp_acc, i);
    }

    // Store reduction result in shared memory
    if (tid == 0) {
        cache[blockIdx.x] = temp_acc;
    }
    __syncthreads();

    // Final reduction across blocks
    if (blockIdx.x == 0 && tid < N) {
        float final_acc = (tid < N) ? cache[tid] : 0.0;
        for (int i = 1; i < gridDim.x; i++) {
            final_acc += cache[i];
        }
        if (tid == 0) {
            *accuracy = final_acc / N;
        }
    }
}