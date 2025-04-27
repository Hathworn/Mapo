#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolutionParallel(unsigned char* image, unsigned char* new_image, unsigned height, unsigned width, int thread_count, int convolution_size)
{
    // Calculate pixel offset
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int width_out = width - convolution_size + 1;
    int height_out = height - convolution_size + 1;

    // Loop over pixels of smaller image
    for (int i = offset; i < width_out * height_out * 4; i += thread_count)
    {
        int row = i / (4 * width_out);
        int col = i % (4 * width_out);
        int reference_pixel_offset = 4 * row * width + col;
        float sum = 0.0f;
        const float *w;

        // Select weights based on convolution size
        if (convolution_size == 3)
        {
            __shared__ const float w_shared[9];
            if (threadIdx.x < 9) {
                w_shared[threadIdx.x] = ((const float[9]){1, 2, -1, 2, 0.25, -2, 1, -2, -1})[threadIdx.x];
            }
            __syncthreads();
            w = w_shared;
        }
        else if (convolution_size == 5)
        {
            __shared__ const float w_shared[25];
            if (threadIdx.x < 25) {
                w_shared[threadIdx.x] = ((const float[25]){0.5, 0.75, 1, -0.75, -0.5, 0.75, 1, 2, -1, -0.75, 1, 2, 0.25, -2, -1, 0.75, 1, -2, -1, -0.75, 0.5, 0.75, -1, -0.75, -0.5})[threadIdx.x];
            }
            __syncthreads();
            w = w_shared;
        }
        else if (convolution_size == 7)
        {
            __shared__ const float w_shared[49];
            if (threadIdx.x < 49) {
                w_shared[threadIdx.x] = ((const float[49]){0.25, 0.3, 0.5, 0.75, -0.5, -0.3, -0.25, 0.3, 0.5, 0.75, 1, -0.75, -0.5, -0.3, 0.5, 0.75, 1, 2, -1, -0.75, -0.5, 0.75, 1, 2, 0.25, -2, -1, -0.75, 0.5, 0.75, 1, -2, -1, -0.75, -0.5, 0.3, 0.5, 0.75, -1, -0.75, -0.5, -0.3, 0.25, 0.3, 0.5, -0.75, -0.5, -0.3, -0.25})[threadIdx.x];
            }
            __syncthreads();
            w = w_shared;
        }

        // Apply convolution filter
        for (int j = 0; j < convolution_size; j++)
        {
            for (int k = 0; k < convolution_size; k++)
            {
                sum += image[reference_pixel_offset + 4 * k + 4 * j * width] * w[j * convolution_size + k];
            }
        }

        // Clamp and apply alpha channel setting
        sum = fminf(fmaxf(sum, 0.0f), 255.0f);
        if ((i + 1) % 4 == 0) sum = 255.0f;

        new_image[i] = (int)sum;
    }
}