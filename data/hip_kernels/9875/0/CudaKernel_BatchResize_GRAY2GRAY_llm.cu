#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void CudaKernel_BatchResize_GRAY2GRAY( int src_width, unsigned char* src_image, int num_rects, int* rects, int dst_width, int dst_height, float* dst_ptr )
{
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    const int dst_image_size = dst_width * dst_height;
    if (num_rects * dst_image_size <= gid) {
        return;
    }

    const int image_index = gid / dst_image_size;
    const int pixel_index = gid % dst_image_size;

    // Calculate scale and coordinate transformation variables
    const float scale_x = (float)(rects[image_index * 4 + 2]) / dst_width;
    const float scale_y = (float)(rects[image_index * 4 + 3]) / dst_height;
    const float fx = (float)((pixel_index % dst_width) + 0.5f) * scale_x - 0.5f;
    const float fy = (float)((pixel_index / dst_width) + 0.5f) * scale_y - 0.5f;
    
    const int coor_x_in_rect = floor(fx);
    const int coor_y_in_rect = floor(fy);
    
    const float fract_x = fx - coor_x_in_rect;
    const float fract_y = fy - coor_y_in_rect;

    // Precompute fixed values
    const int src_x = rects[image_index * 4 + 0];
    const int src_y = rects[image_index * 4 + 1];
    const int base_index = src_width * (src_y + coor_y_in_rect) + src_x + coor_x_in_rect;

    // Use bilinear interpolation with optimized indexing
    float value = 0.0f;
    value += src_image[base_index] * (1.0f - fract_x) * (1.0f - fract_y);
    value += src_image[base_index + 1] * fract_x * (1.0f - fract_y);
    value += src_image[base_index + src_width] * (1.0f - fract_x) * fract_y;
    value += src_image[base_index + src_width + 1] * fract_x * fract_y;

    dst_ptr[gid] = value / 255.0f;  // Normalize and store result
}