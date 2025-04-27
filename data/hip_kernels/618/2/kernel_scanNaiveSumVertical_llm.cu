#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 26
#define RADIUS 3
#define BLOCK_SIZE (TILE_SIZE+(2*RADIUS))

texture<unsigned char, 1, hipReadModeElementType> texInImage;
texture<unsigned int, 1, hipReadModeElementType> texIntegralImage;

__device__ unsigned int keypointsCount = 0;

__global__ void kernel_scanNaiveSumVertical(unsigned int *_d_out_integralImage, unsigned char *_d_in_image, int _h_width, int _h_height)
{
    // Utilize shared memory for fast access
    __shared__ unsigned int tmp[TILE_SIZE];

    int tx = threadIdx.x;
    int index = tx * _h_width;
    
    // Load elements into shared memory
    for(int i = 0 ; i < _h_width; i++)
    {
        tmp[i] = (unsigned int)tex1Dfetch(texInImage, index + i);
    }
    
    __syncthreads();  // Ensure shared memory is populated

    // Perform the scan operation
    for(int i = 1; i < _h_width; i++)
    {
        tmp[i] = tmp[i - 1] + tmp[i];
    }
    
    __syncthreads();  // Ensure scan is completed
    
    // Write back to global memory
    for(int i = 0 ; i < _h_width; i++)
    {
        _d_out_integralImage[index + i] = tmp[i];
    }
}