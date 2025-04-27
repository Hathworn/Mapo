#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

__global__ void setValue(float *data, int idx, float value) {
    // Optimize by using atomic operation to avoid potential race conditions
    if(threadIdx.x == 0 && idx < blockDim.x * gridDim.x) {
        atomicExch(&data[idx], value);
    }
}