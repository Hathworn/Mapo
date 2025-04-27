#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void symmetrize2D(float *h, int natoms) {
    const int elementNum = blockIdx.x * blockDim.x + threadIdx.x;
    const int dof = 3 * natoms;

    if (elementNum < dof * dof) { // Process only valid elements
        int r = elementNum / dof;
        int c = elementNum % dof;

        if (r <= c) { // Only handle the upper triangular and diagonal
            const float avg = 0.5f * (h[r * dof + c] + h[c * dof + r]);
            h[r * dof + c] = avg;
            h[c * dof + r] = avg;
        }
    }
}