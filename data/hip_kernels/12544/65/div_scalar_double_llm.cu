#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void div_scalar_double(int n, int idx, double dx, double *dy, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Compute global thread index
    if(i < n && i >= idx && i % incy == 0) {        // Check bounds and conditions
        result[i] = dy[i] / dx;                     // Perform division
    }
    // Use stride looping for larger datasets
    for (i += blockDim.x * gridDim.x; i < n; i += blockDim.x * gridDim.x) {
        if(i >= idx && i % incy == 0)
            result[i] = dy[i] / dx;
    }
}