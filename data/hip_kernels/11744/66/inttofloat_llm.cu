#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inttofloat(float *out, int *in) {
    int idx = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x; // Calculate global thread index
    out[idx] = __int_as_float(in[idx]); // Efficient int-to-float conversion
}