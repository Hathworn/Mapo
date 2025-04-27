#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __extractmat(double *a, int *b, long long *c, int n) {
    // Calculate a unique global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x + gridDim.x * blockIdx.y * blockDim.x;
    
    // Use local constants for better performance
    const int signbit = 0x80000000;
    const int mag = 0x7fffffff;
    
    // Use stride pattern to allow all threads to effectively iterate over data
    for (int i = tid; i < n; i += blockDim.x * gridDim.x * gridDim.y) {
        // Access elements using pointer arithmetic for efficient memory handling
        int vi = *(reinterpret_cast<int *>(&c[i]));
        if (vi & signbit) {
            vi = -(vi & mag);
        }
        a[i] = static_cast<double>(vi);  // Directly set double for clarity
        b[i] = *(reinterpret_cast<int *>(&c[i]) + 1);  // Efficient access for second part
    }
}