#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolution_kernel(float *output, float *input, float *filter) {
    extern __shared__ float sh_input[];  // Use dynamic shared memory

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x * blockDim.x;
    int by = blockIdx.y * blockDim.y;

    int inputIndex = (by + ty) * inputWidth + (bx + tx);

    // Load input into shared memory
    sh_input[ty * blockDim.x + tx] = input[inputIndex];
   
    __syncthreads();  // Ensure all loads are visible to all threads in the block

    // Apply filter
    float result = 0.0f;
    for (int i = 0; i < filterHeight; ++i) {
        for (int j = 0; j < filterWidth; ++j) {
            int sharedIndex = (ty + i) * blockDim.x + (tx + j);
            result += sh_input[sharedIndex] * filter[i * filterWidth + j];
        }
    }

    output[inputIndex] = result;  // Store result in global memory
}