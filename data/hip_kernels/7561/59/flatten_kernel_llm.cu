#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Avoid out-of-bound memory access
    if (i >= N) return;
    
    // Calculate indices
    int in_s = i % spatial;
    int b = i / (spatial * layers);
    int in_c = (i / spatial) % layers;

    // Optimize memory accesses
    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;

    // Conditional write to output
    out[forward ? i2 : i1] = forward ? x[i1] : x[i2];
}