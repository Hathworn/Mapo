#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void selection_sort_gpu(int b, int n, int m, int k, float *dist, int *idx, float *val) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    idx += m * k * batch_index;
    val += m * k * batch_index;

    // Utilize shared memory for better memory access pattern
    extern __shared__ float shared_dist[];
    
    int index = threadIdx.x;
    int stride = blockDim.x;

    for (int j = index; j < m; j += stride) {
        float* p_dist = &shared_dist[j * n];
        // Load distance data to shared memory
        for (int t = threadIdx.x; t < n; t += stride) {
            p_dist[t] = dist[j * n + t];
        }
        __syncthreads();

        // Perform selection sort on shared memory
        for (int s = 0; s < k; ++s) {
            int min = s;
            for (int t = s + 1; t < n; ++t) {
                if (p_dist[t] < p_dist[min]) {
                    min = t;
                }
            }
            idx[j * n + s] = min;
            val[j * n + s] = p_dist[min];
            // Swap min-th and s-th element
            float tmp = p_dist[min];
            p_dist[min] = p_dist[s];
            p_dist[s] = tmp;
        }
        __syncthreads();
    }
}