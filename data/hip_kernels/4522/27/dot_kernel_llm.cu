#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    // Calculate a single thread index
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    // Initialize accumulator variables
    float sum = 0.0f, norm1 = 0.0f, norm2 = 0.0f;
    int total_size = size * n;
    
    // Unroll loops for better performance
    for (int b = 0; b < batch; ++b) {
        int base_index1 = b * total_size + f1 * size;
        int base_index2 = b * total_size + f2 * size;
        for (int i = 0; i < size; ++i) {
            int i1 = base_index1 + i;
            int i2 = base_index2 + i;
            float output_i1 = output[i1];
            float output_i2 = output[i2];
            sum += output_i1 * output_i2;
            norm1 += output_i1 * output_i1;
            norm2 += output_i2 * output_i2;
        }
    }
    
    // Precompute norms
    float inv_norm1 = rsqrtf(norm1);
    float inv_norm2 = rsqrtf(norm2);
    float norm = inv_norm1 * inv_norm2;
    sum *= norm;

    // Update delta with optimized access
    for (int b = 0; b < batch; ++b) {
        int base_index1 = b * total_size + f1 * size;
        int base_index2 = b * total_size + f2 * size;
        for (int i = 0; i < size; ++i) {
            int i1 = base_index1 + i;
            int i2 = base_index2 + i;
            float output_i1 = output[i1];
            float output_i2 = output[i2];
            float scaled_sum = -scale * sum;
            atomicAdd(&delta[i1], scaled_sum * output_i2 / norm);
            atomicAdd(&delta[i2], scaled_sum * output_i1 / norm);
        }
    }
}