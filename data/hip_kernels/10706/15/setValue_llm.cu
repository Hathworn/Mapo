#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

__global__ void setValue(float *data, int idx, float value) {
    // Assign only if the target index is within bounds and is accessed by the first thread
    if(threadIdx.x == 0 && idx < gridDim.x * blockDim.x) {
        data[idx] = value;
    }
}