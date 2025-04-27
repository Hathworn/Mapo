#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0.0f;

    // Loop unrolling for improved performance
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; i += BLOCK) {
            int index = p + i + size * (filter + n * b);
            if (p + i < size) {
                sum += delta[index];
            }
        }
    }
    part[p] = sum;

    // An optimized reduction using shared memory
    __syncthreads();
    for (int offset = BLOCK / 2; offset > 0; offset >>= 1) {
        if (p < offset) {
            part[p] += part[p + offset];
        }
        __syncthreads();
    }

    // Only one thread writes the result
    if (p == 0) {
        atomicAdd(&bias_updates[filter], part[0]);
    }
}