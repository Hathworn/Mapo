#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blob_rearrange_kernel2_1d(const float *in, float *out, int num, int channels, int width, int height, int widthheight, int padding, int pwidthheight)
{
    // Calculate the global index
    int xy = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread is within bounds
    if (xy >= widthheight)
        return;

    // Determine the current channel and image index
    int ch = blockIdx.y;
    int n  = blockIdx.z;

    // Read input value
    float value = in[(n * channels + ch) * widthheight + xy];

    // Calculate padded coordinates without sync
    int xpad  = (xy % width + padding);
    int ypad  = (xy / width);
    int xypad = ypad * (width + 2 * padding) + xpad;

    // Write output value
    // Avoid race conditions, sync is not necessary as threads don't overlap in data write
    out[(n * pwidthheight + xypad) * channels + ch] = value;
}