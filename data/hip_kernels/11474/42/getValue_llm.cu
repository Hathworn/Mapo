#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void getValue(float *outdata, float *indata) {
    // Optimize by directly assigning the value based on the condition
    float result = (indata == nullptr) ? 3.0f : 2.0f;
    outdata[0] = result;
}