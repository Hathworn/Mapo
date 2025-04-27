#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blob_rearrange_kernel2(const float *in, float *out, int num, int channels, int width, int height, int widthheight, int padding, int pwidthheight)
{
    // Calculate global thread index
    int xy = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread is within bounds
    if (xy >= widthheight)
        return;

    // Calculate channel and batch index
    int ch = blockIdx.y;
    int n  = blockIdx.z;

    // Optimize memory access by directly accessing input and output data
    float value = in[(n * channels + ch) * widthheight + xy];

    // Pre-compute padded indices to avoid repeated computation
    int xpad  = (xy % width) + padding;
    int ypad  = (xy / width) + padding;
    int xypad = ypad * (width + 2 * padding) + xpad;

    out[(n * pwidthheight + xypad) * channels + ch] = value;
}
```
