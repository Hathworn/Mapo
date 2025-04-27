#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tonemap( float* __restrict__ d_x, float* __restrict__ d_y, float* __restrict__ d_log_Y, float* __restrict__ d_cdf_norm, float* __restrict__ d_r_new, float* __restrict__ d_g_new, float* __restrict__ d_b_new, float  min_log_Y, float  max_log_Y, float  log_Y_range, int    num_bins, int    num_pixels_y, int    num_pixels_x )
{
    // Calculate 1D image index
    int2 image_index_2d = make_int2( blockIdx.x * blockDim.x + threadIdx.x, blockIdx.y * blockDim.y + threadIdx.y );
    int image_index_1d = num_pixels_x * image_index_2d.y + image_index_2d.x;

    // Only process valid pixels
    if ( image_index_2d.x < num_pixels_x && image_index_2d.y < num_pixels_y )
    {
        float x = d_x[ image_index_1d ];
        float y = d_y[ image_index_1d ];
        float log_Y = d_log_Y[ image_index_1d ];
        
        // Compute histogram bin index
        int bin_index = min( num_bins - 1, static_cast<int>((num_bins * (log_Y - min_log_Y)) / log_Y_range) );
        float Y_new = d_cdf_norm[ bin_index ];

        // Calculate new color components
        float X_new = x * ( Y_new / y );
        float Z_new = ( 1.0f - x - y ) * ( Y_new / y );

        // Convert to RGB using matrix multiplication
        float r_new = X_new * 3.2406f + Y_new * -1.5372f + Z_new * -0.4986f;
        float g_new = X_new * -0.9689f + Y_new * 1.8758f + Z_new * 0.0415f;
        float b_new = X_new * 0.0557f + Y_new * -0.2040f + Z_new * 1.0570f;

        // Store results
        d_r_new[ image_index_1d ] = max(0.0f, min(1.0f, r_new));  // Clamp to [0, 1]
        d_g_new[ image_index_1d ] = max(0.0f, min(1.0f, g_new));  // Clamp to [0, 1]
        d_b_new[ image_index_1d ] = max(0.0f, min(1.0f, b_new));  // Clamp to [0, 1]
    }
}