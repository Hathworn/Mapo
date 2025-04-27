#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void sign_float(int n, int idx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop through array with stride to use coalesced reads
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            float x = dy[i];
            result[i] = (x > 0) - (x < 0); // Assign sign of x
        }
    }
}