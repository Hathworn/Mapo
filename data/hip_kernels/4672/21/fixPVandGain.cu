#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fixPVandGain(float* output, float gain, int lowestIndx, int length) {
int i = threadIdx.x + blockDim.x*blockIdx.x;
int j = i<<1;
if (j >= lowestIndx && j < length) {
if (isnan(output[j]))   // LIKELY, THERE IS A PERFORMANCE LOSS HERE
output[j] = 0.0f;  // set to zero any invalid amplitude
if (output[j+1] == -1.0f) {   // LIKELY, THERE IS A PERFORMANCE LOSS HERE
output[j] = 0.0f;   // set to zero the amp related to any undefined frequency
}
else
output[j] *= gain;   // scale all amplitudes by the gain factor
}
}