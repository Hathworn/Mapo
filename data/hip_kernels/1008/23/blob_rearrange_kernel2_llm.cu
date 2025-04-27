#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blob_rearrange_kernel2(const float *in, float *out, int num, int channels, int width, int height, int widthheight, int padding, int pwidthheight)
{
    int xy = blockIdx.x * blockDim.x + threadIdx.x;
    if (xy >= widthheight)
        return;

    int ch = blockIdx.y;
    int n = blockIdx.z;
    
    // Removed synchronization as it is not needed here
    float value = in[(n * channels + ch) * widthheight + xy];

    int xpad = (xy % width + padding);
    int ypad = (xy / width + padding);
    int xypad = ypad * (width + 2 * padding) + xpad;

    out[(n * pwidthheight + xypad) * channels + ch] = value;
}