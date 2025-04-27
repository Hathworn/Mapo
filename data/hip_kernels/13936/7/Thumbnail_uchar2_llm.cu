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
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds before accessing texture memory for optimal branching
    if (x < src_width && y < src_height)
    {
        uchar2 pixel = tex2D(uchar2_tex, x, y);
        
        // Use shared memory to reduce global atomic operations
        __shared__ int local_hist[512];

        // Initialize the shared memory histogram
        if (threadIdx.x < 512) local_hist[threadIdx.x] = 0;
        __syncthreads();

        // Update local histogram
        atomicAdd(&local_hist[pixel.x], 1);
        atomicAdd(&local_hist[256 + pixel.y], 1);
        __syncthreads();

        // Write back to global memory
        if (threadIdx.x < 512)
            atomicAdd(&histogram[threadIdx.x], local_hist[threadIdx.x]);
    }
}