#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rsub_scalar_float(int n, int idx,float dx,float *dy,int incy,float *result) {
    // Use a single variable for all loop computations
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop and perform work in shared memory if possible
    for (; i < n; i += blockDim.x * gridDim.x) {
        if (i >= idx && i % incy == 0)
            result[i] = dx - dy[i];
    }
}