#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gray(unsigned char *In, unsigned char *Out, int Row, int Col) {
    // Compute absolute index based on row and column
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure indices are within bounds
    if ((row < Col) && (col < Row)) {
        int index = row * Row + col;
        int rgbIndex = index * 3;
        
        // Optimize memory accesses by calculating output directly
        unsigned char r = In[rgbIndex];
        unsigned char g = In[rgbIndex + 1];
        unsigned char b = In[rgbIndex + 2];
        
        Out[index] = r * 0.114f + g * 0.587f + b * 0.299f;
    }
}