#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE  16
#define HEADER_SIZE 122
#define BLOCK_SIZE_SH 18

typedef unsigned char BYTE;

/**
* Structure that represents a BMP image.
*/
typedef struct
{
    int   width;
    int   height;
    float *data;
} BMPImage;

typedef struct timeval tval;

BYTE g_info[HEADER_SIZE]; // Reference header

__global__ void gpu_grayscale(int width, int height, float *image, float *image_out)
{
    // Calculate pixel index
    const int h = blockIdx.y * blockDim.y + threadIdx.y;
    const int w = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds
    if (h < height && w < width)
    {
        // Shared memory for pixel data to reduce global memory access
        __shared__ float pixel_block[BLOCK_SIZE][BLOCK_SIZE][3];

        int imageOffset = (h * width + w) * 3;
        int blockOffset = threadIdx.y * blockDim.x + threadIdx.x;

        // Load pixel data into shared memory
        for (int i = 0; i < 3; i++)
        {
            pixel_block[threadIdx.y][threadIdx.x][i] = image[imageOffset + i];
        }
        
        __syncthreads(); // Synchronize threads within block

        // Compute grayscale in shared memory
        image_out[h * width + w] = pixel_block[threadIdx.y][threadIdx.x][0] * 0.0722f + // B
                                   pixel_block[threadIdx.y][threadIdx.x][1] * 0.7152f + // G
                                   pixel_block[threadIdx.y][threadIdx.x][2] * 0.2126f;  // R
    }
}