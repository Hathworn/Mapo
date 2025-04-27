#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    // Use shared memory to reduce global memory accesses
    __shared__ float shared_biases[1024]; // Assuming max thread block size of 1024

    int tid = threadIdx.x;
    int offset = blockIdx.x * blockDim.x + tid;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Load bias into shared memory
    if (tid == 0) {
        shared_biases[filter] = biases[filter];
    }
    __syncthreads();

    // Ensure offset is within bounds
    if (offset < size) {
        output[(batch * n + filter) * size + offset] *= shared_biases[filter];
    }
}