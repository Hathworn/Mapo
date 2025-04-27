#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation

    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;  // Early exit for redundant calculations

    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;

    // Loop unrolling to improve performance
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int base = b * size * n + i;  // Precompute base index
            int i1 = base + f1 * size;
            int i2 = base + f2 * size;
            float output_i1 = output[i1];
            float output_i2 = output[i2];
            sum += output_i1 * output_i2;
            norm1 += output_i1 * output_i1;
            norm2 += output_i2 * output_i2;
        }
    }
    
    norm1 = rsqrtf(norm1); // Use reciprocal square root for faster computation
    norm2 = rsqrtf(norm2); // Use reciprocal square root for faster computation
    float norm_inv = norm1 * norm2; // Compute inverse of norm directly

    sum *= norm_inv;
    float scale_sum = -scale * sum;

    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int base = b * size * n + i;  // Precompute base index
            int i1 = base + f1 * size;
            int i2 = base + f2 * size;
            float output_i1 = output[i1];
            float output_i2 = output[i2];
            delta[i1] += scale_sum * output_i2 * norm_inv;
            delta[i2] += scale_sum * output_i1 * norm_inv;
        }
    }
}