#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void foo() {
    // Cache the result to avoid redundant computations
    double cached_pow_result = pow(2, 32);
    for (int i = 0; i < 1000; i++) {
        // Use cached result instead of recalculating
        double result = cached_pow_result;
    }
}