#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 26
#define RADIUS 3
#define BLOCK_SIZE (TILE_SIZE+(2*RADIUS))

texture<unsigned char, 1, hipReadModeElementType> texInImage;
texture<unsigned int, 1, hipReadModeElementType> texIntegralImage;

__device__ unsigned int keypointsCount = 0;

__global__ void kernel_initIntegrtalImage(unsigned int *_d_out_integralImage, int _h_width, int _h_height)
{
    // Calculate 1D global thread ID
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check boundary before assignment
    if (index < _h_width * _h_height) {
        _d_out_integralImage[index] = 0;
    }
}