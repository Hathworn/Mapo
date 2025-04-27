#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Calculate unique global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit if index is out of range
    if (i >= N) return;

    // Efficient computing of indices using modulo and division operations
    int in_s = i % spatial;
    int in_c = (i / spatial) % layers;
    int b = i / (spatial * layers); // Calculate batch index directly

    // Calculate in and out indices
    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;

    // Conditional assignment
    if (forward) 
        out[i2] = x[i1];
    else 
        out[i1] = x[i2];
}