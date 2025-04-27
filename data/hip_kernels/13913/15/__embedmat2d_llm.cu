#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __embedmat2d(float *a, long long *b, int nrows, int ncols, int sortdown) {
    // Calculate the global thread ID
    int tid = threadIdx.x + blockDim.x * (blockIdx.x + gridDim.x * blockIdx.y);

    // Constants for handling sign bits
    const int signbit = 0x80000000;
    const int mag = 0x7fffffff;
    
    // Loop through each element this thread is responsible for
    for (int i = tid; i < nrows * ncols; i += blockDim.x * gridDim.x * gridDim.y) {
        // Read float value and interpret as integer
        float v = a[i];
        int vi = *((int *)&v);

        // Adjust integer value if it's negative
        if (vi & signbit) {
            vi = -(vi & mag);
        }

        // Determine column index considering sorting order
        int icol = i / nrows + 1;
        if (sortdown) {
            icol = ncols - icol + 1;
        }

        // Compute and store the result
        b[i] = static_cast<long long>(vi) + (static_cast<long long>(icol) << 32);
    }
}