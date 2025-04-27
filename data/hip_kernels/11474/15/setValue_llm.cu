#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

__global__ void setValue(float *data, int idx, float value) {
    // Use a single thread block and assign work to shared memory
    __shared__ float sharedValue;

    if (threadIdx.x == 0) {
        sharedValue = value;  // Assign value to shared memory
    }
    __syncthreads();  // Synchronize threads within block

    if (threadIdx.x == 0) {
        data[idx] = sharedValue;  // Write to global memory
    }
}