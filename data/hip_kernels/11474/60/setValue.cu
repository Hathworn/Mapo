#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setValue(float *data, int idx, float value) {
if(threadIdx.x == 0) {
data[idx] = value;
}
}