#include "hip/hip_runtime.h"
#include "includes.h"

#define PI 3.1415926536f

int MaxThreadsPerBlock;
int MaxThreadsX;
int MaxThreadsY;

// Optimized FillTexByte kernel
__global__ void FillTexByte(void *surface, int width, int height, size_t pitch, char* src, int Mask)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Return if the thread is out of bounds
    if (x >= width || y >= height) return;

    // Calculate linear index for source
    char w = src[x + width * y];

    // Calculate pixel pointer address in surface
    unsigned char *pixel1 = (unsigned char *)((char *)surface + y * pitch) + 4 * x;

    // Apply mask and update pixel value
    #pragma unroll
    for (int i = 0; i < 4; i++) {
        if (Mask & (1 << i)) {
            pixel1[i] = w;
        }
    }
}