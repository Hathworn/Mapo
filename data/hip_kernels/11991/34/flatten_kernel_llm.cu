#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N) { // Use branch reduction by checking only if within bounds
        // Calculate input spatial, channel, and batch indices
        int in_s = i % spatial;
        int in_c = (i / spatial) % layers;
        int b = i / (spatial * layers);
        
        // Calculate flattened indices for input and output
        int i1 = b * layers * spatial + in_c * spatial + in_s;
        int i2 = b * layers * spatial + in_s * layers + in_c;

        // Conditional operation for forward or backward
        out[forward ? i2 : i1] = x[forward ? i1 : i2];
    }
}