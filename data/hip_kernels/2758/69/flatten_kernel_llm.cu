#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Compute global thread index for 1D grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if(i >= N) return; // Boundary check

    // Unroll index calculations
    int b = i / (layers * spatial);
    int remainder = i % (layers * spatial);
    int in_c = remainder / spatial;
    int in_s = remainder % spatial;

    // Calculate offset indices
    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;

    // Conditional assignment based on 'forward' flag
    if (forward) {
        out[i2] = x[i1];
    } else {
        out[i1] = x[i2];
    }
}