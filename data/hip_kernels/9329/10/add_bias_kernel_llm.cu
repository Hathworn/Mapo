#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Use shared memory to minimize global memory access
    extern __shared__ float shared_biases[];
    if (threadIdx.x == 0) {
        shared_biases[filter] = biases[filter];
    }
    __syncthreads();

    if(offset < size) {
        output[(batch*n+filter)*size + offset] += shared_biases[filter];
    }
}