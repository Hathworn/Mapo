#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void tonemap(float* d_x, float* d_y, float* d_log_Y, float* d_cdf_norm, float* d_r_new, float* d_g_new, float* d_b_new, float min_log_Y, float max_log_Y, float log_Y_range, int num_bins, int num_pixels_y, int num_pixels_x)
{
    int nx = num_pixels_x;
    int ny = num_pixels_y;
    int2 image_index_2d = make_int2((blockIdx.x * blockDim.x) + threadIdx.x, (blockIdx.y * blockDim.y) + threadIdx.y);

    // Optimized to prevent out of bounds calculations immediately
    if (image_index_2d.x >= nx || image_index_2d.y >= ny) return;

    int image_index_1d = (nx * image_index_2d.y) + image_index_2d.x;

    float x = d_x[image_index_1d];
    float y = d_y[image_index_1d];
    float log_Y = d_log_Y[image_index_1d];

    // Precompute values to reduce repetitive division
    float inv_log_Y_range = 1.0f / log_Y_range; 

    int bin_index = min(num_bins - 1, int((num_bins * (log_Y - min_log_Y) * inv_log_Y_range)));
    float Y_new = d_cdf_norm[bin_index];

    float inv_y = 1.0f / y;
    float X_new = x * (Y_new * inv_y);
    float Z_new = (1.0f - x - y) * (Y_new * inv_y);

    float r_new = (X_new * 3.2406f) + (Y_new * -1.5372f) + (Z_new * -0.4986f);
    float g_new = (X_new * -0.9689f) + (Y_new * 1.8758f) + (Z_new * 0.0415f);
    float b_new = (X_new * 0.0557f) + (Y_new * -0.2040f) + (Z_new * 1.0570f);

    d_r_new[image_index_1d] = r_new;
    d_g_new[image_index_1d] = g_new;
    d_b_new[image_index_1d] = b_new;
}