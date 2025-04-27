#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void selection_sort_gpu(int b, int n, int m, int k, float *dist, int *idx, float *val) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    idx += m * k * batch_index;
    val += m * k * batch_index;
    
    int index = threadIdx.x;
    int stride = blockDim.x;
    
    float *p_dist;
    for (int j = index; j < m; j += stride) {
        p_dist = dist + j * n;
        
        // Use shared memory for better cache performance
        __shared__ float shared_dist[1024];
        
        // Copy data to shared memory for current thread's portion
        for (int s = 0; s < n; s += stride) {
            if (s + index < n) {
                shared_dist[s + index] = p_dist[s + index];
            }
        }
        __syncthreads();
        
        // Selection sort for the first k elements
        for (int s = 0; s < k; ++s) {
            int min = s;
            // Find the min
            for (int t = s + 1; t < n; ++t) {
                if (shared_dist[t] < shared_dist[min]) {
                    min = t;
                }
            }
            // Update idx and val
            idx[j * n + s] = min;
            val[j * n + s] = shared_dist[min];
            // Swap min-th and s-th element
            float tmp = shared_dist[min];
            shared_dist[min] = shared_dist[s];
            shared_dist[s] = tmp;
        }
    }
}