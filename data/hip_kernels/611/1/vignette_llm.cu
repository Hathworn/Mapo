#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vignette(const unsigned char * __restrict__ src, unsigned char * __restrict__ dst, float inner, float outer, const size_t width, const size_t height)
{
    // Calculate pixel coordinates using block and thread indices
    size_t xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    size_t yIndex = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if indices are within image bounds
    if (xIndex < width && yIndex < height)
    {
        // Compute linear offset for 1D array indexing
        size_t offset = yIndex * width + xIndex;
        // Normalize coordinates with respect to image center
        float x = (float)(xIndex - width / 2) / height;
        float y = (float)(yIndex - height / 2) / height;
        // Calculate distance from center
        float d = sqrtf(x * x + y * y);

        // Apply vignette effect based on distance
        if (d < inner)
        {
            // No change if distance less than inner boundary
            dst[offset] = src[offset];
        }
        else if (d > outer)
        {
            // Set pixel to black if distance greater than outer boundary
            dst[offset] = 0;
        }
        else
        {
            // Calculate vignette factor for distances between inner and outer
            float v = 1.0f - (d - inner) / (outer - inner);
            dst[offset] = (unsigned char)(src[offset] * v);
        }
    }
}