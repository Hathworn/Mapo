#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void remove_redness_from_coordinates(const unsigned int* d_coordinates, unsigned char* d_r, unsigned char* d_b, unsigned char* d_g, unsigned char* d_r_output, int num_coordinates, int num_pixels_y, int num_pixels_x, int template_half_height, int template_half_width)
{
    // Calculate global thread index
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;

    // Get total image size
    int imgSize = num_pixels_x * num_pixels_y;

    // Proceed if within the range of coordinates
    if (global_index_1d < num_coordinates)
    {
        // Calculate 1D and 2D image indices
        unsigned int image_index_1d = d_coordinates[imgSize - global_index_1d - 1];
        ushort2 image_index_2d = make_ushort2(image_index_1d % num_pixels_x, image_index_1d / num_pixels_x);

        // Loop through template region surrounding the pixel
        for (int y = image_index_2d.y - template_half_height; y <= image_index_2d.y + template_half_height; y++)
        {
            for (int x = image_index_2d.x - template_half_width; x <= image_index_2d.x + template_half_width; x++)
            {
                // Clamp coordinates to image boundaries
                int x_clamped = min(num_pixels_x - 1, max(0, x));
                int y_clamped = min(num_pixels_y - 1, max(0, y));

                // Calculate clamped 1D index
                int image_offset_index_1d_clamped = y_clamped * num_pixels_x + x_clamped;

                // Fetch green and blue values
                unsigned char g_value = d_g[image_offset_index_1d_clamped];
                unsigned char b_value = d_b[image_offset_index_1d_clamped];

                // Calculate average and update red channel output
                d_r_output[image_offset_index_1d_clamped] = (unsigned char)((g_value + b_value) / 2);
            }
        }
    }
}