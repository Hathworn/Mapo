#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    // Calculate a global unique index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    // Calculate corresponding batch and spatial indices
    int b = index / spatial;
    int i = index % spatial;
    int f;
    float sum = 0.0f;

    // Use shared memory for reducing memory operations
    extern __shared__ float shared_mem[];
    float* local_x = shared_mem;

    // Accumulate squared values in shared memory
    for(f = 0; f < filters; ++f){
        int global_index = b*filters*spatial + f*spatial + i;
        local_x[f] = x[global_index];
        sum += local_x[f] * local_x[f];
    }
    sum = sqrtf(sum);
    if(sum == 0.0f) sum = 1.0f;

    // Normalize in shared memory and update global memory
    for(f = 0; f < filters; ++f){
        int global_index = b*filters*spatial + f*spatial + i;
        x[global_index] = local_x[f] / sum;
        dx[global_index] = (1.0f - x[global_index]) / sum;
    }
}