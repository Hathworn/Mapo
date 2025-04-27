#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void testMemset(float* array, float value, int N) {
    // Utilize HIP built-in function to optimize thread indexing
    int i = hipThreadIdx_x + hipBlockIdx_x * hipBlockDim_x; 

    if (i < N) {
        // Direct assignment to target memory location
        array[i] = value;
    }
}