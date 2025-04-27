#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tonemap( float* d_x, float* d_y, float* d_log_Y, float* d_cdf_norm, float* d_r_new, float* d_g_new, float* d_b_new, float  min_log_Y, float  max_log_Y, float  log_Y_range, int    num_bins, int    num_pixels_y, int    num_pixels_x )
{
    int nx = num_pixels_x;
    int ny = num_pixels_y;
    
    // Calculate 1D flattened index using block and thread indices
    int2 image_index_2d = make_int2( ( blockIdx.x * blockDim.x ) + threadIdx.x, ( blockIdx.y * blockDim.y ) + threadIdx.y );
    int image_index_1d = ( nx * image_index_2d.y ) + image_index_2d.x;

    if (image_index_2d.x < nx && image_index_2d.y < ny)
    {
        // Fetch input data from device memory
        float x = d_x[image_index_1d];
        float y = d_y[image_index_1d];
        float log_Y = d_log_Y[image_index_1d];

        // Compute bin index with possible pre-calculation for efficiency
        int bin_index = min(num_bins - 1, int( (num_bins * (log_Y - min_log_Y)) / log_Y_range ));
        float Y_new = d_cdf_norm[bin_index];

        // Pre-compute reciprocal of y to avoid multiple divisions
        float inv_y = 1.0f / y;

        // Calculate color components with matrix multiplication
        float X_new = x * (Y_new * inv_y);
        float Z_new = (1.0f - x - y) * (Y_new * inv_y);

        // Use more efficient arithmetic operations by restructuring equations
        float r_new = fmaf(X_new, 3.2406f, fmaf(Y_new, -1.5372f, Z_new * -0.4986f));
        float g_new = fmaf(X_new, -0.9689f, fmaf(Y_new, 1.8758f, Z_new * 0.0415f));
        float b_new = fmaf(X_new, 0.0557f, fmaf(Y_new, -0.2040f, Z_new * 1.0570f));

        // Store computed colors in the output arrays
        d_r_new[image_index_1d] = r_new;
        d_g_new[image_index_1d] = g_new;
        d_b_new[image_index_1d] = b_new;
    }
}