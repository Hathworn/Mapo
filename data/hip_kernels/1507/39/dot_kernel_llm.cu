#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    float sum = 0, norm1 = 0, norm2 = 0;
    // Replace nested loops with a single loop for each batch
    for (int b = 0; b < batch; ++b) {
        int offset = b * size * n;
        for (int i = 0; i < size; ++i) {
            int i1 = offset + f1 * size + i;
            int i2 = offset + f2 * size + i;
            float v1 = output[i1];
            float v2 = output[i2];
            sum += v1 * v2;
            norm1 += v1 * v1;
            norm2 += v2 * v2;
        }
    }
    norm1 = sqrtf(norm1);
    norm2 = sqrtf(norm2);
    float norm = norm1 * norm2;
    sum = sum / norm;
    
    // Combine the updates into a single loop with precomputed indices and values
    for (int b = 0; b < batch; ++b) {
        int offset = b * size * n;
        for (int i = 0; i < size; ++i) {
            int i1 = offset + f1 * size + i;
            int i2 = offset + f2 * size + i;
            float deltaVal = -scale * sum / norm;
            delta[i1] += deltaVal * output[i2];
            delta[i2] += deltaVal * output[i1];
        }
    }
}