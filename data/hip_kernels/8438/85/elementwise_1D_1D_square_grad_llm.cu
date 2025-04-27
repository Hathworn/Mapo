```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_square_grad(float* in_x, float* in_d, float* out_x, float* out_d, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID

    if (tid < size) { // Ensure thread works on valid element
        for (int i = tid; i < size; i += blockDim.x * gridDim.x) { // Stride loop for threads to cover full data
            in_d[i] += out_d[i] * 2 * in_x[i]; // Efficient computation
        }
    }
}