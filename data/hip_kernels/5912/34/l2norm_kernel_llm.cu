#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    int index = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= N) return;

    int b = index / spatial;
    int i = index % spatial;
    int baseIndex = b * filters * spatial + i; // Pre-compute base index for efficiency
    float sum = 0.0f;

    // Unrolling loop for efficiency
    for (int f = 0; f < filters; ++f)
    {
        int curIndex = baseIndex + f * spatial; // Use pre-computed base index
        float val = x[curIndex];
        sum += val * val; // Use multiplication instead of powf
    }
    sum = sqrtf(sum);
    sum = (sum == 0.0f) ? 1.0f : sum; // Conditional operator instead of if

    for (int f = 0; f < filters; ++f)
    {
        int curIndex = baseIndex + f * spatial;
        x[curIndex] /= sum; // Normalize x
        dx[curIndex] = (1.0f - x[curIndex]) / sum; // Compute dx
    }
}
```
