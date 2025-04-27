#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void histogram_kernel(float* magnitude, float* phase, float* histograms, int input_width, int input_height, int cell_grid_width, int cell_grid_height, int magnitude_step, int phase_step, int histograms_step, int cell_width, int cell_height, int num_bins)
{
    // Shared memory for storing intermediate results
    __shared__ int s_lbin_pos[64];
    __shared__ float s_lbin[64];
    __shared__ int s_rbin_pos[64];
    __shared__ float s_rbin[64];
    __shared__ float s_hist[9 * 8];
    
    // Calculate pixel positions
    int pixel_x = blockIdx.x * blockDim.x + threadIdx.x;
    if(pixel_x >= input_width) return;
    int pixel_y = blockIdx.y * blockDim.y + threadIdx.y;
    if(pixel_y >= input_height) return;
    
    int mag_pixel_idx = pixel_y * magnitude_step + pixel_x;
    int phase_pixel_idx = pixel_y * phase_step + pixel_x;
    
    // Phase normalization
    float bin_size = 1.0f / (float)num_bins;
    int left_bin = (int)floor((phase[phase_pixel_idx] / bin_size) - 0.5f);
    left_bin = (left_bin + num_bins) % num_bins;
    int right_bin = (left_bin + 1);
    float delta = (phase[phase_pixel_idx] / bin_size) - right_bin;
    if(delta < -0.5) delta += num_bins;
    right_bin = right_bin % num_bins;

    // Store bin positions and amounts
    s_lbin_pos[threadIdx.x] = left_bin;
    s_lbin[threadIdx.x] = (0.5f - delta) * magnitude[mag_pixel_idx];
    s_rbin_pos[threadIdx.x] = right_bin;
    s_rbin[threadIdx.x] = (0.5f + delta) * magnitude[mag_pixel_idx];

    // Synchronize threads to ensure shared memory writes are complete
    __syncthreads();

    // Initialize shared histograms
    s_hist[threadIdx.x] = 0.0f;
    if(threadIdx.x < 8) s_hist[threadIdx.x + 64] = 0.0f;

    int cell_y = pixel_y / cell_height;

    // Calculate partial histograms in separate threads
    if(threadIdx.x < 8)
    {
        int s_hist_idx = 9 * threadIdx.x;
        for(int i = 1; i < 8; ++i)
        {
            s_hist[s_hist_idx + s_lbin_pos[8 * threadIdx.x + i]] += s_lbin[8 * threadIdx.x + i];
            s_hist[s_hist_idx + s_rbin_pos[8 * threadIdx.x + i]] += s_rbin[8 * threadIdx.x + i];
        }
    }

    // Synchronize threads before atomic operations
    __syncthreads();

    // Atomic addition to global histograms
    int out_idx = cell_y * histograms_step + threadIdx.x;
    atomicAdd(&(histograms[out_idx]), s_hist[threadIdx.x]);

    if(threadIdx.x < 8)
    {
        atomicAdd(&(histograms[out_idx + 64]), s_hist[threadIdx.x + 64]);
    }
}