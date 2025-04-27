#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __host__ float cpu_applyFilter(float *image, int stride, float *matrix, int filter_dim)
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
    
    float sobel_x[9] = { 1.0f,  0.0f, -1.0f,
                         2.0f,  0.0f, -2.0f,
                         1.0f,  0.0f, -1.0f };
    float sobel_y[9] = { 1.0f,  2.0f,  1.0f,
                         0.0f,  0.0f,  0.0f,
                        -1.0f, -2.0f, -1.0f };

    int index_x = blockIdx.x * blockDim.x + threadIdx.x;
    int index_y = blockIdx.y * blockDim.y + threadIdx.y;

    int offset_t = index_y * width + index_x; // Input for function
    int offset = (index_y + 1) * width + (index_x + 1); // Output to store in result

    // Shared memory offset (for input value):
    int offset_shared = threadIdx.y * BLOCK_SIZE_SH + threadIdx.x;

    // Load shared memory with boundary checks
    if (index_x < width && index_y < height) {
        sh_block[offset_shared] = image[offset_t];
        
        // Load extra elements for edges
        if (threadIdx.x < 2 && (index_x + 2) < width) {
            sh_block[offset_shared + 1] = image[offset_t + 1];
            sh_block[offset_shared + 2] = image[offset_t + 2];
        }
        if (threadIdx.y < 2 && (index_y + 2) < height) {
            sh_block[offset_shared + BLOCK_SIZE_SH] = image[offset_t + width];
            sh_block[offset_shared + 2 * BLOCK_SIZE_SH] = image[offset_t + 2 * width];
        }
        if (threadIdx.x < 2 && threadIdx.y < 2 && (index_x + 2) < width && (index_y + 2) < height) {
            sh_block[offset_shared + BLOCK_SIZE_SH + 1] = image[offset_t + width + 1];
            sh_block[offset_shared + BLOCK_SIZE_SH + 2] = image[offset_t + width + 2];
            sh_block[offset_shared + 2 * BLOCK_SIZE_SH + 1] = image[offset_t + 2 * width + 1];
            sh_block[offset_shared + 2 * BLOCK_SIZE_SH + 2] = image[offset_t + 2 * width + 2];
        }
    }
    __syncthreads();

    if (index_x < (width - 2) && index_y < (height - 2))
    {
        float gx = cpu_applyFilter(&sh_block[offset_shared], BLOCK_SIZE_SH, sobel_x, 3);
        float gy = cpu_applyFilter(&sh_block[offset_shared], BLOCK_SIZE_SH, sobel_y, 3);
        image_out[offset] = sqrtf(gx * gx + gy * gy);
    }
}