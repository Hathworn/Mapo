#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaComputeAndNormalizeGradientLength(unsigned char *channel_values, int* x_gradient, int* y_gradient, int chunk_size_per_thread) {
    // Calculate the index for thread and check bounds
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int start = index * chunk_size_per_thread;
    int end = start + chunk_size_per_thread;

    // Unroll loop for better performance
    #pragma unroll
    for (int i = start; i < end; i++) {
        // Use built-in square root function
        int gradient_length = min(255, int(hypot(float(x_gradient[i]), float(y_gradient[i]))));
        channel_values[i] = gradient_length;
    }
}