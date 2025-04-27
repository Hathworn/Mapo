#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_array_beam_slave_sincos_optimized(int N, float r1, float r2, float r3, float *x, float *y, float *z, float *sum, int blockDim_2) {
    unsigned int n = threadIdx.x;
    __shared__ float tmpsum[1024]; // Adjust shared memory size to a common block size power of 2

    if (n < N) {
        // Precalculate often used expression to reduce repetitive computation
        float angle = r1 * __ldg(&x[n]) + r2 * __ldg(&y[n]) + r3 * __ldg(&z[n]);
        float ss, cc;
        sincosf(angle, &ss, &cc);
        tmpsum[2 * n] = ss;
        tmpsum[2 * n + 1] = cc;
    }
    __syncthreads();

    // Optimize reduction by ensuring memory coalescing
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (n < stride && n + stride < blockDim_2 / 2) {
            tmpsum[2 * n] += tmpsum[2 * (n + stride)];
            tmpsum[2 * n + 1] += tmpsum[2 * (n + stride) + 1];
        }
        __syncthreads();
    }

    // Store the result from thread 0
    if (threadIdx.x == 0) {
        sum[0] = tmpsum[0];
        sum[1] = tmpsum[1];
    }
}