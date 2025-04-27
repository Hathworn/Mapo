#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gray(unsigned char *In, unsigned char *Out, int Row, int Col) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the current thread is within image bounds
    if ((row < Col) && (col < Row)) {
        // Calculate the index once and reuse
        int idx = (row * Row + col) * 3;
        // Apply the grayscale conversion
        Out[row * Row + col] = In[idx + 2] * 0.299f + In[idx + 1] * 0.587f + In[idx] * 0.114f;
    }
}