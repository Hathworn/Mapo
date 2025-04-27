#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;
    int i1, i2;

    // Using shared memory to reduce global memory access
    extern __shared__ float shared_output[];

    // Load data into shared memory
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            i1 = b * size * n + f1 * size + i;
            i2 = b * size * n + f2 * size + i;
            shared_output[threadIdx.x * 2] = output[i1];
            shared_output[threadIdx.x * 2 + 1] = output[i2];
            __syncthreads();

            float val1 = shared_output[threadIdx.x * 2];
            float val2 = shared_output[threadIdx.x * 2 + 1];
            sum += val1 * val2;
            norm1 += val1 * val1;
            norm2 += val2 * val2;
            __syncthreads();
        }
    }

    // Avoid repeated division by norm1 and norm2
    norm1 = sqrt(norm1);
    norm2 = sqrt(norm2);
    float inv_norm = 1.0f / (norm1 * norm2);
    sum *= inv_norm;

    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            i1 = b * size * n + f1 * size + i;
            i2 = b * size * n + f2 * size + i;
            float shared_val1 = output[i1];
            float shared_val2 = output[i2];
            shared_output[threadIdx.x * 2] = shared_val1;
            shared_output[threadIdx.x * 2 + 1] = shared_val2;
            __syncthreads();

            delta[i1] += -scale * sum * shared_output[threadIdx.x * 2 + 1] * inv_norm;
            delta[i2] += -scale * sum * shared_output[threadIdx.x * 2] * inv_norm;
            __syncthreads();
        }
    }
}