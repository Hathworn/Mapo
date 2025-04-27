#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolution_kernel_v1(float *d_output, float *d_input, float *d_filter, int num_row, int num_col, int filter_size)
{
    // Compute thread's global position to improve coalesced memory access
    int idx_x = blockDim.x * blockIdx.x + threadIdx.x;
    int idx_y = blockDim.y * blockIdx.y + threadIdx.y;

    // Define shared memory for filter to reduce global memory access
    extern __shared__ float shared_filter[];

    // Load filter into shared memory
    int filter_idx = threadIdx.y * blockDim.x + threadIdx.x;
    if (filter_idx < filter_size * filter_size) {
        shared_filter[filter_idx] = d_filter[filter_idx];
    }
    __syncthreads();

    float result = 0.f;
    for (int filter_row = -filter_size / 2; filter_row <= filter_size / 2; ++filter_row)
    {
        for (int filter_col = -filter_size / 2; filter_col <= filter_size / 2; ++filter_col)
        {
            // Compute memory access indices only once per iteration
            int image_row = idx_y + filter_row;
            int image_col = idx_x + filter_col;

            // Use conditional operator to improve branch prediction
            float image_value = (image_row >= 0 && image_row < num_row && image_col >= 0 && image_col < num_col) ?
                                d_input[image_row * num_col + image_col] : 0.f;

            int filter_index = (filter_row + filter_size / 2) * filter_size + filter_col + filter_size / 2;
            result += image_value * shared_filter[filter_index];
        }
    }

    // Ensure coalesced write back to global memory
    if (idx_x < num_col && idx_y < num_row) {
        d_output[idx_y * num_col + idx_x] = result;
    }
}