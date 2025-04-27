#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK_X 16
#define THREADS_PER_BLOCK_Y 16

__global__ void tonemap( float* d_x, float* d_y, float* d_log_Y, float* d_cdf_norm, float* d_r_new, float* d_g_new, float* d_b_new, float  min_log_Y, float  max_log_Y, float  log_Y_range, int    num_bins, int    num_pixels_y, int    num_pixels_x )
{
    int image_index_2d_x = blockIdx.x * THREADS_PER_BLOCK_X + threadIdx.x;
    int image_index_2d_y = blockIdx.y * THREADS_PER_BLOCK_Y + threadIdx.y;
    int image_index_1d = image_index_2d_y * num_pixels_x + image_index_2d_x;

    // Ensure threads are within image bounds
    if (image_index_2d_x < num_pixels_x && image_index_2d_y < num_pixels_y)
    {
        float x = d_x[image_index_1d];
        float y = d_y[image_index_1d];
        float log_Y = d_log_Y[image_index_1d];
        
        // Pre-compute bin index outside of condition
        int bin_index = min(num_bins - 1, int((num_bins * (log_Y - min_log_Y)) / log_Y_range));
        float Y_new = d_cdf_norm[bin_index];

        // Use fused multiply-adds for potential optimization
        float inv_y = 1.0f / y;
        float X_new = x * (Y_new * inv_y);
        float Z_new = (1.0f - x - y) * (Y_new * inv_y);

        float r_new = fmaf(X_new, 3.2406f, fmaf(Y_new, -1.5372f, Z_new * -0.4986f));
        float g_new = fmaf(X_new, -0.9689f, fmaf(Y_new, 1.8758f, Z_new * 0.0415f));
        float b_new = fmaf(X_new, 0.0557f, fmaf(Y_new, -0.2040f, Z_new * 1.0570f));

        d_r_new[image_index_1d] = r_new;
        d_g_new[image_index_1d] = g_new;
        d_b_new[image_index_1d] = b_new;
    }
}