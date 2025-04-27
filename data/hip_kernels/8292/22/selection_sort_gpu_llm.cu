#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized selection sort kernel
__global__ void selection_sort_gpu(int b, int n, int m, int k, float *dist, int *idx, float *val) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    idx += m * k * batch_index;
    val += m * k * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    __shared__ float shared_dist[1024];  // Assuming n is <= 1024, use shared memory for faster access

    float *p_dist;
    for (int j = index; j < m; j += stride) {
        p_dist = dist + j * n;
        
        for (int t = index; t < n; t += stride) {  // Copy data to shared memory
            shared_dist[t] = p_dist[t];
        }
        __syncthreads();
        
        // Selection sort for the first k elements using shared memory
        for (int s = 0; s < k; ++s) {
            int min = s;
            
            // Find the min, operate on shared memory
            for (int t = s + 1; t < n; ++t) {
                if (shared_dist[t] < shared_dist[min]) {
                    min = t;
                }
            }
            
            // Update idx and val
            idx[j * n + s] = min;
            val[j * n + s] = shared_dist[min];
            
            // Swap min-th and i-th element in shared memory
            float tmp = shared_dist[min];
            shared_dist[min] = shared_dist[s];
            shared_dist[s] = tmp;
        }
    }
}