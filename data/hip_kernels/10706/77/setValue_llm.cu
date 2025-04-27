#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setValue(float *data, int idx, float value) {
    // Use all threads for potential reduction in latency
    if(blockIdx.x * blockDim.x + threadIdx.x == 0) {
        data[idx] = value;
    }
}