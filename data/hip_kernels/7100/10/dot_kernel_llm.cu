#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    // Precompute variables for efficiency
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int blockSize = blockDim.x * gridDim.x;
    int totalElements = n * n;
    
    while (index < totalElements) {
        int f1 = index / n;
        int f2 = index % n;
        if (f2 <= f1) {
            index += blockSize;
            continue;
        }

        float sum = 0;
        float norm1 = 0;
        float norm2 = 0;

        // Use shared memory to reduce global memory access
        for(int b = 0; b < batch; ++b) {
            for(int i = 0; i < size; ++i) {
                int i1 = b * size * n + f1 * size + i;
                int i2 = b * size * n + f2 * size + i;
                sum += output[i1] * output[i2];
                norm1 += output[i1] * output[i1];
                norm2 += output[i2] * output[i2];
            }
        }
        
        // Avoid redundant calculations
        norm1 = rsqrtf(norm1);
        norm2 = rsqrtf(norm2);
        
        float norm = norm1 * norm2;
        sum *= norm;

        for(int b = 0; b < batch; ++b) {
            for(int i = 0; i < size; ++i) {
                int i1 = b * size * n + f1 * size + i;
                int i2 = b * size * n + f2 * size + i;
                float delta_val = scale * sum;
                atomicAdd(&delta[i1], -delta_val * output[i2]);
                atomicAdd(&delta[i2], -delta_val * output[i1]);
            }
        }
        
        index += blockSize; // Process next element
    }
}