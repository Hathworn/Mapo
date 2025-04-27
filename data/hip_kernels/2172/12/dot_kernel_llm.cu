#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // For iteration across all elements
    for (int id = index; id < batch * n; id += stride) {
        int f1 = id / n;
        int f2 = id % n;
        if (f2 <= f1) continue; // Skip unnecessary computation

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
        if (norm > 0) sum = sum / norm; // Avoid division by zero

        for (int i = 0; i < size; ++i) {
            int i1 = f1 * size + i;
            int i2 = f2 * size + i;
            float deltaVal = -scale * sum / norm; // Precompute delta contribution
            delta[i1] += deltaVal * output[i2];
            delta[i2] += deltaVal * output[i1];
        }
    }
}