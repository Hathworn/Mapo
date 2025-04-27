#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Thumbnail_uchar2(hipTextureObject_t uchar2_tex, int *histogram, int src_width, int src_height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (y < src_height && x < src_width)
    {
        // Load pixel data
        uchar2 pixel = tex2D<uchar2>(uchar2_tex, x, y);
        // Utilize shared memory for histogram update
        __shared__ int local_histogram[512];
        
        int thread_id = threadIdx.y * blockDim.x + threadIdx.x;
        if (thread_id < 512)
        {
            local_histogram[thread_id] = 0;
        }
        __syncthreads();
        
        atomicAdd(&local_histogram[pixel.x], 1);
        atomicAdd(&local_histogram[256 + pixel.y], 1);
        __syncthreads();

        if (thread_id < 512)
        {
            atomicAdd(&histogram[thread_id], local_histogram[thread_id]);
        }
    }
}