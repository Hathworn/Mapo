#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vector_add(double const *A_dev, double const *B_dev, double *C_dev, int const N) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Ensure the range is checked before accessing the arrays
    if (i < N) {
        C_dev[i] = A_dev[i] + B_dev[i];
    }
}