#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void getValue(float *outdata, float *indata) {
outdata[0] = indata[0] + 3.0f;
}