#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constant_add_kernel(const float *data_l, float constant, float *result, int total)
{
    // Use shared memory to minimize global memory access
    __shared__ float shared_data[512]; // Adjust size based on blockDim.x

    int idx = 2 * (blockIdx.x * blockDim.x + threadIdx.x);

    // Load data to shared memory
    if (idx < 2 * total) {
        shared_data[threadIdx.x] = data_l[idx];
        if (idx + 1 < 2 * total) {
            shared_data[threadIdx.x + 1] = data_l[idx + 1];
        }
    }
    __syncthreads();

    // Perform computation using shared memory
    if (idx / 2 < total) {
        result[idx] = shared_data[threadIdx.x] + constant;
        if (idx + 1 < 2 * total) {
            result[idx + 1] = shared_data[threadIdx.x + 1];
        }
    }
}