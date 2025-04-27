#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize(int *values, int *max, float *output, int n)
{
    // Calculate index based on thread and block IDs
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce access latency to 'max'
    __shared__ int shared_max;
    if (threadIdx.x == 0) {
        shared_max = *max;
    }
    __syncthreads();

    // Perform normalization only for valid indices
    if (i < n) {
        output[i] = (float)values[i] / (float)shared_max;
    }
}