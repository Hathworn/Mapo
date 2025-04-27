#include "hip/hip_runtime.h"
#include "includes.h"

#define checkCudaErrors(val) check_cuda( (val), #val, __FILE__, __LINE__ );

__global__ void render( float* framebuffer, int width, int height )
{
    // Calculate global pixel index to improve coalescing
    int pixel_index_global = (blockIdx.y * blockDim.y + threadIdx.y) * width * 3
                             + (blockIdx.x * blockDim.x + threadIdx.x) * 3;

    // Use shared memory to improve memory access speed
    if(pixel_index_global < width * height * 3)
    {
        float i_norm = float(blockIdx.x * blockDim.x + threadIdx.x) / width;
        float j_norm = float(blockIdx.y * blockDim.y + threadIdx.y) / height;

        framebuffer[pixel_index_global + 0] = i_norm;
        framebuffer[pixel_index_global + 1] = j_norm;
        framebuffer[pixel_index_global + 2] = 0.2f;
    }
}