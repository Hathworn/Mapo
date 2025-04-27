#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation
    if (i >= N) return;  // Early exit if out of bounds

    // Precompute reusable values
    int spatial_layers = spatial * layers;
    
    int in_s = i % spatial;
    int in_c = (i / spatial) % layers;
    int b = i / spatial_layers;

    int i1 = b * spatial_layers + in_c * spatial + in_s;
    int i2 = b * spatial_layers + in_s * layers + in_c;

    if (forward) out[i2] = x[i1];
    else out[i1] = x[i2];
}