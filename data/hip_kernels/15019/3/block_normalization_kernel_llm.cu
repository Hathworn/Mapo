#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void block_normalization_kernel(float* histograms, float* descriptor, int histograms_step, int block_grid_width, int block_grid_height, int block_width, int block_height, int num_bins, int cell_grid_width, int block_stride_x, int block_stride_y)
{
    // Shared memory for storing the histograms and L1 norms
    __shared__ float s_blocks[9 * 4 * 8];
    __shared__ float L1_norm[8];

    // Calculate block indices
    int block_x = blockIdx.x * 8 + threadIdx.z;
    int block_y = blockIdx.y;

    // Check for out-of-bound blocks
    if (block_x >= block_grid_width || block_y >= block_grid_height) {
        return;
    }

    // Compute indices for cell and histogram
    int cell_x = block_x * block_stride_x + threadIdx.y % 2;
    int cell_y = block_y * block_stride_y + threadIdx.y / 2;
    int hist_idx = histograms_step * cell_y + num_bins * cell_x + threadIdx.x;
    
    // Compute index for s_blocks
    int s_blocks_idx = 9 * threadIdx.y + threadIdx.x;
    // Load histogram data into shared memory
    s_blocks[s_blocks_idx] = histograms[hist_idx];

    __syncthreads();

    // Compute the L1 norm for the blocks in parallel
    int thread_id = 36 * threadIdx.z + 9 * threadIdx.y + threadIdx.x;
    if (thread_id < 8) {
        float sum = 0.0f;
        for (int i = 0; i < 36; ++i) {  // 36 is 9 bins * 4 cells per block
            sum += s_blocks[36 * thread_id + i];
        }
        L1_norm[thread_id] = sum;
    }

    __syncthreads();

    // Calculate descriptor by normalizing the histogram
    descriptor[histograms_step * (block_y * block_grid_width * 8 + block_x) + s_blocks_idx] =
        s_blocks[s_blocks_idx] / L1_norm[threadIdx.z];
}