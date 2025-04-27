#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i >= N) return; // Ensure within bounds

    // Precompute divisors to reduce repeated calculations
    int div_spatial = spatial;
    int div_layers = layers * spatial;

    // Calculate indices using precomputed divisors
    int in_s = i % div_spatial;
    int in_c = (i / div_spatial) % layers;
    int b = i / div_layers;

    // Simplify memory access expressions
    int i1 = b * div_layers + in_c * spatial + in_s;
    int i2 = b * div_layers + in_s * layers + in_c;

    // Use conditional assignment with forward flag
    out[forward ? i2 : i1] = x[forward ? i1 : i2];
}