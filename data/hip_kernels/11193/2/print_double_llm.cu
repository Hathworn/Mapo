#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_double(double* x, int leng) {
    // Using grid stride loop for better parallel execution
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < leng; i += blockDim.x * gridDim.x) {
        printf("%lf,", x[i]);
    }
}