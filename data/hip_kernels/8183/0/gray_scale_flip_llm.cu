#include "hip/hip_runtime.h"
#include "includes.h"
/******************************
*STUDENT NAME: DAVID PARKS    *
*PROJECT: 6 - GREY SCALE FLIP *
*DUE DATE: THURS 18/10/18     *
*******************************/

#define PPM_MAGIC_1 'P'
#define PPM_MAGIC_2 '6'
#define BLOCK_SIZE 16;

struct PPM_header {
    int width;
    int height;
    int max_color;
};

struct RGB_8 {
    uint8_t r;
    uint8_t g;
    uint8_t b;
};

__global__ void gray_scale_flip(RGB_8* img, int height, int width)
{
    int row = blockDim.y * blockIdx.y + threadIdx.y;
    int col = blockDim.x * blockIdx.x + threadIdx.x;
    
    if (row < height && col < width / 2)
    {
        // Calculate indices once to avoid recomputation
        int index_current = row * width + col;
        int index_flip = (row + 1) * width - col - 1;

        // Load current and flip pixel once
        RGB_8 pixel_current = img[index_current];
        RGB_8 pixel_flip = img[index_flip];

        // Compute gray value for current pixel
        float gray_value_current = 0.21f * pixel_current.r + 0.72f * pixel_current.g + 0.07f * pixel_current.b;
        pixel_current.r = gray_value_current;
        pixel_current.g = gray_value_current;
        pixel_current.b = gray_value_current;

        // Compute gray value for flip pixel before assignment to avoid overwriting issues
        float gray_value_flip = 0.21f * pixel_flip.r + 0.72f * pixel_flip.g + 0.07f * pixel_flip.b;

        // Set flip pixel to grayed current pixel
        img[index_flip] = pixel_current;

        // Set current pixel to original flip pixel
        pixel_flip.r = gray_value_flip;
        pixel_flip.g = gray_value_flip;
        pixel_flip.b = gray_value_flip;
        img[index_current] = pixel_flip;
    }
}