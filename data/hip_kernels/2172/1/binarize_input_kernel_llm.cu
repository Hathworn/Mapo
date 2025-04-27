#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = blockIdx.x * blockDim.x + threadIdx.x;
    if (s >= size) return;

    // Use shared memory to reduce redundant global memory access
    extern __shared__ float sharedInput[];
    float mean = 0.0f;

    // Load input data into shared memory
    for (int i = 0; i < n; ++i) {
        sharedInput[i * blockDim.x + threadIdx.x] = fabsf(input[i * size + s]);
        __syncthreads();
    }

    // Calculate mean value
    for (int i = 0; i < n; ++i) {
        mean += sharedInput[i * blockDim.x + threadIdx.x];
    }
    mean /= n;
    
    // Binarize input
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}