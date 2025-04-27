#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

__global__ void neq_strided_float(int n, int xOffset, int yOffset, float *dx, float *dy, int incx, int incy, float *result) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    int stride = blockDim.x * gridDim.x; // Calculate stride

    for (int i = idx; i < n; i += stride) { // Optimized loop traversal with stride
        bool inRange = (i >= xOffset && i >= yOffset); // Check offset condition
        bool aligned = (i % incx == 0 && i % incy == 0); // Check stride alignment
        if (inRange && aligned) {
            result[i] = (dy[i] != dx[i]); // Assign result
        }
    }
}