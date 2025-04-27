#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculateIntermediates(int n, double *xs, int *cluster_index, int *intermediates0, double *intermediates1, double *intermediates2, int k, int d) {
    int start = blockIdx.x * (n / gridDim.x);  // Define block start using grid size
    int end = min(start + (n / gridDim.x), n); // Use min to determine block end

    // Return if no work
    if (end <= start) return;

    // Loop for every K
    for (int clust = threadIdx.y; clust < k; clust += blockDim.y) {
        int count = 0; // Initialize count outside to share between dim

        // Loop for every dimension (features)
        for (int dim = threadIdx.x; dim < d; dim += blockDim.x) {
            double sum1 = 0.0;
            double sum2 = 0.0;
            
            for (int z = start; z < end; z++) {
                if (cluster_index[z] == clust) {
                    if (dim == 0) { 
                        count++; // Increment count for first dimension
                    }
                    int idx = z * d + dim;
                    sum1 += xs[idx];
                    sum2 += xs[idx] * xs[idx];
                }
            }
            if (dim == 0) {
                intermediates0[blockIdx.x * k + clust] = count;  // Set count outside dim loop
            }
            int index = (blockIdx.x * k * d + clust * d + dim);
            intermediates1[index] = sum1;
            intermediates2[index] = sum2;
        }
    }
}