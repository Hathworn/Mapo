#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu(float *inout, float *bias, int rows, int cols) {
    // Use shared memory for bias if rows are small; otherwise each thread reads its own
    __shared__ float shared_bias[32];  // Assuming blockDim.y <= 32 for this example
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    if (i < rows && j < cols) {
        if (threadIdx.x == 0) {
            shared_bias[threadIdx.y] = bias[i];
        }
        __syncthreads();  // Ensure shared memory is loaded

        float value = inout[i * cols + j] + shared_bias[threadIdx.y];
        inout[i * cols + j] = fmaxf(0.0, value);
    }
}