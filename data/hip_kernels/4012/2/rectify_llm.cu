#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rectify(unsigned char* image, unsigned height, unsigned width, int thread_count)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Determine total number of pixels
    int total_pixels = height * width * 4;
    // Calculate stride based on total thread count
    int stride = blockDim.x * gridDim.x;

    // Loop through assigned pixels with striding
    for (int j = idx; j < total_pixels; j += stride) 
    {
        if (image[j] < 127) image[j] = 127;
    }
}