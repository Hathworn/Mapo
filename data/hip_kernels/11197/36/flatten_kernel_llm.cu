#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Return early if out of bounds
    if (i >= N) return;

    // Calculate indices using modulo and division
    int in_s = i % spatial;
    int in_c = (i / spatial) % layers;
    int b = i / (spatial * layers);

    // Calculate the input and output indices
    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;

    // Condition to determine direction of operation
    out[forward ? i2 : i1] = x[forward ? i1 : i2];
}