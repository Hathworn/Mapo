#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Improve index computation
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1 || f1 >= n || f2 >= n) return; // Include bounds checking

    float sum = 0.0f;
    float norm1 = 0.0f;
    float norm2 = 0.0f;

    // Use shared memory to cache frequently accessed data
    extern __shared__ float shared[]; 
    float* shared_output_f1 = shared;
    float* shared_output_f2 = shared + size;

    for (int b = 0; b < batch; ++b) {
        // Load data into shared memory
        for (int i = threadIdx.x; i < size; i += blockDim.x) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            shared_output_f1[i] = output[i1];
            shared_output_f2[i] = output[i2];
        }
        __syncthreads(); // Synchronize to ensure all data is loaded

        for (int i = 0; i < size; ++i) {
            sum += shared_output_f1[i] * shared_output_f2[i];
            norm1 += shared_output_f1[i] * shared_output_f1[i];
            norm2 += shared_output_f2[i] * shared_output_f2[i];
        }
        __syncthreads(); // Synchronize before using shared memory again
    }

    norm1 = sqrt(norm1);
    norm2 = sqrt(norm2);
    float norm = norm1 * norm2;
    sum = sum / norm;

    for (int b = 0; b < batch; ++b) {
        for (int i = threadIdx.x; i < size; i += blockDim.x) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            float scaled_sum = - scale * sum / norm;
            atomicAdd(&delta[i1], scaled_sum * output[i2]);
            atomicAdd(&delta[i2], scaled_sum * output[i1]);
        }
    }
}