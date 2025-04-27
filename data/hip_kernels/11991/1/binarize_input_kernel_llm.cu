#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    // Calculate the global index
    int s = blockIdx.x * blockDim.x + threadIdx.x;
    if (s >= size) return;

    // Use shared memory to reduce repetitive global memory access
    extern __shared__ float shared_input[];

    int i = 0;
    float mean = 0;

    // Load data into shared memory
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        shared_input[i] = abs(input[i * size + s]);
    }
    __syncthreads();

    // Calculate mean
    for (i = 0; i < n; ++i) {
        mean += shared_input[i];
    }
    mean = mean / n;

    // Binarize input
    for (i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}