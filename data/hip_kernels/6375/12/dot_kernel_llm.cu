#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    // Use register variables for accumulation
    float sum = 0.0f, norm1 = 0.0f, norm2 = 0.0f;
    // Compute stride for batching
    int batchStride = size * n;

    for(int b = 0; b < batch; ++b){
        for(int i = 0; i < size; ++i){
            int i1 = b * batchStride + f1 * size + i;
            int i2 = b * batchStride + f2 * size + i;
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
    // Avoid calculating scale * sum / norm multiple times
    float scaleSumNorm = -scale * sum / norm;

    for(int b = 0; b < batch; ++b){
        for(int i = 0; i < size; ++i){
            int i1 = b * batchStride + f1 * size + i;
            int i2 = b * batchStride + f2 * size + i;
            // Minimize memory accesses by combining increments
            float val1 = output[i1];
            float val2 = output[i2];
            atomicAdd(&delta[i1], scaleSumNorm * val2);
            atomicAdd(&delta[i2], scaleSumNorm * val1);
        }
    }
}