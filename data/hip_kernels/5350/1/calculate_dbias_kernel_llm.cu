#include "hip/hip_runtime.h"
#include "includes.h"

#define CUDA_KERNEL_LOOP(i, n) \
for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < (n); i += blockDim.x * gridDim.x)

const int CUDA_NUM_THREADS = 1024;

// Optimized kernel function
__global__ void calculate_dbias_kernel(int n, const float* grad_output, float* grad_bias, const int out_channels, const int height_out, const int width_out) {
    // Calculate index using thread and block information
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop with stride to cover all elements
    for (int i = index; i < n; i += blockDim.x * gridDim.x) {
        int c_col = (i / width_out / height_out) % out_channels;
        float value = grad_output[i];
        atomicAdd(&grad_bias[c_col], value); // Safely accumulate into grad_bias with atomic operation
    }
}