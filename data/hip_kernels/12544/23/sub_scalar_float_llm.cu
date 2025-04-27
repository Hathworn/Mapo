#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void sub_scalar_float(int n, int idx, float dx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Unroll the loop to improve performance
    for (int j = i; j < n; j += stride) {
        if(j >= idx && j % incy == 0)
            result[j] = dy[j] - dx;
    }
}