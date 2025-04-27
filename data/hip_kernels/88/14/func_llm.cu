#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void func (char* stringInput, int stringSize, int* integerInput, char* dummySpace) {
    // Use thread index to calculate the position in the output array
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int totalSize = stringSize + sizeof(int);

    // Ensure index is within bounds
    if (idx < totalSize) {
        if (idx < stringSize) {
            // Copy string input to dummySpace
            dummySpace[idx] = stringInput[idx];
        } else {
            // Copy integer input to dummySpace
            dummySpace[idx] = ((char*)integerInput)[idx - stringSize];
        }
    }
}