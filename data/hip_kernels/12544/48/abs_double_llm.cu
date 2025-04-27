#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void abs_double(int n, int idx, double *dy, int incy, double *result) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Iterate over the array using stride
    while (i < n) {
        // Check conditions and compute
        if (i >= idx && i % incy == 0) {
            result[i] = abs(dy[i]);
        }
        // Move to the next element by stride
        i += blockDim.x * gridDim.x;
    }
}