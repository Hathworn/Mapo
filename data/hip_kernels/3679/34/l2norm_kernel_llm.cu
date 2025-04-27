#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    // Calculate index for the current thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    // Determine the batch and spatial indices
    int b = index / spatial;
    int i = index % spatial;
    float sum = 0.0f;
    int baseIndex = b * filters * spatial + i;

    // Unroll the loop to optimize memory access
    for (int f = 0; f < filters; ++f) {
        int elemIndex = baseIndex + f * spatial;
        float val = x[elemIndex];
        sum += val * val;
    }

    // Compute the norm and avoid division by zero
    sum = sqrtf(sum);
    if (sum == 0.0f) sum = 1.0f;

    // Update x and dx arrays
    for (int f = 0; f < filters; ++f) {
        int elemIndex = baseIndex + f * spatial;
        x[elemIndex] /= sum;
        dx[elemIndex] = (1.0f - x[elemIndex]) / sum;
    }
}