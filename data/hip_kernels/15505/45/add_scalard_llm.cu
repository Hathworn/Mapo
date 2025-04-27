```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_scalard(double *v, double other, int n) {
    // Calculate the global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread does not access out-of-bounds memory
    if (x < n) {
        v[x] += other; // Add scalar to each element
    }
}