#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Shared memory for parallel reduction
    __shared__ float shared_mean;

    // Calculate mean using parallel reduction
    float sum = 0.0f;
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        sum += fabsf(weights[f * size + i]);
    }

    atomicAdd(&shared_mean, sum);  // Accumulate sum
    __syncthreads();  // Ensure all threads have updated shared_mean

    if (threadIdx.x == 0) {
        shared_mean /= size;
    }
    __syncthreads();  // Ensure mean is available for all threads

    // Binarize weights
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? shared_mean : -shared_mean;
    }
}
```
