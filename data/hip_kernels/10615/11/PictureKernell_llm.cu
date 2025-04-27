#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized for better readability and performance
__global__ void PictureKernell(unsigned char *d_Pin, unsigned char *d_Pout, int n, int m) {
    // Calculate row and column index for each thread
    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    int Col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use single index to avoid recalculating Row*n
    int index = Row * n + Col;

    // Ensure threads are within image bounds
    if (Row < m && Col < n) {
        d_Pout[index] = 2 * d_Pin[index]; // Perform operation and write result
    }
}