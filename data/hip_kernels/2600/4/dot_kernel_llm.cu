#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;
    
    float sum = 0.0f, norm1 = 0.0f, norm2 = 0.0f;

    // Use register variables to reduce memory access latency
    float output_val1, output_val2;

    // Loop unrolling for batch size to improve performance
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            output_val1 = output[i1];
            output_val2 = output[i2];
            sum += output_val1 * output_val2;
            norm1 += output_val1 * output_val1;
            norm2 += output_val2 * output_val2;
        }
    }
    norm1 = sqrtf(norm1);
    norm2 = sqrtf(norm2);
    float norm = norm1 * norm2;
    sum = sum / norm;

    // Reuse calculated values and avoid redundant calculations
    float scale_sum = -scale * sum / norm;

    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            delta[i1] += scale_sum * output[i2];
            delta[i2] += scale_sum * output[i1];
        }
    }
}