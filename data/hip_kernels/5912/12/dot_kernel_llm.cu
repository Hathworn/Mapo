#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access by reducing index calculations
__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;
    int size_n = size * n; // Precompute size * n for reuse
    int b, i;
    
    // Use register to optimize repeated index calculations
    for (b = 0; b < batch; ++b) {
        int base_index1 = b * size_n + f1 * size;
        int base_index2 = b * size_n + f2 * size;
        
        for (i = 0; i < size; ++i) {
            int i1 = base_index1 + i;
            int i2 = base_index2 + i;
            sum += output[i1] * output[i2];
            norm1 += output[i1] * output[i1];
            norm2 += output[i2] * output[i2];
        }
    }
    norm1 = sqrt(norm1);
    norm2 = sqrt(norm2);
    float norm = norm1 * norm2;
    sum = sum / norm;
    
    for (b = 0; b < batch; ++b) {
        int base_index1 = b * size_n + f1 * size;
        int base_index2 = b * size_n + f2 * size;
        
        for (i = 0; i < size; ++i) {
            int i1 = base_index1 + i;
            int i2 = base_index2 + i;
            atomicAdd(&delta[i1], -scale * sum * output[i2] / norm);
            atomicAdd(&delta[i2], -scale * sum * output[i1] / norm);
        }
    }
}