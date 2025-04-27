#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void createAnaglyph_kernel(uchar4 *out_image, const float *left_image, const float *right_image, int width, int height, int pre_shift) {
    // Using built-in multiplication function to avoid __mul24 deprecation
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int x_right = x - pre_shift;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (x < width && y < height) {
        uchar4 temp;
        
        temp.x = left_image[y * width + x];
        
        if (x_right >= 0 && x_right < width) {
            temp.y = right_image[y * width + x_right];
            temp.z = temp.y;
        } else {
            temp.y = 0;
            temp.z = 0;
        }
        
        temp.w = 255;
        
        // Store result in output image
        out_image[y * width + x] = temp;
    }
}