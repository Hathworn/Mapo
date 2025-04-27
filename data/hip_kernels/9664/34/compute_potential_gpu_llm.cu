#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void compute_potential_gpu(float *m, float *x, float *y, float *z, float *phi, int N, int N1) {
    // Calculate global thread index
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < (N1 == 0 ? N : N1)) {
        float xi = x[i];
        float yi = y[i];
        float zi = z[i];
        float potential = 0.0f;  // Initialize potential to zero

        // Loop through all points or from N1 to N when N1 is not zero
        for (int j = (N1 == 0 ? 0 : N1); j < N; j++) {
            if (i != j) {  // Ensure i and j are not the same
                // Calculate distance and potential contribution
                float rijx = xi - x[j];
                float rijy = yi - y[j];
                float rijz = zi - z[j];
                potential -= m[j] / sqrtf(rijx * rijx + rijy * rijy + rijz * rijz);
            }
        }
        phi[i] = potential;  // Store the calculated potential
    }
}