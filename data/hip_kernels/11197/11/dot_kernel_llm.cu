```c
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

    // Using shared memory to reduce global memory access
    extern __shared__ float shared_output[];
    
    // Load data into shared memory
    for (int i = threadIdx.x; i < batch * size * n; i += blockDim.x) {
        shared_output[i] = output[i];
    }
    __syncthreads();

    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            sum += shared_output[i1] * shared_output[i2];
            norm1 += shared_output[i1] * shared_output[i1];
            norm2 += shared_output[i2] * shared_output[i2];
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
            atomicAdd(&delta[i1], -scale * sum * shared_output[i2] / norm); // Use atomicAdd for safety
            atomicAdd(&delta[i2], -scale * sum * shared_output[i1] / norm); // Use atomicAdd for safety
        }
    }
}
```
