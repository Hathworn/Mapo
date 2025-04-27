#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float explicitLocalStepHeat(float unjpo, float unjmo, float unj, float r) {
    return (1 - 2 * r) * unj + r * unjmo + r * unjpo;
}

__global__ void explicitTimestepHeat(int size, float *d_currentVal, float *d_nextVal, float r) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Optimized indexing for clarity and standard convention
    if (i < size) {
        if (i < 2 || i > size - 2) {  // Combined boundary checks for clarity and efficiency
            d_nextVal[i] = 0;  // Fixed assignment operator from '==' to '='
        } else {
            d_nextVal[i] = explicitLocalStepHeat(
                d_currentVal[i + 1],
                d_currentVal[i - 1],
                d_currentVal[i],
                r
            );
        }
    }
}