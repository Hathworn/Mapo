#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getqss(double *IN, double *qss, int N, int t) {
    // Load indices into registers to minimize memory access
    const int i = 10; 
    const int j = 10;

    // Calculate the index using pre-computed i and j
    const int I = j * N + i;

    // Directly assign the value to qss without extra computations
    qss[t] = IN[I];
}