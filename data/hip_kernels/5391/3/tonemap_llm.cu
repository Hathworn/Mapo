#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tonemap(float* d_x, float* d_y, float* d_log_Y, float* d_cdf_norm, float* d_r_new, float* d_g_new, float* d_b_new, float min_log_Y, float max_log_Y, float log_Y_range, int num_bins, int num_pixels_y, int num_pixels_x)
{
    int ny = num_pixels_y;
    int nx = num_pixels_x;
    int image_index_2d_x = blockIdx.x * blockDim.x + threadIdx.x;
    int image_index_2d_y = blockIdx.y * blockDim.y + threadIdx.y;
    int image_index_1d = nx * image_index_2d_y + image_index_2d_x;
    
    // Check if indices are within image bounds
    if (image_index_2d_x < nx && image_index_2d_y < ny)
    {
        float x = d_x[image_index_1d];
        float y = d_y[image_index_1d];
        float log_Y = d_log_Y[image_index_1d];
        
        // Simplified expression avoiding function calls inside the loop
        float bin_index_norm = (log_Y - min_log_Y) / log_Y_range;
        int bin_index = min(num_bins - 1, int(num_bins * bin_index_norm));
        float Y_new = d_cdf_norm[bin_index];
        
        // Combined repetitive calculations
        float Y_ratio = Y_new / y;
        float X_new = x * Y_ratio;
        float Z_new = (1 - x - y) * Y_ratio;

        // Precomputed constants for linear transformation
        const float r_const0 =  3.2406f, r_const1 = -1.5372f, r_const2 = -0.4986f;
        float r_new = (X_new * r_const0) + (Y_new * r_const1) + (Z_new * r_const2);

        const float g_const0 = -0.9689f, g_const1 =  1.8758f, g_const2 =  0.0415f;
        float g_new = (X_new * g_const0) + (Y_new * g_const1) + (Z_new * g_const2);
        
        const float b_const0 =  0.0557f, b_const1 = -0.2040f, b_const2 =  1.0570f;
        float b_new = (X_new * b_const0) + (Y_new * b_const1) + (Z_new * b_const2);

        // Write results back to global memory
        d_r_new[image_index_1d] = r_new;
        d_g_new[image_index_1d] = g_new;
        d_b_new[image_index_1d] = b_new;
    }
}