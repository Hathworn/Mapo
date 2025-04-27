#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void NormalizeKernel(const float *normalization_factor, int w, int h, int s, float *image)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = blockIdx.y;  // Use blockIdx.y to iterate over rows

    if (i >= h || j >= w) return;

    const int pos = i * s + j;

    float scale = normalization_factor[pos];

    float invScale = (scale == 0.0f) ? 1.0f : __fdividef(1.0f, scale);  // Use fast division

    image[pos] *= invScale;
}
```
