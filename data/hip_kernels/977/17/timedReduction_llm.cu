#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void timedReduction(const float *input, float *output, clock_t *timer) {
    extern __shared__ float shared[];

    const int tid = threadIdx.x;
    const int bid = blockIdx.x;
    const int offset = blockDim.x * 2 * bid;

    // Start timing
    if (tid == 0) timer[bid] = clock();

    // Copy input to shared memory efficiently
    float val = (tid + offset < gridDim.x * blockDim.x * 2) ? input[tid + offset] : FLT_MAX;
    float val2 = (tid + offset + blockDim.x < gridDim.x * blockDim.x * 2) ? input[tid + offset + blockDim.x] : FLT_MAX;
    shared[tid] = min(val, val2);

    // Perform reduction to find minimum
    for (int d = blockDim.x / 2; d > 0; d >>= 1) {
        __syncthreads();
        if (tid < d) {
            shared[tid] = min(shared[tid], shared[tid + d]);
        }
    }

    // Write result for this block
    if (tid == 0) output[bid] = shared[0];

    // End timing
    __syncthreads();
    if (tid == 0) timer[bid + gridDim.x] = clock();
}