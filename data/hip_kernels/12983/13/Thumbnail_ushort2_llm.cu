#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Thumbnail_ushort2(hipTextureObject_t ushort2_tex, int *histogram, int src_width, int src_height)
{
    // Calculate thread's absolute position in 2D space
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Use shared memory for histogram accumulation to reduce global memory access
    __shared__ int shared_histogram[512];
    
    // Initialize shared histogram in parallel
    if (threadIdx.x < 512)
        shared_histogram[threadIdx.x] = 0;
    __syncthreads();

    // Ensure pixel location is valid and within image bounds
    if (y < src_height && x < src_width)
    {
        // Texture fetch
        ushort2 pixel = tex2D<ushort2>(ushort2_tex, x, y);
        
        // Atomic update to shared histogram
        atomicAdd(&shared_histogram[(pixel.x + 128) >> 8], 1);
        atomicAdd(&shared_histogram[256 + ((pixel.y + 128) >> 8)], 1);
    }
    __syncthreads();

    // Transfer shared histogram data to global memory
    if (threadIdx.x < 512)
        atomicAdd(&histogram[threadIdx.x], shared_histogram[threadIdx.x]);
}