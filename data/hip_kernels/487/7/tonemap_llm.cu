#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void tonemap(float* d_x, float* d_y, float* d_log_Y, float* d_cdf_norm, float* d_r_new, float* d_g_new, float* d_b_new, float min_log_Y, float max_log_Y, float log_Y_range, int num_bins, int num_pixels_y, int num_pixels_x)
{
    int nx = num_pixels_x;
    int image_index_1d = (blockIdx.y * blockDim.y + threadIdx.y) * nx + (blockIdx.x * blockDim.x + threadIdx.x);

    if (blockIdx.x * blockDim.x + threadIdx.x < nx && blockIdx.y * blockDim.y + threadIdx.y < num_pixels_y)
    {
        float x = d_x[image_index_1d];
        float y = d_y[image_index_1d];
        float log_Y = d_log_Y[image_index_1d];
        int bin_index = min(num_bins - 1, int((num_bins * (log_Y - min_log_Y)) / log_Y_range));
        float Y_new = d_cdf_norm[bin_index];

        float X_new = x * (Y_new / y);
        float Z_new = (1 - x - y) * (Y_new / y);

        // Calculate RGB values using linear transformation
        d_r_new[image_index_1d] = (X_new * 3.2406f) + (Y_new * -1.5372f) + (Z_new * -0.4986f);
        d_g_new[image_index_1d] = (X_new * -0.9689f) + (Y_new * 1.8758f) + (Z_new * 0.0415f);
        d_b_new[image_index_1d] = (X_new * 0.0557f) + (Y_new * -0.2040f) + (Z_new * 1.0570f);
    }
}