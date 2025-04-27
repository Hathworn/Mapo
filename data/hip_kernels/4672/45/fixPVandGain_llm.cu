#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fixPVandGain(float* output, float gain, int lowestIndx, int length) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = i << 1;
    if (j >= lowestIndx && j < length) {
        float val = output[j];
        
        // Optimize isnan check by using a bitwise trick
        if (!(val == val)) { 
            val = 0.0f;   // set to zero any invalid amplitude
        } else {
	        // Combine checks for output[j+1]
            float nextVal = output[j + 1];
            if (nextVal != -1.0f) {
                val *= gain; // scale all amplitudes by the gain factor
            } else {
                val = 0.0f;  // set to zero the amp related to any undefined frequency
            }
        }
        
        output[j] = val;
    }
}