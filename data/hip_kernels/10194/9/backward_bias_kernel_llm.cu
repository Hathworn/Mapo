#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK 256  // Example value; adjust as appropriate for your use case

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Unroll the loop to improve memory access patterns
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index];
        }
    }

    part[p] = sum;
    __syncthreads();

    // Use a parallel reduction to accumulate partial sums
    for (int stride = BLOCK / 2; stride > 0; stride /= 2) {
        if (p < stride) {
            part[p] += part[p + stride];
        }
        __syncthreads();
    }

    // Only one thread needs to update the global memory
    if (p == 0) {
        atomicAdd(&bias_updates[filter], part[0]);
    }
}