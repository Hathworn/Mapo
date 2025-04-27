#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSMaxBackward_kernel(unsigned int size, float* diffInput, const unsigned int idx, unsigned int* argMax, const float beta, float* result)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory for better global memory access pattern
    __shared__ float sharedDiffInput[1024]; // Assuming blockDim.x <= 1024
    __shared__ unsigned int sharedArgMax[1024];

    // Load data into shared memory
    if (index < size) {
        sharedDiffInput[threadIdx.x] = diffInput[index];
        sharedArgMax[threadIdx.x] = argMax[index];
    }
    __syncthreads();

    if (beta != 0.0f) {
        for (unsigned int i = index; i < size; i += stride) {
            // Leveraging shared memory to reduce memory accesses
            result[i] = (sharedArgMax[threadIdx.x] == idx) ? (sharedDiffInput[threadIdx.x] + beta * result[i])
                                                           : beta * result[i];
        }
    } else {
        for (unsigned int i = index; i < size; i += stride) {
            result[i] = (sharedArgMax[threadIdx.x] == idx) ? sharedDiffInput[threadIdx.x]
                                                           : 0.0f;
        }
    }
}