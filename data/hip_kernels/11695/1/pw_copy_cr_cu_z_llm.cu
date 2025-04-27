#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_copy_cr_cu_z(const double *zin, double *dout, const int n) {
    // Calculate the global thread ID more concisely
    int igpt = blockIdx.x * blockDim.x + threadIdx.x;

    // Utilize grid-stride loop for better performance on larger data sizes
    for (int i = igpt; i < n; i += blockDim.x * gridDim.x) {
        dout[i] = zin[2 * i]; // Efficient memory access pattern
    }
}