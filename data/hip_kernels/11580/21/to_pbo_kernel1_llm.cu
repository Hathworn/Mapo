#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void to_pbo_kernel1(unsigned char* g_in, int stride_in, uchar4* g_out, int stride_out, int width, int height)
{
    // Calculate global thread indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check if within image bounds
    if (x < width && y < height)
    {
        // Read and write to global memory
        int index_in = y * stride_in + x;      // Compute input index once
        unsigned char value = g_in[index_in];  // Single read operation
        int index_out = y * stride_out + x;    // Compute output index once
        g_out[index_out] = make_uchar4(value, value, value, 1); // Use computed index
    }
}