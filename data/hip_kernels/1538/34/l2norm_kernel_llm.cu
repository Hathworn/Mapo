#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    // Use a single flattened index for unique identification
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    int b = index / spatial;  // Batch index
    int i = index % spatial;  // Spatial index

    float sum = 0.0f;
    
    // Calculate the sum of squares
    for (int f = 0; f < filters; ++f) {
        int idx = b * filters * spatial + f * spatial + i;
        float val = x[idx];
        sum += val * val;  // Avoid powf for better performance
    }

    sum = sqrtf(sum);
    if (sum == 0.0f) sum = 1.0f;

    // Normalize x and compute dx
    for (int f = 0; f < filters; ++f) {
        int idx = b * filters * spatial + f * spatial + i;
        x[idx] /= sum;
        dx[idx] = (1.0f - x[idx]) / sum;
    }
}