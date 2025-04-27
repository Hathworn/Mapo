#include "hip/hip_runtime.h"
#include "includes.h"

hipEvent_t start, stop;

__global__ void cudaComputeYGradient(int* y_gradient, unsigned char* channel, int image_width, int image_height) {
    // Define the y_kernel locally in shared memory for faster access
    __shared__ int y_kernel[3][3];
    if (threadIdx.x < 3 && threadIdx.y < 3) { 
        int temp[3][3] = { { 1, 2, 1 }, { 0, 0, 0 }, { -1, -2, -1 } };
        y_kernel[threadIdx.x][threadIdx.y] = temp[threadIdx.x][threadIdx.y];
    }
    __syncthreads();
    
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check valid index bounds to avoid accessing out of bounds memory
    if (index >= image_width && index < (image_height - 1) * image_width && index % image_width != 0 && index % image_width != image_width - 1) {
        y_gradient[index] =
            y_kernel[0][0] * channel[index - 1] +
            y_kernel[1][0] * channel[index] +
            y_kernel[2][0] * channel[index + 1] +
            y_kernel[0][1] * channel[index + image_width - 1] +
            y_kernel[1][1] * channel[index + image_width] +
            y_kernel[2][1] * channel[index + image_width + 1] +
            y_kernel[0][2] * channel[index + 2 * image_width - 1] +
            y_kernel[1][2] * channel[index + 2 * image_width] +
            y_kernel[2][2] * channel[index + 2 * image_width + 1];
    }
}