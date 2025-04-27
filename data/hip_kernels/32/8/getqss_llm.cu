#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getqss(double *IN, double *qss, int N, int t) {
    // Use direct index calculation and avoid unnecessary variables
    int I = 10 * N + 10; 
    qss[t] = IN[I];
}