#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaComputeYGradient(int* y_gradient, unsigned char* channel, int image_width, int image_height, int chunk_size_per_thread) {
    // Shared memory for tile loading
    __shared__ unsigned char tile[1024]; // Assume a block size of 1024 threads, adjust accordingly

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int block_start = index * chunk_size_per_thread;
    int block_end = (index + 1) * chunk_size_per_thread - 1;

    // Load data into shared memory
    int local_index = threadIdx.x;
    if (block_start + local_index < image_width * image_height) {
        tile[local_index] = channel[block_start + local_index];
    }
    __syncthreads();

    for (int i = block_start; i < block_end; i++) {
        if (i + 2 * image_width + 1 < image_width * image_height) {
            if (i == 0 && blockIdx.x == 0 && threadIdx.x == 0) {
                continue;
            } else {
                int value = 
                    tile[local_index - 1] + 2 * tile[local_index] + tile[local_index + 1] +
                    channel[i + image_width - 1] + 2 * channel[i + image_width] + channel[i + image_width + 1] +
                    channel[i + 2 * image_width - 1] + 2 * channel[i + 2 * image_width] + channel[i + 2 * image_width + 1];
                y_gradient[i] = value - (
                    tile[local_index - 1] + tile[local_index] + tile[local_index + 1] + 
                    channel[i + image_width - 1] + channel[i + image_width] + channel[i + image_width + 1] +
                    channel[i + 2 * image_width - 1] + channel[i + 2 * image_width] + channel[i + 2 * image_width + 1]);
            }
        }
    }
    return;
}