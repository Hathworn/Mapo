#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void boxFilter(unsigned char *srcImage, unsigned char *dstImage, unsigned int width, unsigned int height, int channel)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate filter offsets
    const int filter_offset_x = FILTER_WIDTH / 2;
    const int filter_offset_y = FILTER_HEIGHT / 2;

    // Threads inside image boundary will perform filter
    if (x >= filter_offset_x && x < (width - filter_offset_x) && y >= filter_offset_y && y < (height - filter_offset_y))
    {
        for (int c = 0; c < channel; c++)
        {
            float sum = 0.0f;
            // Use constant summation of filter area
            const float kS = FILTER_WIDTH * FILTER_HEIGHT;

            // Sum pixel values inside filter
            for (int ky = -filter_offset_y; ky <= filter_offset_y; ky++)
            {
                for (int kx = -filter_offset_x; kx <= filter_offset_x; kx++)
                {
                    float fl = srcImage[((y + ky) * width + (x + kx)) * channel + c];
                    sum += fl;
                }
            } 
            
            // Store averaged value
            dstImage[(y * width + x) * channel + c] = sum / kS;
        } 
    }
}