```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void count_zero_one(float *vec, float *data, const int n)
{
    // Use shared memory to reduce global memory access
    __shared__ int shared_data[2];
    if (threadIdx.x == 0) {
        shared_data[0] = 0;
        shared_data[1] = 0;
    }
    __syncthreads();

    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;

    // Use a single atomic operation to increase parallelism
    if (xIndex < n) {
        if (vec[xIndex] == 0) {
            atomicAdd(&shared_data[0], 1);
        } else if (vec[xIndex] == 1) {
            atomicAdd(&shared_data[1], 1);
        }
    }

    __syncthreads();

    // Only one thread updates global memory
    if (threadIdx.x == 0) {
        atomicAdd(data, shared_data[0]);
        atomicAdd(data + 1, shared_data[1]);
    }
}