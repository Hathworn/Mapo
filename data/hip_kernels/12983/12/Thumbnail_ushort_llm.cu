#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Thumbnail_ushort(hipTextureObject_t ushort_tex, int *histogram, int src_width, int src_height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (y < src_height && x < src_width)
    {
        // Improve texture fetching for 2D cache locality
        unsigned short pixel = (tex2D<unsigned short>(ushort_tex, x + 0.5f, y + 0.5f) + 128) >> 8;
        
        // Use shared memory for histogram to reduce global atomic operations
        __shared__ int shared_histogram[256];
        
        if (threadIdx.x < 256) 
            shared_histogram[threadIdx.x] = 0;
        
        __syncthreads();
        
        atomicAdd(&shared_histogram[pixel], 1);
        
        __syncthreads();
        
        // Accumulate results back to global memory
        if (threadIdx.x < 256)
            atomicAdd(&histogram[threadIdx.x], shared_histogram[threadIdx.x]);
    }
}