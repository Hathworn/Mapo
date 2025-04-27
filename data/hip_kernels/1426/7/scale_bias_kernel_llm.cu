#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Using shared memory for biases to minimize global memory access
    __shared__ float shared_bias;
    if (threadIdx.x == 0) {
        shared_bias = biases[filter];
    }
    __syncthreads();

    if (offset < size) {
        // Eliminating unnecessary arithmetic operations inside the loop
        output[(batch * n + filter) * size + offset] *= shared_bias;
    }
}