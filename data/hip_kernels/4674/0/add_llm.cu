#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

// Optimized: Coalesced memory access and offset checking
__global__ void add(int *a, int *b, int *c, int n) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    if (index < n) { // Ensure index is within bounds
        c[index] = a[index] + b[index];
    }
}