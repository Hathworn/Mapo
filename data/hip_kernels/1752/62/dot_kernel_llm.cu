#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    // Calculate unique thread index
    int index = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;

    // Early exit if f2 <= f1
    if (f2 <= f1) return;

    float sum = 0.0f;
    float norm1 = 0.0f;
    float norm2 = 0.0f;

    // Loop through batch and size to calculate sums and norms
    for(int b = 0; b < batch; ++b){
        for(int i = 0; i < size; ++i){
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            float val1 = output[i1];
            float val2 = output[i2];
            sum += val1 * val2;
            norm1 += val1 * val1;
            norm2 += val2 * val2;
        }
    }
    
    // Calculate norms outside of loops
    norm1 = sqrtf(norm1);
    norm2 = sqrtf(norm2);
    float norm = norm1 * norm2;

    // Compute updates for delta using precalculated norm and sum
    float scaled_sum = -scale * sum / norm;
    for(int b = 0; b < batch; ++b){
        for(int i = 0; i < size; ++i){
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            delta[i1] += scaled_sum * output[i2];
            delta[i2] += scaled_sum * output[i1];
        }
    }
}