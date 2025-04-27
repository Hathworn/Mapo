#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_centroids(int d, int k, int* counts, double* centroids) {
    int global_id_x = threadIdx.x + blockIdx.x * blockDim.x;
    int global_id_y = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Use shared memory for counts to reduce global memory access
    __shared__ int shared_counts[1024]; // Adjust size based on maximum possible 'k'
    
    if (global_id_y < k && threadIdx.x == 0) {
        shared_counts[global_id_y] = counts[global_id_y];
    }
    __syncthreads(); // Ensure all threads have loaded the data
    
    if (global_id_x < d && global_id_y < k) {
        int count = shared_counts[global_id_y];
        // To avoid introducing divide by zero errors
        // If a centroid has no weight, we'll do no normalization
        // This will keep its coordinates defined.
        if (count < 1) {
            count = 1;
        }
        double scale = 1.0 / double(count);
        centroids[global_id_x + d * global_id_y] *= scale;
    }
}