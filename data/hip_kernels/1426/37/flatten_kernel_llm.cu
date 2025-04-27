#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= N) return;

    // Pre-compute reused expressions
    int layer_spatial = layers * spatial;
    int in_s = index % spatial;
    int in_c = (index / spatial) % layers;
    int b = index / (layers * spatial);

    // Calculate flattened indices
    int i1 = b * layer_spatial + in_c * spatial + in_s;
    int i2 = b * layer_spatial + in_s * layers + in_c;

    // Perform read & write depending on the forward flag
    out[forward ? i2 : i1] = x[forward ? i1 : i2];
}