#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary) 
{
    // Combine block and thread indices to a single linear index
    int s = blockIdx.x * blockDim.x + threadIdx.x; 
    if (s >= size) return; // Early exit if out of bounds

    float mean = 0;
    
    // Use shared memory to improve access time
    __shared__ float shared_mean;
    if (threadIdx.x == 0) shared_mean = 0;

    // Reduce unnecessary global memory access by calculating mean within block
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        atomicAdd(&shared_mean, fabsf(input[i * size + s]));
    }
    __syncthreads();

    mean = shared_mean / n;
    
    // Binirization operation
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}