#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ApplyBrainsMovement(float *CCXY, int dim_XY, float *movement, int dim_movement, int max_clusters) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Compute 1D global thread ID
    if (id < max_clusters) { // Check for valid cluster index within bounds
        if (dim_movement >= 2) { // Check for movement in XY
            float m0 = movement[0]; // Load movement values into registers for faster access
            float m1 = movement[1];
            CCXY[id * dim_XY] -= m0; // Apply movement in X
            CCXY[id * dim_XY + 1] -= m1; // Apply movement in Y
        }
        if (dim_movement >= 3) { // Placeholder for additional dimensions, if needed
            // Future work: Apply additional transformations in X
        }
    }
}