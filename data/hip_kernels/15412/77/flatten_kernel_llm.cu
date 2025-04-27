#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if(index < N) {
        int spatial_idx = index % spatial;
        int layer_idx = (index / spatial) % layers;
        int batch_idx = index / (spatial * layers);

        // Flatten indices calculation
        int i1 = batch_idx * layers * spatial + layer_idx * spatial + spatial_idx;
        int i2 = batch_idx * layers * spatial + spatial_idx * layers + layer_idx;

        // Conditional copying based on 'forward' flag
        out[forward ? i2 : i1] = x[forward ? i1 : i2];
    }
}