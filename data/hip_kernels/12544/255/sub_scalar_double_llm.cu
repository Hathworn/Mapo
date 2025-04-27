```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sub_scalar_double(int n, int idx, double dx, double *dy, int incy, double *result) {
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop to cover all elements
    int stride = blockDim.x * gridDim.x;
    
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = dy[i] - dx;
        }
    }
}