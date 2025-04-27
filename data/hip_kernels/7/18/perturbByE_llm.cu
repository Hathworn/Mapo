#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void perturbByE(float *tmppos, float4 *mypos, float eps, float *E, float *masses, int k, int m, int N) {
    int dof = blockIdx.x * blockDim.x + threadIdx.x;
    if (dof >= N) return;

    int atom = dof / 3;
    int axis = dof % 3;

    // Precompute common terms
    float scaleFactor = eps * E[dof * m + k] / sqrtf(masses[atom]);

    // Use shared memory for read/modify/write operations
    float4 pos = mypos[atom];
    if (axis == 0) {
        tmppos[dof] = pos.x;
        pos.x += scaleFactor;
    } else if (axis == 1) {
        tmppos[dof] = pos.y;
        pos.y += scaleFactor;
    } else {
        tmppos[dof] = pos.z;
        pos.z += scaleFactor;
    }
    // Write back only once
    mypos[atom] = pos;
}