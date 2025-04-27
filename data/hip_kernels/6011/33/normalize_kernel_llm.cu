#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    // Calculate global index using block index and thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    for (int i = index; i < N; i += stride) {
        // Compute the filter index
        int f = (i / spatial) % filters;
        
        // Normalize the value
        x[i] = (x[i] - mean[f]) / (sqrtf(variance[f]) + .000001f);
    }
}