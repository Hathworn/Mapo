#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation.
    if (i >= N) return;

    int total_layers_spatial = layers * spatial;
    int in_s = i % spatial;
    int temp = i / spatial; // Reuse temporary variable to reduce calculations.
    int in_c = temp % layers;
    int b = temp / layers;

    int i1 = b * total_layers_spatial + in_c * spatial + in_s;
    int i2 = b * total_layers_spatial + in_s * layers + in_c;

    out[forward ? i2 : i1] = x[forward ? i1 : i2]; // Use conditional statement to reduce branching.
}