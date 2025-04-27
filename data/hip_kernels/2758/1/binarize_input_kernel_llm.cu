#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = blockIdx.x * blockDim.x + threadIdx.x;
    if (s >= size) return;

    // Pre-compute mean for s
    float mean = 0;
    for(int i = 0; i < n; ++i) {
        mean += fabsf(input[i * size + s]);
    }
    mean /= n;

    // Binarize input based on mean
    for(int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}