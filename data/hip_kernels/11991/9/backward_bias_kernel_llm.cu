#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Unroll the inner loop to improve efficiency
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; i += BLOCK * 4) {
            int idx = p + i + size * (filter + n * b);
            sum += (p + i < size) ? delta[idx] : 0;
            sum += (p + i + BLOCK < size) ? delta[idx + BLOCK] : 0;
            sum += (p + i + 2 * BLOCK < size) ? delta[idx + 2 * BLOCK] : 0;
            sum += (p + i + 3 * BLOCK < size) ? delta[idx + 3 * BLOCK] : 0;
        }
    }

    part[p] = sum;
    __syncthreads();

    // Use more efficient reduction within the block
    if (p < 32) {
        for (int i = BLOCK / 2; i >= 32; i >>= 1) {
            if (p < i) part[p] += part[p + i];
            __syncthreads();
        }
        if (p < 16) part[p] += part[p + 16];
        if (p < 8) part[p] += part[p + 8];
        if (p < 4) part[p] += part[p + 4];
        if (p < 2) part[p] += part[p + 2];
        if (p == 0) bias_updates[filter] += part[0] + part[1];
    }
}