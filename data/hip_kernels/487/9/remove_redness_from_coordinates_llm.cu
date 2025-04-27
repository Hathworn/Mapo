#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void remove_redness_from_coordinates(const unsigned int* d_coordinates, unsigned char* d_r, unsigned char* d_b, unsigned char* d_g, unsigned char* d_r_output, int num_coordinates, int num_pixels_y, int num_pixels_x, int template_half_height, int template_half_width)
{
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;
    int imgSize = num_pixels_x * num_pixels_y;

    if (global_index_1d < num_coordinates)
    {
        // Avoid reverse lookup by using coherent index calculation
        unsigned int image_index_1d = d_coordinates[global_index_1d];
        ushort2 image_index_2d = make_ushort2(image_index_1d % num_pixels_x, image_index_1d / num_pixels_x);

        int yStart = max(0, image_index_2d.y - template_half_height);
        int yEnd = min(num_pixels_y - 1, image_index_2d.y + template_half_height);
        int xStart = max(0, image_index_2d.x - template_half_width);
        int xEnd = min(num_pixels_x - 1, image_index_2d.x + template_half_width);

        for (int y = yStart; y <= yEnd; y++)
        {
            for (int x = xStart; x <= xEnd; x++)
            {
                int image_offset_index_1d = y * num_pixels_x + x;

                unsigned char g_value = d_g[image_offset_index_1d];
                unsigned char b_value = d_b[image_offset_index_1d];

                // Inline calculation of gb_average
                d_r_output[image_offset_index_1d] = (g_value + b_value) / 2;
            }
        }
    }
}