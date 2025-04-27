#include "hip/hip_runtime.h"
#include "includes.h"

#define TB 128
#define GS(x) (((x) - 1) / TB + 1)

__global__ void mul_(float *input, float factor, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory for improved memory access speed
    __shared__ float shared_input[TB];

    if (id < size) {
        // Load data into shared memory
        shared_input[threadIdx.x] = input[id];
        __syncthreads();

        // Perform computation using shared memory
        shared_input[threadIdx.x] *= factor;
        __syncthreads();

        // Write back to global memory
        input[id] = shared_input[threadIdx.x];
    }
}