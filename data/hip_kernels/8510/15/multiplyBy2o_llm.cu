#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multiplyBy2o(int *size, const long *in, long *out) {
    const int ix = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for size to minimize global memory access
    __shared__ int shared_size;
    if (threadIdx.x == 0) {
        shared_size = *size;
    }
    __syncthreads();

    if (ix < shared_size) {
        out[ix] = in[ix] * 2;
    }
}