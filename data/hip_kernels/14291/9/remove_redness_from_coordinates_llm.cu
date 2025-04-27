#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void remove_redness_from_coordinates(const unsigned int* d_coordinates, unsigned char* d_r, unsigned char* d_b, unsigned char* d_g, unsigned char* d_r_output, int num_coordinates, int num_pixels_y, int num_pixels_x, int template_half_height, int template_half_width) {
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;
    int imgSize = num_pixels_x * num_pixels_y;

    if (global_index_1d < num_coordinates) {
        unsigned int image_index_1d = d_coordinates[imgSize - global_index_1d - 1];
        ushort2 image_index_2d = make_ushort2(image_index_1d % num_pixels_x, image_index_1d / num_pixels_x);

        // Pre-calculate clamp bounds
        int y_start = max(0, image_index_2d.y - template_half_height);
        int y_end = min(num_pixels_y - 1, image_index_2d.y + template_half_height);
        int x_start = max(0, image_index_2d.x - template_half_width);
        int x_end = min(num_pixels_x - 1, image_index_2d.x + template_half_width);

        for (int y = y_start; y <= y_end; y++) {
            for (int x = x_start; x <= x_end; x++) {
                int image_offset_index_1d_clamped = y * num_pixels_x + x;

                // Combine loading and averaging
                d_r_output[image_offset_index_1d_clamped] = (d_g[image_offset_index_1d_clamped] + d_b[image_offset_index_1d_clamped]) / 2;
            }
        }
    }
}