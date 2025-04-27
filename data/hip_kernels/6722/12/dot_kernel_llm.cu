#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    // Calculate the index and feature pairs
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    
    // Return early for invalid pairs
    if (f2 <= f1) return;
    
    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;
    
    // Accumulate sums and norms
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            sum += output[i1] * output[i2];
            norm1 += output[i1] * output[i1];
            norm2 += output[i2] * output[i2];
        }
    }
    
    // Compute norms
    norm1 = sqrt(norm1);
    norm2 = sqrt(norm2);
    float norm = norm1 * norm2;
    
    // Normalize sum
    sum /= norm;

    // Update delta array
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            float deltaFactor = -scale * sum / norm;
            delta[i1] += deltaFactor * output[i2];
            delta[i2] += deltaFactor * output[i1];
        }
    }
}