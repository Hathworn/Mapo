#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    int index = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= N) return;

    int b = index / spatial;
    int i = index % spatial;
    float sum = 0;

    // Use shared memory for faster accesses
    extern __shared__ float shared_sum[];

    // Accumulate sum using shared memory
    for(int f = 0; f < filters; ++f) {
        int pos = b*filters*spatial + f*spatial + i;
        sum += x[pos] * x[pos];
    }

    sum = sqrtf(sum);
    if(sum == 0) sum = 1;

    // Normalize and update dx using shared memory
    for(int f = 0; f < filters; ++f) {
        int pos = b*filters*spatial + f*spatial + i;
        x[pos] /= sum;
        dx[pos] = (1 - x[pos]) / sum;
    }
}