#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_iteration(char* buffer, char* out_buffer, size_t pitch, size_t pitch_out, int width, int height)
{
    const int x = blockDim.x * blockIdx.x + threadIdx.x;
    const int y = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Early exit for threads outside the valid computation area
    if (x >= width || y >= height)
        return;

    // Using local variables for repetitive calculations to improve readability and performance
    int idx = y * pitch + x;
    int left_x = (x - 1 + width) % width;
    int right_x = (x + 1) % width;
    int up_y = (y - 1 + height) % height;
    int down_y = (y + 1) % height;

    // Optimize access by storing common expressions to reduce repeated calculations and improve memory coalescing
    int up_idx = up_y * pitch;
    int down_idx = down_y * pitch;

    char n_alive = buffer[up_idx + left_x] + buffer[up_idx + x]
                 + buffer[up_idx + right_x] + buffer[idx - 1]
                 + buffer[idx + 1] + buffer[down_idx + left_x]
                 + buffer[down_idx + x] + buffer[down_idx + right_x];

    // Write the result into the output buffer
    out_buffer[idx] = (n_alive == 3 || (buffer[idx] && n_alive == 2));
}