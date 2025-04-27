#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(double *a, int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        // Efficiently square the element
        double value = a[idx];
        a[idx] = value * value;
        printf("idx = %d, a = %f\n", idx, a[idx]);  // Debug output, can be removed for performance
    }
}