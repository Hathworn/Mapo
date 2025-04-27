#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dev_get_gravity_at_point(float eps2, float *eps, float *xh, float *yh, float *zh, float *xt, float *yt, float *zt, float *ax, float *ay, float *az, int n, float *field_m, float *fxh, float *fyh, float *fzh, float *fxt, float *fyt, float *fzt, int n_field) {
    // Calculate thread id
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Loop through particles, stride by blockDim * gridDim for efficiency
    while (tid < n) {
        float eps2_total = eps2 + eps[tid] * eps[tid];
        float ax_temp = 0.0f;
        float ay_temp = 0.0f;
        float az_temp = 0.0f;
        
        // Main loop for gravitational field calculation
        for (int i = 0; i < n_field; i++) {
            float dx = (fxh[i] - xh[tid]) + (fxt[i] - xt[tid]);
            float dy = (fyh[i] - yh[tid]) + (fyt[i] - yt[tid]);
            float dz = (fzh[i] - zh[tid]) + (fzt[i] - zt[tid]);
            float dr2 = dx * dx + dy * dy + dz * dz;
            
            if (dr2 > 0.0f) {
                float r2 = eps2_total + dr2;
                float inv_r = rsqrtf(r2);
                float tmp = field_m[i] * inv_r * inv_r * inv_r; // Use rsqrtf for better performance
                ax_temp += tmp * dx;
                ay_temp += tmp * dy;
                az_temp += tmp * dz;
            }
        }
        
        // Accumulate into global memory
        ax[tid] = ax_temp;
        ay[tid] = ay_temp;
        az[tid] = az_temp;
        
        // Proceed to the next thread within grid
        tid += blockDim.x * gridDim.x;
    }
}