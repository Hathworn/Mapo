#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(float *in1, float *in2, float *out, int len) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < len) {
        out[i] = __fadd_rn(in1[i], in2[i]); // Use fast intrinsic function for addition
    }
}