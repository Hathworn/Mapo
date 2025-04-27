#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void tonemap( float* d_x, float* d_y, float* d_log_Y, float* d_cdf_norm, float* d_r_new, float* d_g_new, float* d_b_new, float  min_log_Y, float  max_log_Y, float  log_Y_range, int    num_bins, int    num_pixels_y, int    num_pixels_x )
{
    int nx = num_pixels_x;
    int2 image_index_2d = make_int2( ( blockIdx.x * blockDim.x ) + threadIdx.x, ( blockIdx.y * blockDim.y ) + threadIdx.y );
    int image_index_1d = ( nx * image_index_2d.y ) + image_index_2d.x;

    // Check if the current thread is within image boundaries
    if ( image_index_2d.x < num_pixels_x && image_index_2d.y < num_pixels_y )
    {
        // Use shared memory to reduce global memory access latency
        extern __shared__ float shared_mem[];
        float* shared_x = shared_mem;
        float* shared_y = shared_mem + blockDim.x * blockDim.y;
        float* shared_log_Y = shared_y + blockDim.x * blockDim.y;

        shared_x[threadIdx.x + threadIdx.y * blockDim.x] = d_x[image_index_1d];
        shared_y[threadIdx.x + threadIdx.y * blockDim.x] = d_y[image_index_1d];
        shared_log_Y[threadIdx.x + threadIdx.y * blockDim.x] = d_log_Y[image_index_1d];

        __syncthreads(); // Synchronize threads in the block

        float x = shared_x[threadIdx.x + threadIdx.y * blockDim.x];
        float y = shared_y[threadIdx.x + threadIdx.y * blockDim.x];
        float log_Y = shared_log_Y[threadIdx.x + threadIdx.y * blockDim.x];

        int bin_index = min( num_bins - 1, int( (num_bins * ( log_Y - min_log_Y ) ) / log_Y_range ) );
        float Y_new = d_cdf_norm[ bin_index ];

        // Calculate new color values
        float X_new = x * ( Y_new / y );
        float Z_new = ( 1 - x - y ) * ( Y_new / y );

        float r_new = ( X_new *  3.2406f ) + ( Y_new * -1.5372f ) + ( Z_new * -0.4986f );
        float g_new = ( X_new * -0.9689f ) + ( Y_new *  1.8758f ) + ( Z_new *  0.0415f );
        float b_new = ( X_new *  0.0557f ) + ( Y_new * -0.2040f ) + ( Z_new *  1.0570f );

        // Write results back to global memory
        d_r_new[ image_index_1d ] = r_new;
        d_g_new[ image_index_1d ] = g_new;
        d_b_new[ image_index_1d ] = b_new;
    }
}