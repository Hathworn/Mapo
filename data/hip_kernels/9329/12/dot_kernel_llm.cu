#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;

    // Precompute offset for index calculation
    int size_n = size * n;

    for(int b = 0; b < batch; ++b) {
        for(int i = 0; i < size; ++i) {
            int base = b * size_n;
            int i1 = base + f1 * size + i;
            int i2 = base + f2 * size + i;
            float output1 = output[i1];
            float output2 = output[i2];
            sum += output1 * output2;
            norm1 += output1 * output1;
            norm2 += output2 * output2;
        }
    }

    norm1 = sqrt(norm1);
    norm2 = sqrt(norm2);
    float norm = norm1 * norm2;
    float scaled_sum = -scale * sum / norm;

    for(int b = 0; b < batch; ++b) {
        for(int i = 0; i < size; ++i) {
            int base = b * size_n;
            int i1 = base + f1 * size + i;
            int i2 = base + f2 * size + i;
            delta[i1] += scaled_sum * output[i2];
            delta[i2] += scaled_sum * output[i1];
        }
    }
}