#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int n, int size)
{
    // Cache biases in shared memory for faster access
    __shared__ float shared_biases[1024]; // Adjust size according to maximum filters

    int filter = blockIdx.y;
    if (threadIdx.x == 0) {
        shared_biases[filter] = biases[filter];
    }
    __syncthreads();

    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int batch = blockIdx.z;

    // Ensure valid offset before performing calculation
    if(offset < size) {
        output[(batch * n + filter) * size + offset] += shared_biases[filter];
    }
}