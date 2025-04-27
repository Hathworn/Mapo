#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Single calculation index for overall grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = blockDim.x * gridDim.x; // Stride calculation for grid-level looping

    // Loop through entire data set with grid-striding pattern
    for (; i < n; i += gridStride) {
        float t = truth[i];
        float p = pred[i];
        error[i] = t ? -log(p) : 0;
        delta[i] = t - p;
    }
}