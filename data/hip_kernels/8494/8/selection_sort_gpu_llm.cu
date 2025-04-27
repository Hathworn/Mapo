#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void selection_sort_gpu(int b, int n, int m, int k, const float *dist, int *outi, float *out) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    outi += m * n * batch_index;
    out += m * n * batch_index;
    
    int index = threadIdx.x;
    int stride = blockDim.x;
    
    // Optimize: Unroll loop for copy operation
    for (int j = index; j < m; j += stride) {
        #pragma unroll
        for (int s = 0; s < n; ++s) {
            out[j * n + s] = dist[j * n + s];
            outi[j * n + s] = s;
        }
    }
    
    float *p_dist;
    for (int j = index; j < m; j += stride) {
        p_dist = out + j * n;
        
        // Optimize: Unroll selection sort for the first k elements
        for (int s = 0; s < k; ++s) {
            int min = s;
            
            for (int t = s + 1; t < n; ++t) {
                if (p_dist[t] < p_dist[min]) {
                    min = t;
                }
            }
            
            if (min != s) {
                // Optimize: Avoid temporary variables by using tuple swap
                swap(p_dist[min], p_dist[s]);
                swap(outi[j * n + min], outi[j * n + s]);
            }
        }
    }
}