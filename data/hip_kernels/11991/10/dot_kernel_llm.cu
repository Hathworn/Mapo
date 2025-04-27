#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    // Compute thread index
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    float sum = 0.0f;
    float norm1 = 0.0f;
    float norm2 = 0.0f;
    
    // Use register memory for better performance in loops
    #pragma unroll
    for (int b = 0; b < batch; ++b) {
        #pragma unroll
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            float o1 = output[i1];
            float o2 = output[i2];
            sum += o1 * o2;
            norm1 += o1 * o1;
            norm2 += o2 * o2;
        }
    }
    norm1 = sqrtf(norm1);
    norm2 = sqrtf(norm2);
    float norm = norm1 * norm2;
    sum /= norm;

    // Pre-calculate scaled sum over norm
    float factor = -scale * sum / norm;

    #pragma unroll
    for (int b = 0; b < batch; ++b) {
        #pragma unroll
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            float o1 = output[i1];
            float o2 = output[i2];
            delta[i1] += factor * o2;
            delta[i2] += factor * o1;
        }
    }
}