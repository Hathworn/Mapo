#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    // Use more descriptive variable names 
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to potentially improve performance
    __shared__ float sharedMem[1024];
    if (globalIndex < N) {
        sharedMem[threadIdx.x] = in[globalIndex];
        __syncthreads();

        // Perform ReLU operation
        out[globalIndex] = sharedMem[threadIdx.x] > 0 ? sharedMem[threadIdx.x] : 0;
    }
}