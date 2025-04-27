#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiply_by_beta_kernel(float *input, float *output, float beta, dim3 size) {
    // Calculate global thread index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Check if the thread is within bounds
    if (i < size.x && j < size.y && k < size.z) {
        // Calculate linear index and multiply by beta
        long int id = (k * size.y + j) * size.x + i;
        output[id] = input[id] * beta;
    }
}