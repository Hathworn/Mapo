#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kArgMinColumnwise(float* mat, float* target, unsigned int width, unsigned int height) {
    __shared__ float min_vals[32];
    __shared__ unsigned int min_args[32];
    float cur_min = 2e38;
    unsigned int cur_arg = 0;
    float val = 0;

    // Loop stride optimization to avoid warp divergence
    for (unsigned int i = threadIdx.x; i < height; i += blockDim.x) {
        val = mat[i * width + blockIdx.x];

        // Perform comparison and update min
        if (val < cur_min) {
            cur_min = val;
            cur_arg = i;
        }
    }

    min_vals[threadIdx.x] = cur_min;
    min_args[threadIdx.x] = cur_arg;

    __syncthreads();

    // Reduce within the warp
    if (threadIdx.x < 16) {
        for (int offset = 16; offset > 0; offset /= 2) {
            if (threadIdx.x + offset < 32 && min_vals[threadIdx.x + offset] < min_vals[threadIdx.x]) {
                min_vals[threadIdx.x] = min_vals[threadIdx.x + offset];
                min_args[threadIdx.x] = min_args[threadIdx.x + offset];
            }
        }
    }

    // Only the first thread writes the result
    if (threadIdx.x == 0) {
        target[blockIdx.x] = min_args[0];
    }
}