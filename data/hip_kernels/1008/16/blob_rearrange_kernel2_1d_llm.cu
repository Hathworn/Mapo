#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blob_rearrange_kernel2_1d(const float *in, float *out, int num, int channels, int width, int height, int widthheight, int padding, int pwidthheight)
{
    int xy = blockIdx.x*blockDim.x + threadIdx.x;

    // Ensure threads within valid range to eliminate unnecessary computation
    if(xy < widthheight) {
        int ch = blockIdx.y;
        int n  = blockIdx.z;

        // Optimize memory access pattern by computing indices first
        int xpad  = (xy % width + padding);
        int ypad  = (xy / width);
        int xypad = ypad * (width + 2 * padding) + xpad;

        // Access and assign values without syncing threads as it's unnecessary
        out[(n * pwidthheight + xypad) * channels + ch] = in[(n * channels + ch) * widthheight + xy];
    }
}