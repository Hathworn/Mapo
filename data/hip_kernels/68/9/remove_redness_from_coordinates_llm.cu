#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline int clamp(int value, int min_val, int max_val) {
    return min(max_val, max(min_val, value));
}

__global__ void remove_redness_from_coordinates(const unsigned int* d_coordinates, unsigned char* d_r, unsigned char* d_b, unsigned char* d_g, unsigned char* d_r_output, int num_coordinates, int num_pixels_y, int num_pixels_x, int template_half_height, int template_half_width) 
{
    // Calculate global thread index
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;
    int imgSize = num_pixels_x * num_pixels_y;

    // Ensure thread operates only within bounds
    if (global_index_1d < num_coordinates) {
        // Convert 1D coordinate to 2D and adjust
        unsigned int image_index_1d = d_coordinates[imgSize - global_index_1d - 1];
        ushort2 image_index_2d = make_ushort2(image_index_1d % num_pixels_x, image_index_1d / num_pixels_x);

        // Iterate over neighboring pixels
        for (int y = image_index_2d.y - template_half_height; y <= image_index_2d.y + template_half_height; ++y) {
            for (int x = image_index_2d.x - template_half_width; x <= image_index_2d.x + template_half_width; ++x) {
                // Clamp coordinates within valid range
                int clamped_x = clamp(x, 0, num_pixels_x - 1);
                int clamped_y = clamp(y, 0, num_pixels_y - 1);
                int image_offset_index_1d_clamped = (clamped_y * num_pixels_x) + clamped_x;

                // Compute average of green and blue channels
                unsigned char g_value = d_g[image_offset_index_1d_clamped];
                unsigned char b_value = d_b[image_offset_index_1d_clamped];
                unsigned int gb_average = (g_value + b_value) / 2;

                // Update red channel output
                d_r_output[image_offset_index_1d_clamped] = static_cast<unsigned char>(gb_average);
            }
        }
    }
}