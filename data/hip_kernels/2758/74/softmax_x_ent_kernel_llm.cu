#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Streamlined single block index calculation

    if (i < n) {
        float t = truth[i];
        float p = pred[i];
        error[i] = (t) ? -logf(p) : 0; // Use logf for potentially faster computation in CUDA
        delta[i] = t - p;
    }
}