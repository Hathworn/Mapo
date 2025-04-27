```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void remove_redness_from_coordinates( const unsigned int*  d_coordinates, unsigned char* d_r, unsigned char* d_b, unsigned char* d_g, unsigned char* d_r_output, int    num_coordinates, int    num_pixels_y, int    num_pixels_x, int    template_half_height, int    template_half_width )
{
    int ny = num_pixels_y;
    int nx = num_pixels_x;
    int global_index_1d = ( blockIdx.x * blockDim.x ) + threadIdx.x;

    int imgSize = num_pixels_x * num_pixels_y;

    if ( global_index_1d < num_coordinates )
    {
        unsigned int image_index_1d = d_coordinates[ imgSize - global_index_1d - 1 ];
        ushort2 image_index_2d = make_ushort2(image_index_1d % num_pixels_x, image_index_1d / num_pixels_x);

        // Loop over the template area with boundary check
        for ( int y = max(0, image_index_2d.y - template_half_height); y <= min(ny - 1, image_index_2d.y + template_half_height); y++ )
        {
            for ( int x = max(0, image_index_2d.x - template_half_width); x <= min(nx - 1, image_index_2d.x + template_half_width); x++ )
            {
                int image_offset_index_1d_clamped = (ny * y) + x;

                // Compute average and store directly
                d_r_output[ image_offset_index_1d_clamped ] = (d_g[ image_offset_index_1d_clamped ] + d_b[ image_offset_index_1d_clamped ]) / 2;
            }
        }
    }
}