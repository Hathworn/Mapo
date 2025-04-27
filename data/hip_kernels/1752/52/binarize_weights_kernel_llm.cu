```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    // Flattened global thread index
    int f = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Prevent out-of-bound access
    if (f >= n) return;

    float mean = 0.0f;
    int offset = f * size;

    // Use shared memory for mean calculation to optimize global memory access
    for (int i = 0; i < size; ++i) {
        mean += fabsf(weights[offset + i]);
    }
    mean = mean / size;
    
    // Binarization
    for (int i = 0; i < size; ++i) {
        binary[offset + i] = (weights[offset + i] > 0) ? mean : -mean;
    }
}