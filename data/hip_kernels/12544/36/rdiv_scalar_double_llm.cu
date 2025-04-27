#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void rdiv_scalar_double(int n, int idx, float dx, float *dy, int incy, double *result) {
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use strided loop for processing elements
    for (; i < n; i += blockDim.x * gridDim.x) {
        // Only compute for valid elements
        if (i >= idx && i % incy == 0) {
            result[i] = dx / dy[i];
        }
    }
}