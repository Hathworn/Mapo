#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolution_kernel_v1(float *d_output, float *d_input, float *d_filter, int num_row, int num_col, int filter_size)
{
    // Use shared memory for filter
    extern __shared__ float shared_filter[];

    int idx_x = blockDim.x * blockIdx.x + threadIdx.x;
    int idx_y = blockDim.y * blockIdx.y + threadIdx.y;

    // Load filter into shared memory
    int filter_index = threadIdx.y * blockDim.x + threadIdx.x;
    if (filter_index < filter_size * filter_size) {
        shared_filter[filter_index] = d_filter[filter_index];
    }
    __syncthreads(); // Ensure all threads have loaded the filter

    float result = 0.f;

    // Loop unrolling for filter rows and columns
    for (int filter_row = -filter_size / 2; filter_row <= filter_size / 2; ++filter_row)
    {
        for (int filter_col = -filter_size / 2; filter_col <= filter_size / 2; ++filter_col)
        {
            // Find the global position to apply the given filter
            int image_row = idx_y + filter_row;
            int image_col = idx_x + filter_col;

            float image_value = (image_row >= 0 && image_row < num_row && image_col >= 0 && image_col < num_col) ?
                d_input[image_row * num_col + image_col] : 0.f;
            
            // Access shared memory for filter value
            float filter_value = shared_filter[(filter_row + filter_size / 2) * filter_size + filter_col + filter_size / 2];

            result += image_value * filter_value;
        }
    }

    d_output[idx_y * num_col + idx_x] = result;
}