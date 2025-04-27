#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Flattened unique thread index
    if(index >= N) return;

    int b = index / (spatial * layers); // Batch index
    int rem = index % (spatial * layers);
    int in_c = rem / spatial; // Channel index
    int in_s = rem % spatial; // Spatial index

    int i1 = b * layers * spatial + in_c * spatial + in_s; // Input index calculation
    int i2 = b * spatial * layers + in_s * layers + in_c; // Transposed index calculation

    if (forward) {
        out[i2] = x[i1]; // Write transposed data
    } else {
        out[i1] = x[i2]; // Write non-transposed data
    }
}