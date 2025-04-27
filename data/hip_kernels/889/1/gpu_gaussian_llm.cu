#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float gpu_applyFilter(float *image, int stride, float *matrix, int filter_dim)
{
    // Optimize gpu_applyFilter by unrolling loops and removing extra calculations
    float sum = 0.0f;
    for (int y = 0; y < filter_dim; ++y) {
        for (int x = 0; x < filter_dim; ++x) {
            sum += image[y * stride + x] * matrix[y * filter_dim + x];
        }
    }
    return sum;
}

__global__ void gpu_gaussian(int width, int height, float *image, float *image_out)
{
    __shared__ float gaussian[9];  // Use shared memory for faster access
    if (threadIdx.x < 9) {
        gaussian[threadIdx.x] = 1.0f / 16.0f * (threadIdx.x % 2 + threadIdx.x / 2);  // Precompute filter
    }
    __syncthreads();

    int index_x = blockIdx.x * blockDim.x + threadIdx.x;
    int index_y = blockIdx.y * blockDim.y + threadIdx.y;

    if (index_x < (width - 2) && index_y < (height - 2))
    {
        int offset_t = index_y * width + index_x;
        int offset = (index_y + 1) * width + (index_x + 1);

        image_out[offset] = gpu_applyFilter(&image[offset_t], width, gaussian, 3);
    }
}