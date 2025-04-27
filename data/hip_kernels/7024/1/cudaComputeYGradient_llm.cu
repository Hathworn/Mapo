```c
#include "hip/hip_runtime.h"
#include "includes.h"

hipEvent_t start, stop;

__global__ void cudaComputeYGradient(int* y_gradient, unsigned char* channel, int image_width, int image_height) {
    // Shared memory to avoid global memory access within a block
    __shared__ unsigned char shared_channel[3 * 1024];

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int sharedMemIdx = threadIdx.x;

    if (index >= image_width * image_height) return; // Boundary check

    // Load data into shared memory
    if (sharedMemIdx < 3 * blockDim.x) {
        shared_channel[sharedMemIdx] = channel[index - 1 + sharedMemIdx];
    }
    __syncthreads();

    // Compute gradient only for valid threads
    if (index > 0 && index < image_width * image_height - 1) {
        int y_kernel[3][3] = { { 1, 2, 1 }, { 0, 0, 0 }, { -1, -2, -1 } };

        y_gradient[index] = y_kernel[0][0] * shared_channel[sharedMemIdx] +
                            y_kernel[1][0] * shared_channel[sharedMemIdx + 1] +
                            y_kernel[2][0] * shared_channel[sharedMemIdx + 2] +
                            y_kernel[0][1] * shared_channel[sharedMemIdx + blockDim.x] +
                            y_kernel[1][1] * shared_channel[sharedMemIdx + blockDim.x + 1] +
                            y_kernel[2][1] * shared_channel[sharedMemIdx + blockDim.x + 2] +
                            y_kernel[0][2] * shared_channel[sharedMemIdx + 2 * blockDim.x] +
                            y_kernel[1][2] * shared_channel[sharedMemIdx + 2 * blockDim.x + 1] +
                            y_kernel[2][2] * shared_channel[sharedMemIdx + 2 * blockDim.x + 2];
    }
}