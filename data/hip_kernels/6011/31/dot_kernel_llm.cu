#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta) 
{
    int index = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    int totalElements = batch * n * size;

    // Ensure index falls within valid range
    if (index >= totalElements) return;

    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;

    // Unrolling the loop for better performance
    for (int b = 0; b < batch; ++b) {
        int base_index1 = b * n * size + f1 * size;
        int base_index2 = b * n * size + f2 * size;

        // Vectorized computation
        #pragma unroll
        for (int i = 0; i < size; ++i) {
            int i1 = base_index1 + i;
            int i2 = base_index2 + i;
            float val1 = output[i1];
            float val2 = output[i2];
            sum += val1 * val2;
            norm1 += val1 * val1;
            norm2 += val2 * val2;
        }
    }

    norm1 = rsqrtf(norm1);  // Use reciprocal square root for optimization
    norm2 = rsqrtf(norm2);
    float norm = 1.0f / (norm1 * norm2);
    sum = sum * norm;

    // Unrolling the loop for better performance
    for (int b = 0; b < batch; ++b) {
        int base_index1 = b * n * size + f1 * size;
        int base_index2 = b * n * size + f2 * size;

        #pragma unroll
        for (int i = 0; i < size; ++i) {
            int i1 = base_index1 + i;
            int i2 = base_index2 + i;
            float val1 = output[i1];
            float val2 = output[i2];
            atomicAdd(&delta[i1], -scale * sum * val2 * norm);
            atomicAdd(&delta[i2], -scale * sum * val1 * norm);
        }
    }
}