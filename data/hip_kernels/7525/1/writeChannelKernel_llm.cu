#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16
#define BLOCKSIZE_X 16
#define BLOCKSIZE_Y 16

// Optimize global kernel function to reduce potential bank conflicts and improve performance
__global__ void writeChannelKernel(unsigned char* __restrict__ image, const unsigned char* __restrict__ channel, int imageW, int imageH, int channelToMerge, int numChannels) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure within image bounds to avoid out-of-bounds memory access
    if (x < imageW && y < imageH) {
        int posOut = y * (imageW * numChannels) + (x * numChannels) + channelToMerge;
        int posIn = y * imageW + x;
        image[posOut] = channel[posIn];
    }
}