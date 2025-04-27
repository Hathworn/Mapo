#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void remove_redness_from_coordinates( const unsigned int* d_coordinates, unsigned char* d_r, unsigned char* d_b, unsigned char* d_g, unsigned char* d_r_output, int num_coordinates, int num_pixels_y, int num_pixels_x, int template_half_height, int template_half_width )
{
    int nx = num_pixels_x;
    int ny = num_pixels_y;
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;
    int imgSize = nx * ny;

    if (global_index_1d < num_coordinates)
    {
        unsigned int image_index_1d = d_coordinates[imgSize - global_index_1d - 1];
        ushort2 image_index_2d = make_ushort2(image_index_1d % nx, image_index_1d / nx);

        // Iterate over the template area in the image
        int startX = max(0, image_index_2d.x - template_half_width);
        int endX = min(nx - 1, image_index_2d.x + template_half_width);
        int startY = max(0, image_index_2d.y - template_half_height);
        int endY = min(ny - 1, image_index_2d.y + template_half_height);

        for (int y = startY; y <= endY; y++)
        {
            for (int x = startX; x <= endX; x++)
            {
                int image_offset_index_1d_clamped = y * nx + x;

                unsigned char g_value = d_g[image_offset_index_1d_clamped];
                unsigned char b_value = d_b[image_offset_index_1d_clamped];

                unsigned int gb_average = (g_value + b_value) >> 1; // Bitwise shift for division by 2

                d_r_output[image_offset_index_1d_clamped] = (unsigned char)gb_average;
            }
        }
    }
}