#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {

texture<unsigned char, 2> uchar_tex;
texture<uchar2, 2>  uchar2_tex;
texture<unsigned short, 2> ushort_tex;
texture<ushort2, 2>  ushort2_tex;
}

__global__ void Thumbnail_uchar2(int *histogram, int src_width, int src_height)
{
    // Calculate global thread positions
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure within bounds
    if (y < src_height && x < src_width)
    {
        // Fetch pixel from texture
        uchar2 pixel = tex2D(uchar2_tex, x, y);
        
        // Use shared memory to optimize atomic operations
        __shared__ int local_histogram[512];
        if (threadIdx.x < 512) local_histogram[threadIdx.x] = 0;
        __syncthreads();
        
        atomicAdd(&local_histogram[pixel.x], 1);
        atomicAdd(&local_histogram[256 + pixel.y], 1);
        __syncthreads();
        
        // Merge local histogram back into global histogram
        if (threadIdx.x < 512) atomicAdd(&histogram[threadIdx.x], local_histogram[threadIdx.x]);
    }
}