#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaComputeXGradient(int* x_gradient, unsigned char* channel, int image_width, int image_height, int chunk_size_per_thread) {
    __shared__ int x_kernel[3][3]; // Use shared memory for kernel
    if (threadIdx.x == 0) {
        x_kernel[0][0] = 1; x_kernel[0][1] = 0; x_kernel[0][2] = -1;
        x_kernel[1][0] = 2; x_kernel[1][1] = 0; x_kernel[1][2] = -2;
        x_kernel[2][0] = 1; x_kernel[2][1] = 0; x_kernel[2][2] = -1;
    }
    __syncthreads(); // Synchronize threads to ensure kernel is initialized

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int start_idx = index * chunk_size_per_thread;
    int end_idx = min(start_idx + chunk_size_per_thread, image_width * image_height - 1);

    for (int i = start_idx; i < end_idx; i++) {
        if (i >= image_width && i < image_width * (image_height - 1) - 1) { // Ensure the pixel is not at the border
            x_gradient[i] =
                x_kernel[0][0] * channel[i - 1] +
                x_kernel[1][0] * channel[i] +
                x_kernel[2][0] * channel[i + 1] +
                x_kernel[0][1] * channel[i + image_width - 1] +
                x_kernel[1][1] * channel[i + image_width] +
                x_kernel[2][1] * channel[i + image_width + 1] +
                x_kernel[0][2] * channel[i + 2 * image_width - 1] +
                x_kernel[1][2] * channel[i + 2 * image_width] +
                x_kernel[2][2] * channel[i + 2 * image_width + 1];
        }
    }
}