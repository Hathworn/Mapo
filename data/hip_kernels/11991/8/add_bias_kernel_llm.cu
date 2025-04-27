#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Improve memory access pattern by using shared memory for biases
    __shared__ float shared_biases[512];
    if (threadIdx.x == 0) {
        shared_biases[filter] = biases[filter];
    }
    __syncthreads();
    
    if(offset < size) {
        output[(batch*n+filter)*size + offset] += shared_biases[filter];
    }
}