#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ApplyBrainsMovement(float *CCXY, int dim_XY, float *movement, int dim_movement, int max_clusters) {
    // Compute global thread id
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Check if thread id is within bounds
    if (id < max_clusters) {
        int idx = id * dim_XY;
        
        // Apply movement in XY direction
        if (dim_movement >= 2) {
            CCXY[idx]     -= movement[0];
            CCXY[idx + 1] -= movement[1];
        }

        // Placeholder for rotation in X direction if needed in future
        if (dim_movement >= 3) {
            // Currently no operation
        }
    }
}