#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;
    
    // Precompute base indices for efficiency
    for (int b = 0; b < batch; ++b) {
        int base1 = b * size * n + f1 * size;
        int base2 = b * size * n + f2 * size;
        for (int i = 0; i < size; ++i) {
            int i1 = base1 + i;
            int i2 = base2 + i;
            float val1 = output[i1];
            float val2 = output[i2];
            sum += val1 * val2;
            norm1 += val1 * val1;
            norm2 += val2 * val2;
        }
    }

    norm1 = sqrt(norm1);
    norm2 = sqrt(norm2);
    float norm = norm1 * norm2;
    sum = sum / norm;
    
    // Reuse precomputed base indices here as well
    for (int b = 0; b < batch; ++b) {
        int base1 = b * size * n + f1 * size;
        int base2 = b * size * n + f2 * size;
        for (int i = 0; i < size; ++i) {
            int i1 = base1 + i;
            int i2 = base2 + i;
            delta[i1] += -scale * sum * output[i2] / norm;
            delta[i2] += -scale * sum * output[i1] / norm;
        }
    }
}