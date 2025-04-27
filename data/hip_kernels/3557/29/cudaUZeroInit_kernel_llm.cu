#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaUZeroInit_kernel(unsigned int size, unsigned int* data)
{
    // Use shared memory for faster access
    extern __shared__ unsigned int shared_data[];

    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned int i = index; i < size; i += stride) {
        shared_data[threadIdx.x] = 0U; // Store in shared memory
        data[i] = shared_data[threadIdx.x]; // Copy from shared memory to global memory
    }
}