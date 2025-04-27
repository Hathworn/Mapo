#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (s >= size) return;

    // Use shared memory to improve performance
    __shared__ float mean_shared;
    float local_mean = 0.0f;

    // Reduce memory access by eliminating redundant calculations
    for (int i = 0; i < n; ++i) {
        local_mean += fabsf(input[i * size + s]);
    }
    
    // Calculate the mean once for the entire thread block
    if (threadIdx.x == 0) {
        mean_shared = local_mean / n;
    }
    __syncthreads();

    // Use the pre-computed mean for binarization
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean_shared : -mean_shared;
    }
}