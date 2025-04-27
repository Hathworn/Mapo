#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add_bias_kernel(float *output, float *biases, int n, int size)
{
    int batch = blockIdx.z;
    int filter = blockIdx.y;
    int offset = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for biases
    __shared__ float shared_bias;
    if (threadIdx.x == 0) {
        shared_bias = biases[filter];
    }
    __syncthreads();

    if (offset < size) {
        // Prefetch biases and reduce global memory access
        output[(batch*n+filter)*size + offset] += shared_bias;
    }
}