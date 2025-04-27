#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Calculate the index within the grid
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index < N) { // Ensure within bounds
        // Calculate indices using modulus and division for batching 
        int in_s = index % spatial;
        int in_c = (index / spatial) % layers;
        int b = (index / spatial) / layers;

        // Calculate flat index positions for x and out arrays
        int i1 = b * layers * spatial + in_c * spatial + in_s;
        int i2 = b * layers * spatial + in_s * layers + in_c;

        // Use ternary operator to simplify assignment
        out[forward ? i2 : i1] = x[forward ? i1 : i2];
    }
}