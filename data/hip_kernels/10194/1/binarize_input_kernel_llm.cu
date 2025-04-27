```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (s >= size) return;

    float mean = 0;

    // Optimize: Use shared memory for mean calculation to reduce global memory access
    extern __shared__ float shared_data[];
    float *shared_mean = shared_data;

    // Initialize shared memory for this thread
    shared_mean[threadIdx.x] = 0;

    // Sum up the absolute values for mean calculation
    for(int i = 0; i < n; ++i) {
        shared_mean[threadIdx.x] += abs(input[i * size + s]);
    }

    // Synchronize within block to ensure all shared_data updates are consistent
    __syncthreads();

    // Reduce operation to compute the overall mean
    #pragma unroll
    for (unsigned int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            shared_mean[threadIdx.x] += shared_mean[threadIdx.x + offset];
        }
        // Ensure threads have completed reduction step before next step
        __syncthreads();
    }

    // Calculate mean for the block
    if (threadIdx.x == 0) {
        mean = shared_mean[0] / n;
    }
    
    // Use the computed mean for binarization
    for(int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}