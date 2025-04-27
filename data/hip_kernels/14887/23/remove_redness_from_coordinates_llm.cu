#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void remove_redness_from_coordinates(const unsigned int* d_coordinates, unsigned char* d_r, unsigned char* d_b, unsigned char* d_g, unsigned char* d_r_output, int num_coordinates, int num_pixels_y, int num_pixels_x, int template_half_height, int template_half_width)
{
    int ny = num_pixels_y;
    int nx = num_pixels_x;
    int global_index_1d = (blockIdx.x * blockDim.x) + threadIdx.x;

    int imgSize = num_pixels_x * num_pixels_y;

    if (global_index_1d < num_coordinates)
    {
        unsigned int image_index_1d = d_coordinates[imgSize - global_index_1d - 1];
        ushort2 image_index_2d = make_ushort2(image_index_1d % num_pixels_x, image_index_1d / num_pixels_x);
        
        // Precalculate boundaries to optimize loop range checks
        int start_y = max(0, image_index_2d.y - template_half_height);
        int end_y = min(ny - 1, image_index_2d.y + template_half_height);
        int start_x = max(0, image_index_2d.x - template_half_width);
        int end_x = min(nx - 1, image_index_2d.x + template_half_width);
        
        for (int y = start_y; y <= end_y; y++)
        {
            int base_y_index = nx * y;  // Calculate base index for y coordinate once per loop
            for (int x = start_x; x <= end_x; x++)
            {
                int image_offset_index_1d_clamped = base_y_index + x;

                unsigned char g_value = d_g[image_offset_index_1d_clamped];
                unsigned char b_value = d_b[image_offset_index_1d_clamped];

                unsigned int gb_average = (g_value + b_value) / 2;

                d_r_output[image_offset_index_1d_clamped] = (unsigned char)gb_average;
            }
        }
    }
}