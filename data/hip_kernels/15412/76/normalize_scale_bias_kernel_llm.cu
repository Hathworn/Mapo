#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_scale_bias_kernel(int N, float *x, float *mean, float *variance, float *scales, float *biases, int batch, int filters, int spatial, int inverse_variance, float epsilon)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    const int f = (index / spatial) % filters;

    // Use register to store intermediate results
    float var_adjusted = inverse_variance ? variance[f] : sqrtf(variance[f] + epsilon);
    float val = (x[index] - mean[f]) / var_adjusted;
    val *= scales[f];
    val += biases[f];

    // Avoid any branching for checking NaN and Inf
    if (val == val && abs(val) != INFINITY)
        x[index] = val;
}