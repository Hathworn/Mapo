#include "hip/hip_runtime.h"
#include "includes.h"

__shared__ int smem[324];

__global__ void convolution1Kernel(int *dst, int *src, int rows, int cols, int *filter) {
    // Calculate global position
    int posx = threadIdx.x + blockIdx.x * blockDim.x;
    int posy = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Check boundaries
    if (posx > 0 && posy > 0 && posx < rows - 1 && posy < cols - 1) {
        
        // Initialize the destination value
        int dstVal = 0;

        // Loop over filter
        for (int k = 0; k < 3; ++k) {
            for (int l = 0; l < 3; ++l) {
                dstVal += src[(posy + k - 1) * cols + (posx + l - 1)] * filter[k * 3 + l];
            }
        }
        
        // Write back to global memory
        dst[posy * cols + posx] = dstVal;
    }
}