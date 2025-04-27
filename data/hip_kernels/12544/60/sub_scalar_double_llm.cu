#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void sub_scalar_double(int n, int idx, double dx, double *dy, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Efficient loop with stride to maximize occupancy
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = dy[i] - dx;
        }
    }
}