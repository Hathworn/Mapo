#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = blockDim.x * gridDim.x;  // Calculate grid stride

    for (; i < N; i += gridStride) {  // Loop for strided grid access
        int in_s = i % spatial;
        int in_c = (i / spatial) % layers;
        int b = i / (spatial * layers);

        int i1 = b * layers * spatial + in_c * spatial + in_s;
        int i2 = b * layers * spatial + in_s * layers + in_c;

        if (forward) {
            out[i2] = x[i1];
        } else {
            out[i1] = x[i2];
        }
    }
}