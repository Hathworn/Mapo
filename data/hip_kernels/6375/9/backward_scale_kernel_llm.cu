#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int i, b;
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Pre-calculate offset for current filter
    int filter_offset = size * filter;

    // Iterate through batches
    for(b = 0; b < batch; ++b) {
        int batch_offset = size * n * b;

        // Iterate through elements with stride BLOCK
        for(i = p; i < size; i += BLOCK) {
            int index = i + filter_offset + batch_offset;
            sum += delta[index] * x_norm[index];
        }
    }
    part[p] = sum;
    __syncthreads();

    // Use parallel reduction to accumulate sums
    for (i = BLOCK / 2; i > 0; i >>= 1) {
        if(p < i) part[p] += part[p + i];
        __syncthreads();
    }

    // Write the result of reduction to global memory
    if (p == 0) {
        atomicAdd(&scale_updates[filter], part[0]); // Use atomicAdd for reduction
    }
}