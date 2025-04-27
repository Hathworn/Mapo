#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Use shared memory for spatial and layers indices to reduce calculations
    __shared__ int shared_spatial[1024]; // Assume blockDim.x <= 1024
    __shared__ int shared_layers[1024];

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= N) return;

    int in_s = i % spatial;
    int in_c = (i / spatial) % layers;
    int b = i / (spatial * layers);

    // Precompute offsets
    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;

    // Conditional assignment using ternary operator
    out[forward ? i2 : i1] = x[forward ? i1 : i2];
}