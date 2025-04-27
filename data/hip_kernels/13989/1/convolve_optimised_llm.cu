#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

const int ITERS = 500;

__global__ void convolve_optimised(float* data_in, float* data_out, float* kernel, int kernelSize, int BLOCK_SIZE)
{
    int tx = threadIdx.x;
    int bk = blockIdx.x;

    extern __shared__ float data_in_shared[];

    int pos = (bk * BLOCK_SIZE) + tx;

    // Load input data into shared memory, handle boundary condition for shared memory
    data_in_shared[tx] = data_in[pos];
    if (tx < kernelSize - 1) {
        data_in_shared[BLOCK_SIZE + tx] = data_in[min(pos + BLOCK_SIZE, (blockDim.x * gridDim.x) - 1)];
    }
    __syncthreads();

    // Initialize output value
    float sum = 0.0f;

    // Perform convolution
    for (int i = 0; i < kernelSize; i++) {
        sum += kernel[i] * data_in_shared[tx + i];
    }

    // Write result to global memory
    data_out[pos] = sum;
}