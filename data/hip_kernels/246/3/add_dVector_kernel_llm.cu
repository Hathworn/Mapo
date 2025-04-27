#include "hip/hip_runtime.h"
#include "includes.h"

// Using __restrict__ pointers for better memory access optimization
// Launch with minimum threads and blocks required
__global__ void add_dVector_kernel(double *__restrict__ a, double *__restrict__ b, double *__restrict__ c, int n) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Unrolling loop for potential performance boost
    if (id * 4 < n) {
        int index = id * 4;
        c[index] = a[index] + b[index];
        if (index + 1 < n) c[index + 1] = a[index + 1] + b[index + 1];
        if (index + 2 < n) c[index + 2] = a[index + 2] + b[index + 2];
        if (index + 3 < n) c[index + 3] = a[index + 3] + b[index + 3];
    }
}