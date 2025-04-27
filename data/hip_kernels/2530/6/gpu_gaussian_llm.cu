#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __host__ float cpu_applyFilter(float *image, int stride, float *matrix, int filter_dim)
{
    float pixel = 0.0f;

    for (int h = 0; h < filter_dim; h++)
    {
        int offset        = h * stride;
        int offset_kernel = h * filter_dim;

        for (int w = 0; w < filter_dim; w++)
        {
            pixel += image[offset + w] * matrix[offset_kernel + w];
        }
    }

    return pixel;
}

__global__ void gpu_gaussian(int width, int height, float *image, float *image_out)
{
    // Pre-compute effective block size:
    const int blockSizeEffective = blockDim.x * blockDim.y;
    
    // Define Gaussian filter:
    __shared__ float gaussian[9];
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        gaussian[0] = 1.0f / 16.0f; gaussian[1] = 2.0f / 16.0f; gaussian[2] = 1.0f / 16.0f;
        gaussian[3] = 2.0f / 16.0f; gaussian[4] = 4.0f / 16.0f; gaussian[5] = 2.0f / 16.0f;
        gaussian[6] = 1.0f / 16.0f; gaussian[7] = 2.0f / 16.0f; gaussian[8] = 1.0f / 16.0f;
    }
    __syncthreads();

    int index_x = blockIdx.x * blockDim.x + threadIdx.x;
    int index_y = blockIdx.y * blockDim.y + threadIdx.y;

    int offset_t = index_y * width + index_x; // Input for function

    // Prepare input for shared memory:
    __shared__ float sh_block[BLOCK_SIZE_SH * BLOCK_SIZE_SH];
    
    // Load image data into shared memory:
    if (index_x < width && index_y < height) {
        sh_block[threadIdx.y * BLOCK_SIZE_SH + threadIdx.x] = image[offset_t];
    }
    __syncthreads();

    int offset = (index_y + 1) * width + (index_x + 1); // Output to store in result

    // Ensure valid execution within image bounds:
    if (index_x < (width - 2) && index_y < (height - 2))
    {
        image_out[offset] = cpu_applyFilter(&sh_block[threadIdx.y * BLOCK_SIZE_SH + threadIdx.x],
                                            BLOCK_SIZE_SH, gaussian, 3);
    }
}