#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Loop unrolling for efficiency
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; i += BLOCK*UNROLL_FACTOR) {
            #pragma unroll
            for (int u = 0; u < UNROLL_FACTOR; ++u) {
                int index = p + i + u * BLOCK + size * (filter + n * b);
                if (p + i + u * BLOCK < size) { // Check under condition
                    sum += delta[index];
                }
            }
        }
    }
    part[p] = sum;
    __syncthreads();

    // Parallel reduction to improve performance
    for (int stride = BLOCK / 2; stride > 0; stride /= 2) {
        if (p < stride) {
            part[p] += part[p + stride];
        }
        __syncthreads();
    }

    if (p == 0) {
        atomicAdd(&bias_updates[filter], part[0]); // Use atomicAdd for thread-safe accumulation
    }
}