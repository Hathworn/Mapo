#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tonemap(float* d_x, float* d_y, float* d_log_Y, float* d_cdf_norm, float* d_r_new, float* d_g_new, float* d_b_new, float min_log_Y, float max_log_Y, float log_Y_range, int num_bins, int num_pixels_y, int num_pixels_x)
{
    int nx = num_pixels_x;
    int ny = num_pixels_y;
    int2 image_index_2d = make_int2((blockIdx.x * blockDim.x) + threadIdx.x, (blockIdx.y * blockDim.y) + threadIdx.y);
    int image_index_1d = (nx * image_index_2d.y) + image_index_2d.x;

    // Ensure thread is within image bounds
    if (image_index_2d.x < nx && image_index_2d.y < ny)
    {
        float x = d_x[image_index_1d];
        float y = d_y[image_index_1d];
        float log_Y = d_log_Y[image_index_1d];
        int bin_index = min(num_bins - 1, static_cast<int>((num_bins * (log_Y - min_log_Y)) / log_Y_range));
        float Y_new = d_cdf_norm[bin_index];

        // Perform calculations once; reuse to save computations
        float Y_div_y = Y_new / y;
        float X_new = x * Y_div_y;
        float Z_new = (1 - x - y) * Y_div_y;

        // Use floats instead of multiple constants
        float r_new = fmaf(X_new, 3.2406f, fmaf(Y_new, -1.5372f, Z_new * -0.4986f));
        float g_new = fmaf(X_new, -0.9689f, fmaf(Y_new, 1.8758f, Z_new * 0.0415f));
        float b_new = fmaf(X_new, 0.0557f, fmaf(Y_new, -0.2040f, Z_new * 1.0570f));

        d_r_new[image_index_1d] = r_new;
        d_g_new[image_index_1d] = g_new;
        d_b_new[image_index_1d] = b_new;
    }
}