#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void dwt_compare(float *d_ip_v, float *d_ip_ir, int len) {
    const int X = blockIdx.x * blockDim.x + threadIdx.x;
    if (X < len) {
        float abs_v = fabsf(d_ip_v[X]);  // Use fabsf for single-precision floats
        float abs_ir = fabsf(d_ip_ir[X]); // Use fabsf for single-precision floats
        d_ip_v[X] = (abs_v > abs_ir) ? d_ip_v[X] : d_ip_ir[X];
    }
}