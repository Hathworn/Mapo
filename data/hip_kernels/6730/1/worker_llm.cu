#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void worker(double * a, long n) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < n) {
        // Use register variable for frequently used value to minimize memory access
        double val = a[i];
        a[i] = val + i;
    }
}