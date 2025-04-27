#include "hip/hip_runtime.h"
#include "includes.h"

#define FILTER_RADIUS 1
#define BLOCK_WIDTH (TILE_WIDTH + 2 * FILTER_RADIUS)
#define BLOCK_HEIGHT (TILE_HEIGHT + 2 * FILTER_RADIUS)
#define FILTER_AREA ((2 * FILTER_RADIUS + 1) * (2 * FILTER_RADIUS + 1))

__global__ void sobelFilterShared3(unsigned char* g_DataIn, unsigned char *g_DataOut, unsigned int width, unsigned int height) {
    extern __shared__ char sharedMem[];

    int x = blockIdx.x * TILE_WIDTH + threadIdx.x - FILTER_RADIUS;
    int y = blockIdx.y * TILE_HEIGHT + threadIdx.y - FILTER_RADIUS;

    // Clamp to the center
    x = max(FILTER_RADIUS, min(x, width - FILTER_RADIUS - 1));
    y = max(FILTER_RADIUS, min(y, height - FILTER_RADIUS - 1));

    unsigned int index = y * width + x;
    unsigned int sharedIndex = threadIdx.y * blockDim.x + threadIdx.x;

    // Load data into shared memory
    sharedMem[sharedIndex] = g_DataIn[index];
    __syncthreads();

    if(    threadIdx.x >= FILTER_RADIUS && threadIdx.x < blockDim.x - FILTER_RADIUS
        && threadIdx.y >= FILTER_RADIUS && threadIdx.y < blockDim.y - FILTER_RADIUS) {
        
        int sum = 0;
        for(int dy = -FILTER_RADIUS; dy <= FILTER_RADIUS; ++dy) {
            for(int dx = -FILTER_RADIUS; dx <= FILTER_RADIUS; ++dx) {
                // Calculate offset in shared memory
                int sharedOffset = (threadIdx.y + dy) * blockDim.x + (threadIdx.x + dx);
                sum += (int)sharedMem[sharedOffset];
            }
        }
        // Write result to global memory
        g_DataOut[index] = (unsigned char)(sum / FILTER_AREA);
    }
}