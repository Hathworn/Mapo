#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void check_results_kernel(int n, double correctvalue, double* x) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure the thread index is within array bounds
    if (i < n) {
        // Compare using epsilon to handle floating-point comparison issues
        if (fabs(x[i] - correctvalue) > 1e-9) {
            printf("ERROR at index = %d, expected = %f, actual: %f\n", i, correctvalue, x[i]);
        }
    }
}