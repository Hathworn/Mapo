#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void trace_subm(int j, int k, int *daG, int *dbG, double *AB, double *A) {
    int l;
    double sum = 0.0;  // Use a local variable to accumulate the sum
    int db = *dbG;    // Cache dereferenced pointers for better performance
    for (l = 0; l < db; l++) {
        sum += *(AB + j * db + l + k * db + l);
    }
    *(A + j * (*daG) + k) += sum;
}

__global__ void ptrBp(int *daG, int *dbG, double *ABg, double *Ag) {
    int k = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (k < *daG && j < *dbG) {  // Add boundary check to avoid out-of-bounds access
        trace_subm(j, k, daG, dbG, ABg, Ag);
    }
}