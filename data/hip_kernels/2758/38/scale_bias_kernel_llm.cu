#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    // Use shared memory for biases to minimize global memory access
    __shared__ float shared_biases[1024]; 

    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    if (threadIdx.x < n && filter == 0) {
        shared_biases[threadIdx.x] = biases[threadIdx.x];
    }

    __syncthreads();  // Ensure all biases are loaded before use

    if(offset < size) {
        output[(batch*n+filter)*size + offset] *= shared_biases[filter];
    }
}