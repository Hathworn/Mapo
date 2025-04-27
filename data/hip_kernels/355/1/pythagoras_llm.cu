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

// Converts the Pythagorean theorem along a vector on the GPU

// Create an image buffer. Return host ptr, pass out device pointer through pointer to pointer
__global__ void pythagoras(unsigned char *a, unsigned char *b, unsigned char *c)
{
    // Calculate unique global index for each thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use fast math function for better GPU performance
    float af = static_cast<float>(a[idx]);
    float bf = static_cast<float>(b[idx]);

    // Calculate the result using sqrtf
    c[idx] = static_cast<unsigned char>(__fsqrt_rn(af * af + bf * bf));
}