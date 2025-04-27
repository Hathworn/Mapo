#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mykernel(int *int1, float *f1, int *int2) {
    // Load int value and store it in float array using reinterpret_cast for better readability
    f1[0] = __int_as_float(int1[0]);

    // Load float value and store it in int array using reinterpret_cast for better readability
    int2[0] = __float_as_int(f1[0]);
}