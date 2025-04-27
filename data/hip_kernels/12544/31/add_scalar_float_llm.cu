#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void add_scalar_float(int n, int idx, float dx, float *dy, int incy, float *result) {
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Adjusted loop to exit early if all relevant elements have been processed
    while (i < n) {
        if(i >= idx && i % incy == 0)
            result[i] = dy[i] + dx;
        i += blockDim.x * gridDim.x; // Increment by total number of threads
    }
}