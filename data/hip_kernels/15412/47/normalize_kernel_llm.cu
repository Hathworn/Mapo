#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;
    
    // Pre-calculate index related variables to avoid repeated computation
    const int f = (index / spatial) % filters;
    const float mean_val = mean[f];
    const float variance_val = variance[f];
    const float epsilon = 0.00001f;

    // Use a temporary variable for computation
    const float normalized = (x[index] - mean_val) / sqrtf(variance_val + epsilon);
    x[index] = normalized;
}