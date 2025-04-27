#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void remove_redness_from_coordinates(const unsigned int* d_coordinates, unsigned char* d_r, unsigned char* d_b, unsigned char* d_g, unsigned char* d_r_output, int num_coordinates, int num_pixels_y, int num_pixels_x, int template_half_height, int template_half_width)
{
    int ny = num_pixels_y;
    int nx = num_pixels_x;
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;
    int imgSize = nx * ny;

    // Check if global thread index is within the number of coordinate limits
    if (global_index_1d < num_coordinates)
    {
        unsigned int image_index_1d = d_coordinates[imgSize - global_index_1d - 1];
        ushort2 image_index_2d = make_ushort2(image_index_1d % nx, image_index_1d / nx);

        // Unroll loop to reduce loop overhead 
        for (int y_offset = -template_half_height; y_offset <= template_half_height; y_offset++)
        {
            for (int x_offset = -template_half_width; x_offset <= template_half_width; x_offset++)
            {
                int x = image_index_2d.x + x_offset;
                int y = image_index_2d.y + y_offset;

                // Condense the clamping logic using min/max with ternary
                x = (x < 0) ? 0 : ((x >= nx) ? (nx - 1) : x);
                y = (y < 0) ? 0 : ((y >= ny) ? (ny - 1) : y);

                int image_offset_index_1d_clamped = y * nx + x;

                unsigned char g_value = d_g[image_offset_index_1d_clamped];
                unsigned char b_value = d_b[image_offset_index_1d_clamped];

                d_r_output[image_offset_index_1d_clamped] = (unsigned char)((g_value + b_value) / 2);
            }
        }
    }
}