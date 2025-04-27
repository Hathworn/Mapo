#include "hip/hip_runtime.h"
#include "includes.h"

const int ITERS = 500;

__global__ void convolve(float* data_in, float* data_out, float* kernel, int kernelSize, int BLOCK_SIZE)
{
    int tx = threadIdx.x;
    int bk = blockIdx.x;
    int pos = (bk * BLOCK_SIZE) + tx;

    // Use shared memory for kernel to reduce global memory access
    extern __shared__ float shared_kernel[];

    if (tx < kernelSize) {
        shared_kernel[tx] = kernel[tx];
    }
    __syncthreads();

    data_out[pos] = 0;

    for (int i = 0; i < kernelSize; i++) {
        if (pos - i >= 0) {
            data_out[pos] += shared_kernel[i] * data_in[pos - i];  // Use shared memory
        }
    }
}