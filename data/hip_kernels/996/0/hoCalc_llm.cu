#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hoCalc(double* rn, double* soilHeat, double* ho, int width_band) {
    int col = threadIdx.x + blockIdx.x * blockDim.x;

    if (col < width_band) {  // Optimization: Check boundary condition once
        ho[col] = rn[col] - soilHeat[col];
    }
    // Removed unnecessary loop to improve performance and reduce memory access
}