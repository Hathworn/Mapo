#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void k2(int *Aux, int *S) {
    int idx = threadIdx.x; // Compute the index only once
    Aux[idx] = S[(idx + 1) * B - 1];
}