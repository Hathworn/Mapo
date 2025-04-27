#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void naive_bias_add(float *in, int size, float *bias, int bias_size)
{
    int bid = blockIdx.x * blockDim.x + threadIdx.x;
    if (bid < size) {
        // Compute bias offset using modulus instead of division/multiplication
        int bias_offset = bid % bias_size;
        in[bid] += bias[bias_offset];
    }
}