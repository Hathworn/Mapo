```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void marks(float *media, int *final){
    int thread = blockIdx.x * blockDim.x + threadIdx.x;
    float value = media[thread];
    int intValue = (int)value;
    
    // Use one conditional statement and simplify calculations
    if (value == intValue) {
        final[thread] = intValue;
    } else if (value > 4 && value < 5) {
        final[thread] = 4;
    } else if (value > 9) {
        final[thread] = 9;
    } else {
        final[thread] = intValue + 1;
    }
}