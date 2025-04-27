#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
__global__ void ceil_double(int n, int idx, double *dy, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Optimize by unrolling the loop to reduce iterations
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = ceil(dy[i]);
        }
    }
}