#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void apply_weights_kernel(double *g_out, int *g_in, double *g_ttmp) {
    // Improved: Removed unnecessary variable declarations
    const int index = (blockIdx.x * blockDim.x + threadIdx.x) << 1;

    int val0 = g_in[index];
    int val1 = g_in[index + 1];
    double ttp_temp0 = g_ttmp[index];
    double ttp_temp1 = fabs(g_ttmp[index + 1]);

    // Simplified: Direct assignment of test without using a variable
    double coeff = ttp_temp0 < 0.0 ? -g_ttp_inc[0] : -g_ttp_inc[1];

    // Optimized: Fewer operations by combining multiplication and assignment
    g_out[index] = val0 * coeff;
    g_out[index + 1] = val1 * ttp_temp1;
}