#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_centroids(int d, int k, int* counts, double* centroids) {
    // Calculate global thread ID for effective memory access
    int global_id = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Check if within bounds of matrix range
    if (global_id < d * k) {
        int centroid_idx = global_id / d;
        int coord_idx = global_id % d;

        int count = counts[centroid_idx];
        
        // To avoid introducing divide by zero errors
        // If a centroid has no weight, we'll do no normalization
        // This will keep its coordinates defined.
        if (count < 1) {
            count = 1;
        }
        
        double scale = 1.0 / double(count);
        centroids[coord_idx + d * centroid_idx] *= scale;
    }
}