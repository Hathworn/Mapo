#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 26
#define RADIUS 3
#define BLOCK_SIZE (TILE_SIZE+(2*RADIUS))

texture<unsigned char, 1, hipReadModeElementType> texInImage;
texture<unsigned int, 1, hipReadModeElementType> texIntegralImage;

__device__ unsigned int keypointsCount = 0;

// Optimized kernel function to perform prefix sum horizontally
__global__ void kernel_scanNaiveSumHirizontal(unsigned int *_d_out_integralImage, int _h_width, int _h_height)
{
    extern __shared__ unsigned int s_data[];  // Use shared memory
    int tx = threadIdx.x;
    int gx = blockIdx.x * blockDim.x + tx;

    if (gx < _h_width) {
        // Load data from texture to shared memory
        for (int i = 0; i < _h_height; i++) {
            s_data[i * blockDim.x + tx] = tex1Dfetch(texIntegralImage, gx + i * _h_width);
        }

        // Perform scan operation in shared memory
        for (int i = 1; i < _h_height; i++) {
            s_data[i * blockDim.x + tx] += s_data[(i - 1) * blockDim.x + tx];
        }
        
        // Write results back to global memory
        for (int i = 0; i < _h_height; i++) {
            _d_out_integralImage[gx + i * _h_width] = s_data[i * blockDim.x + tx];
        }
    }
}