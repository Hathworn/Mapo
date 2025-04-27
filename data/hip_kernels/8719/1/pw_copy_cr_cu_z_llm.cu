#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pw_copy_cr_cu_z(const double *zin, double *dout, const int n) {
    // Calculate global index with grid-stride loop for better performance
    for (int igpt = blockIdx.x * blockDim.x + threadIdx.x;
         igpt < n;
         igpt += blockDim.x * gridDim.x) {
        dout[igpt] = zin[2 * igpt];
    }
}