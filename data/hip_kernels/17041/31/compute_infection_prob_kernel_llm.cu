#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_infection_prob_kernel(double alpha, double beta, int *infectious_rat_count, int *exposed_rat_count, int *rat_count, double *infection_prob_result, int width, int height) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x < width && y < height) {
        int nid = y * width + x;
        int current_rat_count = rat_count[nid];
        
        // Early exit if rat count is zero
        if (current_rat_count == 0) {
            infection_prob_result[nid] = 0.0;
            return;
        }
        
        double inv_rat_count = 1.0 / (double)current_rat_count; // Compute inverse once
        double density_of_exposed = (double)(exposed_rat_count[nid]) * inv_rat_count;
        double density_of_infectious = (double)(infectious_rat_count[nid]) * inv_rat_count;
        
        // Simplified calculation
        infection_prob_result[nid] = (alpha * density_of_infectious) + (beta * density_of_exposed);
    }
}