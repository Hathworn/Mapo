#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_image_array_GPU(unsigned long long int* image, int pixels_per_image)
{
    int my_pixel = threadIdx.x + blockIdx.x * blockDim.x;
    if (my_pixel < pixels_per_image)
    {
        // Use a loop to reduce repetitive code lines for initializing images
        for (int i = 0; i < 4; ++i)
        {
            image[my_pixel + i * pixels_per_image] = 0;
        }
    }
}