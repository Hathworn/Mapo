#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = gridDim.x * blockDim.x;
    for (; index < batch * n * size; index += totalThreads) { // Modularize parallel work
        int f1 = (index / size) / n;
        int f2 = (index / size) % n;
        if (f2 <= f1) continue;

        float sum = 0;
        float norm1 = 0;
        float norm2 = 0;

        for (int i = 0; i < size; ++i) {
            int i1 = f1 * size + i;
            int i2 = f2 * size + i;
            sum += output[i1] * output[i2];
            norm1 += output[i1] * output[i1];
            norm2 += output[i2] * output[i2];
        }

        norm1 = sqrt(norm1);
        norm2 = sqrt(norm2);
        float norm = norm1 * norm2;
        sum = sum / norm;

        for (int i = 0; i < size; ++i) {
            int i1 = f1 * size + i;
            int i2 = f2 * size + i;
            atomicAdd(&delta[i1], - scale * sum * output[i2] / norm); // Use atomic for concurrent writes
            atomicAdd(&delta[i2], - scale * sum * output[i1] / norm);
        }
    }
}