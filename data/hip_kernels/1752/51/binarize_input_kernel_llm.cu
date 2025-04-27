```cuda
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    // Calculate unique index for each thread
    int s = blockIdx.x * blockDim.x + threadIdx.x;
    if (s >= size) return;

    float mean = 0.0f;

    // Use shared memory for intermediate mean calculation
    extern __shared__ float shared_mem[];
    for (int i = 0; i < n; ++i) {
        shared_mem[threadIdx.x] = fabsf(input[i * size + s]);
        __syncthreads();

        // Accumulate in shared memory
        if (threadIdx.x == 0) {
            float block_sum = 0.0f;
            for (int j = 0; j < blockDim.x; ++j) {
                block_sum += shared_mem[j];
            }
            mean += block_sum;
        }
        __syncthreads();
    }

    // Mean of input segments
    mean = mean / (n * gridDim.x * blockDim.x);

    // Set binary output
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}