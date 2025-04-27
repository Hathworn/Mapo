#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dev_get_gravity_at_point( float eps2, float *eps, float *xh, float *yh, float *zh, float *xt, float *yt, float *zt, float *ax, float *ay, float *az, int n, float *field_m, float *fxh, float *fyh, float *fzh, float *fxt, float *fyt, float *fzt, int n_field) {
    // Use shared memory for reused values and reduce global memory accesses
    __shared__ float shared_eps2[1024]; 
    __shared__ float shared_field_m[1024];
    
    int tid = threadIdx.x + blockIdx.x * blockDim.x; // Optimized thread indexing
    int lane_id = threadIdx.x;

    // Preloading data into shared memory
    if (lane_id < n) {
        shared_eps2[lane_id] = eps[lane_id];
    }
    if (lane_id < n_field) {
        shared_field_m[lane_id] = field_m[lane_id];
    }
    __syncthreads();

    float dx, dy, dz, r2, tmp, dr2, eps2_total;

    if (tid < n) { // Ensure the thread operates only within range
        eps2_total = eps2 + shared_eps2[tid] * shared_eps2[tid];
        ax[tid] = 0; // Initialize acceleration components
        ay[tid] = 0;
        az[tid] = 0;

        for (int i = 0; i < n_field; i++) {
            dx = (fxh[i] - xh[tid]) + (fxt[i] - xt[tid]);
            dy = (fyh[i] - yh[tid]) + (fyt[i] - yt[tid]);
            dz = (fzh[i] - zh[tid]) + (fzt[i] - zt[tid]);
            dr2 = dx * dx + dy * dy + dz * dz;
            
            // Check to avoid division by zero
            if (dr2 > 0) {
                r2 = eps2_total + dr2;
                tmp = shared_field_m[i] / (r2 * sqrt(r2));
                ax[tid] += tmp * dx; // Accumulate acceleration
                ay[tid] += tmp * dy;
                az[tid] += tmp * dz;
            }
        }
    }
}