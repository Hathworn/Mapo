#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_double(double* x, int leng) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread index is within bounds and streamline cache access
    if(i < leng) {
        double value = x[i]; // Minimize memory traffic by caching value
        printf("%lf,", value); // Use cached value instead of direct access
    }
}