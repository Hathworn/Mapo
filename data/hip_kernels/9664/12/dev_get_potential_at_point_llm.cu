#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dev_get_potential_at_point(float eps2, float *eps, float *xh, float *yh, float *zh, float *xt, float *yt, float *zt, float *phi, int n, float *field_m, float *fxh, float *fyh, float *fzh, float *fxt, float *fyt, float *fzt, int n_field) {
    // Calculate unique thread index for each element
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Iterate while within bounds using a single for-loop
    while (tid < n) {
        float dx, dy, dz, dr2, r, eps2_total;
        // Precompute squared softening length for current particle
        eps2_total = eps2 + eps[tid] * eps[tid];
        // Initialize phi for current thread
        phi[tid] = 0;
        
        // Iterate over field particles
        for (int i = 0; i < n_field; i++) {
            dx = (fxh[i] - xh[tid]) + (fxt[i] - xt[tid]);
            dy = (fyh[i] - yh[tid]) + (fyt[i] - yt[tid]);
            dz = (fzh[i] - zh[tid]) + (fzt[i] - zt[tid]);
            dr2 = dx * dx + dy * dy + dz * dz;
            
            // Check distance is not zero and compute potential
            if (dr2 > 0) {
                r = sqrtf(eps2_total + dr2); // Use sqrtf for better performance
                phi[tid] -= field_m[i] / r;
            }
        }
        
        // Move onto the next set of threads
        tid += blockDim.x * gridDim.x;
    }
}