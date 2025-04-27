#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void remove_redness_from_coordinates(
    const unsigned int* d_coordinates, 
    unsigned char* d_r, 
    unsigned char* d_b, 
    unsigned char* d_g, 
    unsigned char* d_r_output, 
    int num_coordinates, 
    int num_pixels_y, 
    int num_pixels_x, 
    int template_half_height, 
    int template_half_width) 
{
    int global_index_1d = blockIdx.x * blockDim.x + threadIdx.x;

    if (global_index_1d < num_coordinates) 
    {
        // Load coordinates and calculate positions
        unsigned int image_index_1d = d_coordinates[num_pixels_x * num_pixels_y - global_index_1d - 1];
        ushort2 image_index_2d = make_ushort2(image_index_1d % num_pixels_x, image_index_1d / num_pixels_x);

        // Unroll loops for better performance
        for (int y = image_index_2d.y - template_half_height; y <= image_index_2d.y + template_half_height; y++) 
        {
            int clamped_y = min(num_pixels_y - 1, max(0, y));
            
            for (int x = image_index_2d.x - template_half_width; x <= image_index_2d.x + template_half_width; x++) 
            {
                int clamped_x = min(num_pixels_x - 1, max(0, x));
                int image_offset_index_1d_clamped = num_pixels_x * clamped_y + clamped_x;
                
                // Read values and compute average
                unsigned int gb_average = (d_g[image_offset_index_1d_clamped] + d_b[image_offset_index_1d_clamped]) >> 1;
                d_r_output[image_offset_index_1d_clamped] = static_cast<unsigned char>(gb_average);
            }
        }
    }
}