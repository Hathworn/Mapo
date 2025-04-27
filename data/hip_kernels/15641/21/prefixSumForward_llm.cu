#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prefixSumForward(float* arr, int step, int n) { // Added n as a parameter
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Combined bx, tx, BX into a single line
    int ii = i + 1; // Direct computation of ii

    // Early exit to reduce unnecessary computations
    if (ii > n || ii <= n / float(step)) return;

    // Improved memory access pattern
    int idx1 = ii * step - 1;
    int idx2 = idx1 - step / 2;
    arr[idx1] += arr[idx2];

    // Avoid boundary condition overhead
    if (step == n && idx1 == n - 1) {
        arr[ii * step] = arr[idx1];
        arr[idx1] = 0.0f; // Ensuring floating point consistency
    }
}