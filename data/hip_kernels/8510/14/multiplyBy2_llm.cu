#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiplyBy2(int size, const long *in, long *out) {
    // Use grid-stride loop for better workload distribution
    for (int ix = threadIdx.x + blockIdx.x * blockDim.x; ix < size; ix += blockDim.x * gridDim.x) {
        out[ix] = in[ix] * 2;
    }
}