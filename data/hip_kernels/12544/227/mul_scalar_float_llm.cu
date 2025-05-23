#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_scalar_float(int n, int idx, float dx, float *dy, int incy, float *result) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Coalesced memory access and improved iteration conditions
    for (; i < n; i += blockDim.x * gridDim.x) {
        if (i >= idx && i % incy == 0) {
            result[i] = dy[i] * dx;
        }
    }
}