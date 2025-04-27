#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PictureKernell(unsigned char* d_Pin, unsigned char* d_Pout, int n, int m) {
    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    int Col = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure both Row and Col are within bounds
    if (Row < m && Col < n) {
        int index = Row * n + Col; // Calculate linear index once
        d_Pout[index] = 2 * d_Pin[index]; // Access memory directly with computed index
    }
}