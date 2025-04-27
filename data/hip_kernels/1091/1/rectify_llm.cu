#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rectify(unsigned char * original_img, unsigned char* new_img, unsigned int num_thread, unsigned int size) {
    // Compute the global index of the thread
    unsigned int idx = blockDim.x * blockIdx.x + threadIdx.x;
    // Use stride to handle more than one element per thread if needed
    unsigned int stride = gridDim.x * blockDim.x;

    for (int i = idx; i < size; i += stride) {
        // Apply rectification
        new_img[i] = (original_img[i] < 127) ? 127 : original_img[i];
    }
}