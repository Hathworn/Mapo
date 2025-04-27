#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_square(float* in, float* out, int size) {
    // Use shared memory to reduce global memory access latency
    extern __shared__ float shared_in[];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    for (int i = tid; i < size; i += stride) {
        // Load data from global to shared memory
        if (i < size)
            shared_in[threadIdx.x] = in[i];

        // Sync threads to ensure shared memory is loaded
        __syncthreads();

        // Perform computation using shared memory
        if (i < size)
            out[i] = shared_in[threadIdx.x] * shared_in[threadIdx.x];

        // Sync threads to ensure writing is done before next iteration
        __syncthreads();
    }
}