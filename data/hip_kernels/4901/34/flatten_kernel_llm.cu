#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation
    if(index >= N) return;

    int spatial_area = layers * spatial; // Pre-compute common multiplication
    int b = index / spatial_area;
    int i = index % spatial_area;
    
    int in_c = i / spatial;
    int in_s = i % spatial;

    int i1 = b * spatial_area + in_c * spatial + in_s;
    int i2 = b * spatial_area + in_s * layers + in_c;

    if (forward) out[i2] = x[i1];
    else out[i1] = x[i2];
}