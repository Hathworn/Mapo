#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    // Calculate global index
    int s = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if index out of bounds
    if (s >= size) return;

    // Use shared memory for input tile to reduce global memory accesses
    __shared__ float shared_input[1024];  // Maximum shared memory usage depends on the GPU, adjust size as needed

    float mean = 0;

    // Loop over 'n' using block-stride loop
    for (int i = 0; i < n; ++i) {
        // Load input into shared memory
        shared_input[threadIdx.x] = abs(input[i * size + s]);
        __syncthreads();

        // Accumulate mean value
        mean += shared_input[threadIdx.x];

        // Synchronize to ensure shared memory is consistent before next iteration
        __syncthreads();
    }

    // Calculate mean
    mean /= n;

    // Reiterate for binarization
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}