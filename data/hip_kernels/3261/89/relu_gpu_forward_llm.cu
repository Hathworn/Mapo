#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    // Compute 2D grid and block index to allow for more threads to utilize shared memory
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use a for loop to allow each thread to handle multiple elements
    for (int i = index; i < N; i += stride) {
        out[i] = in[i] > 0 ? in[i] : 0;
    }
}