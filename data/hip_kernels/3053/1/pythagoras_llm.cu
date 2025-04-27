#include "hip/hip_runtime.h"
#include "includes.h"

// GPU constant memory to hold our kernels (extremely fast access time)
__constant__ float convolutionKernelStore[256];

/**
* Convolution function for cuda.  Destination is expected to have the same width/height as source, but there will be a border
* of floor(kWidth/2) pixels left and right and floor(kHeight/2) pixels top and bottom
*
* @param source      Source image host pinned memory pointer
* @param width       Source image width
* @param height      Source image height
* @param paddingX    source image padding along x
* @param paddingY    source image padding along y
* @param kOffset     offset into kernel store constant memory
* @param kWidth      kernel width
* @param kHeight     kernel height
* @param destination Destination image host pinned memory pointer
*/

// Optimization: Use shared memory for better performance
__global__ void pythagoras(unsigned char *a, unsigned char *b, unsigned char *c)
{
    extern __shared__ float s_mem[];
    int idx = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Load data into shared memory
    s_mem[threadIdx.x] = float(a[idx]);
    __syncthreads();

    float af = s_mem[threadIdx.x];
    float bf = float(b[idx]);

    c[idx] = (unsigned char)sqrtf(af * af + bf * bf);
}