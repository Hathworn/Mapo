#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Optimize block indexing
    if (index >= n * n) return; // Check for out-of-bounds
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    float sum = 0.0f;
    float norm1 = 0.0f;
    float norm2 = 0.0f;
    
    for(int b = 0; b < batch; ++b) {
        for(int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            sum += output[i1] * output[i2];
            norm1 += output[i1] * output[i1];
            norm2 += output[i2] * output[i2];
        }
    }
    
    float norm = sqrt(norm1) * sqrt(norm2);
    float scaled_sum = (sum / norm) * -scale;
    
    for(int b = 0; b < batch; ++b) {
        for(int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            atomicAdd(&delta[i1], scaled_sum * output[i2] / norm); // Use atomicAdd for concurrency safety
            atomicAdd(&delta[i2], scaled_sum * output[i1] / norm);
        }
    }
}