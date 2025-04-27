#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tonemap(float* d_x, float* d_y, float* d_log_Y, float* d_cdf_norm, float* d_r_new, float* d_g_new, float* d_b_new,
                        float min_log_Y, float max_log_Y, float log_Y_range, int num_bins, int num_pixels_y, int num_pixels_x) {
    int nx = num_pixels_x;
    int ny = num_pixels_y;

    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;

    if (x < nx && y < ny) {
        int image_index_1d = (nx * y) + x;

        float x_val = d_x[image_index_1d];
        float y_val = d_y[image_index_1d];
        float log_Y = d_log_Y[image_index_1d];

        int bin_index = min(num_bins - 1, int((num_bins * (log_Y - min_log_Y)) / log_Y_range));
        float Y_new = d_cdf_norm[bin_index];

        float Y_over_y = Y_new / y_val; // Precompute repeated division
        float X_new = x_val * Y_over_y;
        float Z_new = (1 - x_val - y_val) * Y_over_y;

        // Consolidate color transformation calculations
        float r_new = (X_new * 3.2406f) + (Y_new * -1.5372f) + (Z_new * -0.4986f);
        float g_new = (X_new * -0.9689f) + (Y_new * 1.8758f) + (Z_new * 0.0415f);
        float b_new = (X_new * 0.0557f) + (Y_new * -0.2040f) + (Z_new * 1.0570f);

        d_r_new[image_index_1d] = r_new;
        d_g_new[image_index_1d] = g_new;
        d_b_new[image_index_1d] = b_new;
    }
}