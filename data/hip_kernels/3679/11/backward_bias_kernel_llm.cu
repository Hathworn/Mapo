#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Loop unrolling for performance
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; i += BLOCK * 4) {
            int index1 = p + i + size * (filter + n * b);
            int index2 = index1 + BLOCK;
            int index3 = index2 + BLOCK;
            int index4 = index3 + BLOCK;

            sum += (p + i < size) ? delta[index1] : 0;
            sum += (p + i + BLOCK < size) ? delta[index2] : 0;
            sum += (p + i + 2 * BLOCK < size) ? delta[index3] : 0;
            sum += (p + i + 3 * BLOCK < size) ? delta[index4] : 0;
        }
    }

    part[p] = sum;
    __syncthreads();

    // Reduction using a single thread
    if (p == 0) {
        for (int i = 0; i < BLOCK; ++i) {
            bias_updates[filter] += part[i];
        }
    }
}