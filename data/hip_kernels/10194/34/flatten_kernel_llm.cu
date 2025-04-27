#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Calculate the unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit for out-of-bounds threads
    if (i >= N) return;

    // Precompute division and modulo to increase efficiency
    int in_s = i % spatial;
    int in_c = (i / spatial) % layers;
    int b = i / (spatial * layers);

    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;

    // Use ternary conditional for cleaner decision logic
    out[(forward ? i2 : i1)] = x[(forward ? i1 : i2)];
}