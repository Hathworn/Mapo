#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tonemap( float* d_x, float* d_y, float* d_log_Y, float* d_cdf_norm, float* d_r_new, float* d_g_new, float* d_b_new, float  min_log_Y, float  max_log_Y, float  log_Y_range, int    num_bins, int    num_pixels_y, int    num_pixels_x )
{
    int nx = num_pixels_x;
    int ny = num_pixels_y;

    // Calculate 1D index and check bounds for early return
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;
    if (x >= nx || y >= ny) return;
    
    int image_index_1d = (nx * y) + x;

    float value_x = d_x[image_index_1d];
    float value_y = d_y[image_index_1d];
    float value_log_Y = d_log_Y[image_index_1d];

    // Direct calculation of bin_index with fminf to avoid extra comparison
    int bin_index = fminf(num_bins - 1, int((num_bins * (value_log_Y - min_log_Y)) / log_Y_range));
    float Y_new = d_cdf_norm[bin_index];

    float Y_over_y = Y_new / value_y;  // Pre-compute reused ratio 
    float X_new = value_x * Y_over_y;
    float Z_new = (1.0f - value_x - value_y) * Y_over_y;

    // Streamlined computation to remove redundancy
    d_r_new[image_index_1d] = fmaf(X_new, 3.2406f, fmaf(Y_new, -1.5372f, Z_new * -0.4986f));
    d_g_new[image_index_1d] = fmaf(X_new, -0.9689f, fmaf(Y_new, 1.8758f, Z_new * 0.0415f));
    d_b_new[image_index_1d] = fmaf(X_new, 0.0557f, fmaf(Y_new, -0.2040f, Z_new * 1.0570f));
}