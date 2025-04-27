#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaComputeXGradient(int* x_gradient, unsigned char* channel, int image_width, int image_height, int chunk_size_per_thread) {
    __shared__ unsigned char shared_channel[1024]; // Using shared memory for faster access
    int x_kernel[3][3] = { { 1, 0, -1 }, { 2, 0, -2 }, { 1, 0, -1 } };

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int start = index * chunk_size_per_thread;
    int end = min(image_width * image_height, (index + 1) * chunk_size_per_thread);

    for (int i = start; i < end; i++) {
        if (i + 2 * image_width + 1 < image_width * image_height) {
            // Load data into shared memory
            shared_channel[threadIdx.x] = channel[i];
            __syncthreads(); // Make sure all threads have loaded their data

            if (i > 0 && i % image_width != 0 && i % image_width != image_width - 1) {
                x_gradient[i] =
                    x_kernel[0][0] * shared_channel[threadIdx.x - 1] +
                    x_kernel[1][0] * shared_channel[threadIdx.x] +
                    x_kernel[2][0] * shared_channel[threadIdx.x + 1] +
                    x_kernel[0][1] * shared_channel[threadIdx.x + blockDim.x - 1] +
                    x_kernel[1][1] * shared_channel[threadIdx.x + blockDim.x] +
                    x_kernel[2][1] * shared_channel[threadIdx.x + blockDim.x + 1] +
                    x_kernel[0][2] * shared_channel[threadIdx.x + 2 * blockDim.x - 1] +
                    x_kernel[1][2] * shared_channel[threadIdx.x + 2 * blockDim.x] +
                    x_kernel[2][2] * shared_channel[threadIdx.x + 2 * blockDim.x + 1];
            }
        }
    }
}