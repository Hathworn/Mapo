```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaComputeYGradient(int* y_gradient, unsigned char* channel, int image_width, int image_height, int chunk_size_per_thread) {
    // Use shared memory for y_kernel to optimize memory access
    __shared__ int y_kernel[3][3];
    if (threadIdx.x == 0) {
        y_kernel[0][0] = 1; y_kernel[0][1] = 2; y_kernel[0][2] = 1;
        y_kernel[1][0] = 0; y_kernel[1][1] = 0; y_kernel[1][2] = 0;
        y_kernel[2][0] = -1; y_kernel[2][1] = -2; y_kernel[2][2] = -1;
    }
    __syncthreads();

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int start = index * chunk_size_per_thread;
    int end = min(start + chunk_size_per_thread, image_width * image_height - 1);

    for (int i = start; i < end; i++) {
        if (i + 2 * image_width + 1 < image_width * image_height) {
            if (!(i == 0 && blockIdx.x == 0 && threadIdx.x == 0)) { // Correct thread check
                y_gradient[i] =
                    y_kernel[0][0] * channel[i - 1] +
                    y_kernel[1][0] * channel[i] +
                    y_kernel[2][0] * channel[i + 1] +
                    y_kernel[0][1] * channel[i + image_width - 1] +
                    y_kernel[1][1] * channel[i + image_width] +
                    y_kernel[2][1] * channel[i + image_width + 1] +
                    y_kernel[0][2] * channel[i + 2 * image_width - 1] +
                    y_kernel[1][2] * channel[i + 2 * image_width] +
                    y_kernel[2][2] * channel[i + 2 * image_width + 1];
            }
        }
    }
}