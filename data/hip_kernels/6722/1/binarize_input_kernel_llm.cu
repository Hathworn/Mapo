```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (s >= size) return;

    // Use shared memory to reduce global memory access
    extern __shared__ float shared_data[];
    float *shared_input = shared_data;
    float mean = 0;

    // Load input elements to shared memory
    for (int i = 0; i < n; ++i) {
        shared_input[i] = fabsf(input[i * size + s]);
    }
    __syncthreads();  // Ensure all data is loaded

    // Calculate mean
    for (int i = 0; i < n; ++i) {
        mean += shared_input[i];
    }
    mean = mean / n;

    // Binarize input
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}