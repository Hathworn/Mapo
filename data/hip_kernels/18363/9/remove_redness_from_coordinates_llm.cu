#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void remove_redness_from_coordinates( const unsigned int*  d_coordinates, 
                                                unsigned char* d_r, 
                                                unsigned char* d_b, 
                                                unsigned char* d_g, 
                                                unsigned char* d_r_output, 
                                                int num_coordinates, 
                                                int num_pixels_y, 
                                                int num_pixels_x, 
                                                int template_half_height, 
                                                int template_half_width )
{
    int nx = num_pixels_x;
    int ny = num_pixels_y;
    int imgSize = nx * ny;
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;

    if (global_index_1d < num_coordinates)
    {
        unsigned int image_index_1d = d_coordinates[imgSize - global_index_1d - 1];
        ushort2 image_index_2d = make_ushort2(image_index_1d % nx, image_index_1d / nx);

        // Pre-compute min/max boundaries for the template to reduce redundant calculations
        int min_y = max(0, image_index_2d.y - template_half_height);
        int max_y = min(ny - 1, image_index_2d.y + template_half_height);
        int min_x = max(0, image_index_2d.x - template_half_width);
        int max_x = min(nx - 1, image_index_2d.x + template_half_width);

        for (int y = min_y; y <= max_y; y++)
        {
            for (int x = min_x; x <= max_x; x++)
            {
                int image_offset_index_1d_clamped = y * nx + x;

                unsigned char g_value = d_g[image_offset_index_1d_clamped];
                unsigned char b_value = d_b[image_offset_index_1d_clamped];

                // Use bitwise shift for average calculation for integer division
                unsigned int gb_average = (g_value + b_value) >> 1;

                d_r_output[image_offset_index_1d_clamped] = (unsigned char)gb_average;
            }
        }
    }
}