#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16
#define BLOCKSIZE_X 16
#define BLOCKSIZE_Y 16

__global__ void readChannelKernel(unsigned char *image, unsigned char *channel, int imageW, int imageH, int channelToExtract, int numChannels) {
    // Calculate global thread coordinates
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within image bounds to avoid out-of-bound access
    if (x < imageW && y < imageH) {
        int posIn = y * (imageW * numChannels) + (x * numChannels) + channelToExtract;
        int posOut = y * imageW + x;

        // Extract channel data
        channel[posOut] = image[posIn];
    }
}