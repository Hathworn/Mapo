#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void max_pooling(unsigned char* original_img, unsigned char* new_img, unsigned int width, unsigned int num_thread, unsigned int size) {
    // Calculate a unique global thread ID
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop over the elements assigned to this thread
    for (int i = tid; i < size / 4; i += num_thread) {
        unsigned int position = i + (4 * (i / 4)) + (width * 4 * (i / (width * 2)));
        // Initialize max with the first value in the pooling window
        unsigned char max = original_img[position];

        // Compare with the other values in the pooling window
        max = max > original_img[position + 4] ? max : original_img[position + 4];
        max = max > original_img[position + width] ? max : original_img[position + width];
        max = max > original_img[position + width + 4] ? max : original_img[position + width + 4];

        // Store the max value in the output image
        new_img[i] = max;
    }
}