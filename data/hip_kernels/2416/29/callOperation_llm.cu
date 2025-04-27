#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperation(int *a, int *b, int *res, int k, int p, int n) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    if (tid < n) { // Combine condition check and operation
        int temp = a[tid] - b[tid]; // Use temporary variable to avoid redundant memory accesses
        res[tid] = (temp < k) ? p : temp; // Use ternary operator for concise condition handling
    }
}