#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void boundaryCondition(const int nbrOfGrids, double *d_u1, double *d_u2, double *d_u3) {
    // Use shared memory for improved memory access efficiency
    extern __shared__ double sharedMem[];
    double *s_u1 = sharedMem;
    double *s_u2 = &sharedMem[nbrOfGrids];
    double *s_u3 = &sharedMem[nbrOfGrids * 2];

    int threadId = threadIdx.x;

    // Boundary conditions: only a single thread is needed for these updates
    if (threadId == 0) {
        // Copy data from global to shared memory
        s_u1[0] = d_u1[1];
        s_u2[0] = -d_u2[1];
        s_u3[0] = d_u3[1];

        // Apply boundary conditions on the other end
        s_u1[nbrOfGrids - 1] = d_u1[nbrOfGrids - 2];
        s_u2[nbrOfGrids - 1] = -d_u2[nbrOfGrids - 2];
        s_u3[nbrOfGrids - 1] = d_u3[nbrOfGrids - 2];

        // Copy data back to global memory
        d_u1[0] = s_u1[0];
        d_u2[0] = s_u2[0];
        d_u3[0] = s_u3[0];
        d_u1[nbrOfGrids - 1] = s_u1[nbrOfGrids - 1];
        d_u2[nbrOfGrids - 1] = s_u2[nbrOfGrids - 1];
        d_u3[nbrOfGrids - 1] = s_u3[nbrOfGrids - 1];
    }
}