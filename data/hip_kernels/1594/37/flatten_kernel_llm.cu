#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Loop over the elements with a stride of total threads
    for (int i = index; i < N; i += stride) {
        int in_s = i % spatial;
        int temp = i / spatial;
        int in_c = temp % layers;
        int b = temp / layers;

        int i1 = b * layers * spatial + in_c * spatial + in_s;
        int i2 = b * layers * spatial + in_s * layers + in_c;

        if (forward) out[i2] = x[i1];
        else out[i1] = x[i2];
    }
}