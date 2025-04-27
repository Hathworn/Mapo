#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pw_copy_cr_cu_z(const double *zin, double *dout, const int n) {
    // Calculate global index more efficiently
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Use an if condition to avoid out of bounds access and unnecessary computation
    if (igpt < n) {
        dout[igpt] = zin[2 * igpt];
    }
}