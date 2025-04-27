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

/**
* Reads a BMP 24bpp file and returns a BMPImage structure.
* Thanks to https://stackoverflow.com/a/9296467
*/
__device__ float gpu_applyFilter(float *image, int stride, float *matrix, int filter_dim)
{
    float pixel = 0.0f;
    for (int h = 0; h < filter_dim; h++)
    {
        int offset = h * stride;
        int offset_kernel = h * filter_dim;
        for (int w = 0; w < filter_dim; w++)
        {
            pixel += image[offset + w] * matrix[offset_kernel + w];
        }
    }
    return pixel;
}

__global__ void gpu_sobel(int width, int height, float *image, float *image_out)
{
    __shared__ float sh_block[BLOCK_SIZE_SH * BLOCK_SIZE_SH];

    // Load Sobel kernels into shared memory
    __shared__ float sobel_x[9];
    __shared__ float sobel_y[9];
    if (threadIdx.x < 9) {
        sobel_x[threadIdx.x] = (threadIdx.x == 0 || threadIdx.x == 6) ? 1.0f : (threadIdx.x == 1 || threadIdx.x == 7) ? 0.0f : (threadIdx.x == 2 || threadIdx.x == 8) ? -1.0f : (threadIdx.x == 3 || threadIdx.x == 5) ? 2.0f : 0.0f;
        sobel_y[threadIdx.x] = (threadIdx.x == 0 || threadIdx.x == 2) ? 1.0f : (threadIdx.x == 3 || threadIdx.x == 5) ? 2.0f : (threadIdx.x == 6 || threadIdx.x == 8) ? -1.0f : 0.0f;
    }
    __syncthreads();

    // Calculate global indices
    const int index_x = blockIdx.x * blockDim.x + threadIdx.x;
    const int index_y = blockIdx.y * blockDim.y + threadIdx.y;

    if (index_x < (width - 2) && index_y < (height - 2))
    {
        int offset_t = index_y * width + index_x;
        int offset   = (index_y + 1) * width + (index_x + 1);
        int offset_shared = threadIdx.y * BLOCK_SIZE_SH + threadIdx.x;

        // Load data to shared memory
        sh_block[offset_shared] = image[offset_t];
        
        // Handle boundary conditions more efficiently
        if (threadIdx.y < 3 && index_y < height - 3) {
            sh_block[offset_shared + BLOCK_SIZE_SH] = image[offset_t + width];
            sh_block[offset_shared + BLOCK_SIZE_SH * 2] = image[offset_t + 2 * width];
        }
        if (threadIdx.x < 3 && index_x < width - 3) {
            sh_block[offset_shared + 1] = image[offset_t + 1];
            sh_block[offset_shared + 2] = image[offset_t + 2];
        }
        
        __syncthreads();

        float gx = gpu_applyFilter(&sh_block[offset_shared], BLOCK_SIZE_SH, sobel_x, 3);
        float gy = gpu_applyFilter(&sh_block[offset_shared], BLOCK_SIZE_SH, sobel_y, 3);

        // Compute the magnitude and store it
        image_out[offset] = sqrtf(gx * gx + gy * gy);
    }
}