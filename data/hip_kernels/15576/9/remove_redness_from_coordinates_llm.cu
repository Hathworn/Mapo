#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void remove_redness_from_coordinates(const unsigned int* d_coordinates, unsigned char* d_r, unsigned char* d_b, unsigned char* d_g, unsigned char* d_r_output, 
    int num_coordinates, int num_pixels_y, int num_pixels_x, int template_half_height, int template_half_width) 
{
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;
   
    if (global_index_1d < num_coordinates) 
    {
        // Precompute repetitive variables for performance
        int imgSize = num_pixels_x * num_pixels_y;
        unsigned int image_index_1d = d_coordinates[imgSize - global_index_1d - 1];
        ushort2 image_index_2d = make_ushort2(image_index_1d % num_pixels_x, image_index_1d / num_pixels_x);

        for (int y = image_index_2d.y - template_half_height; y <= image_index_2d.y + template_half_height; y++) 
        {
            for (int x = image_index_2d.x - template_half_width; x <= image_index_2d.x + template_half_width; x++) 
            {
                // Use min/max functions on coordinates to ensure they stay within bounds
                int x_clamped = min(num_pixels_x - 1, max(0, x));
                int y_clamped = min(num_pixels_y - 1, max(0, y));

                // Compute the clamped linear index once for performance
                int image_offset_index_1d_clamped = (num_pixels_x * y_clamped) + x_clamped;

                unsigned char g_value = d_g[image_offset_index_1d_clamped];
                unsigned char b_value = d_b[image_offset_index_1d_clamped];

                // Compute gb average directly without explicit variable
                d_r_output[image_offset_index_1d_clamped] = (g_value + b_value) / 2;
            }
        }
    }
}