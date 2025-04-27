#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Compute(int *a, int k, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate the id in the most optimized way
    int id = ((i / k) << 1) * k + k + (i % k); // Optimized calculation of id

    if (id < n) {
        a[id] += a[id - (id % k) - 1]; // Perform operation only if within bounds
    }
}