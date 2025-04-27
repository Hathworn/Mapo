#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void floyd1DKernel(int * M, const int nverts, const int k) {
    int ii = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate row (i) and column (j) indices from linear index
    int i = ii / nverts;
    int j = ii % nverts;

    // Check if indices are within bounds
    if (i < nverts && j < nverts) {
        int kj = (k * nverts) + j;
        int ik = (i * nverts) + k;

        // Only update if i, j, k are distinct
        if (i != j && i != k && j != k) {
            // Select minimum between current value and the calculated sum
            M[ii] = min(M[ik] + M[kj], M[ii]);
        }
    }
}