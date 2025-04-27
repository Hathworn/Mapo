```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inttofloat(float *out, int *in) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global index
    out[idx] = __int_as_float(in[idx]); // Perform int to float conversion using HIP intrinsic function
}