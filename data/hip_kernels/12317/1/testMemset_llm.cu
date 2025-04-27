#include "hip/hip_runtime.h"
#include "includes.h"

/*
* Module to test HIP module loading and execution.
*/

#ifdef __cplusplus
extern "C" {
#endif

/// Sets the first N elements of array to value.
#ifdef __cplusplus
}
#endif
__global__ void testMemset(float* array, float value, int N){
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation
    if(i < N){
        array[i] = value;
    }
}