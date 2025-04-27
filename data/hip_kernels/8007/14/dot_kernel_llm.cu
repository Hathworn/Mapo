#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    // Calculate global thread index.
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    
    // Exit if f2 <= f1 as per original logic.
    if (f2 <= f1) return;

    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;

    // Optimize loop structure for memory coalescing and avoid recalculating indices.
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int offset = b * size * n + i;
            int i1 = offset + f1 * size;
            int i2 = offset + f2 * size;
            float val1 = output[i1];
            float val2 = output[i2];
            sum += val1 * val2;
            norm1 += val1 * val1;
            norm2 += val2 * val2;
        }
    }

    // Compute final normalized sum.
    norm1 = sqrt(norm1);
    norm2 = sqrt(norm2);
    float norm = norm1 * norm2;
    sum = sum / norm;

    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int offset = b * size * n + i;
            int i1 = offset + f1 * size;
            int i2 = offset + f2 * size;
            float val1 = output[i1];
            float val2 = output[i2];
            float scaled_sum = -scale * sum / norm;
            delta[i1] += scaled_sum * val2;
            delta[i2] += scaled_sum * val1;
        }
    }
}