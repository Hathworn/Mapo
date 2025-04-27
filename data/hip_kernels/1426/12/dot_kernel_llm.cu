#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;

    // Use shared memory for better performance
    extern __shared__ float sharedData[];
    float* s_output = sharedData;
    
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            
            // Load data into shared memory for coalesced memory access
            s_output[threadIdx.x * 2] = output[i1];
            s_output[threadIdx.x * 2 + 1] = output[i2];
            __syncthreads();

            float val1 = s_output[threadIdx.x * 2];
            float val2 = s_output[threadIdx.x * 2 + 1];

            sum += val1 * val2;
            norm1 += val1 * val1;
            norm2 += val2 * val2;

            __syncthreads();
        }
    }

    norm1 = sqrt(norm1);
    norm2 = sqrt(norm2);
    float norm = norm1 * norm2;
    sum = sum / norm;

    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            delta[i1] += -scale * sum * output[i2] / norm;
            delta[i2] += -scale * sum * output[i1] / norm;
        }
    }
}