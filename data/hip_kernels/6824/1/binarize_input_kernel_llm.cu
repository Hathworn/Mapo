#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    // Calculate global thread index
    int s = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    
    // Exit if the thread is out of bounds
    if (s >= size) return;

    int i = 0;
    float mean = 0.0f;
    
    // Optimized: Using shared memory for faster access
    __shared__ float shared_mean;

    // Compute mean using atomic addition for shared memory access
    for (i = 0; i < n; ++i) {
        atomicAdd(&shared_mean, fabsf(input[i * size + s]));
    }
    __syncthreads();
    
    // Final mean calculation outside the loop
    mean = shared_mean / n;
    
    // Write the binarized values using the computed mean
    for (i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}