#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void optimalTransposeKernel(const float *input, float *output, int n)
{
    // Use shared memory for efficient block-wise transpose
    __shared__ float tile[64][65];
    // Calculate global x and y indices
    int global_x = blockIdx.x * 64 + threadIdx.x;
    int global_y = blockIdx.y * 64 + threadIdx.y;
    // Constants for maximum width and height based on grid dimensions
    const int max_width = gridDim.x * 64;
    const int max_height = gridDim.y * 64;
    
    // Load data into shared memory in a coalesced fashion
    if (global_x < max_width && global_y < max_height) {
        tile[threadIdx.y][threadIdx.x] = input[global_y * max_width + global_x];
        tile[threadIdx.y + 16][threadIdx.x] = input[(global_y + 16) * max_width + global_x];
        tile[threadIdx.y + 32][threadIdx.x] = input[(global_y + 32) * max_width + global_x];
        tile[threadIdx.y + 48][threadIdx.x] = input[(global_y + 48) * max_width + global_x];
    }
    __syncthreads();

    // Calculate transposed x and y indices for output
    int transposed_x = blockIdx.y * 64 + threadIdx.x;
    int transposed_y = blockIdx.x * 64 + threadIdx.y;
    
    // Store transposed data from shared memory back to global memory
    if (transposed_y < max_width && transposed_x < max_height) {
        output[transposed_y * max_height + transposed_x] = tile[threadIdx.x][threadIdx.y];
        output[(transposed_y + 16) * max_height + transposed_x] = tile[threadIdx.x][threadIdx.y + 16];
        output[(transposed_y + 32) * max_height + transposed_x] = tile[threadIdx.x][threadIdx.y + 32];
        output[(transposed_y + 48) * max_height + transposed_x] = tile[threadIdx.x][threadIdx.y + 48];
    }
}