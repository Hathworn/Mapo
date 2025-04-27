#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_get_neighbors(int *neighbors, int n, int k) {
    // Calculate the starting index for each block and thread
    int m = blockIdx.x * (n / gridDim.x) + threadIdx.x;
    int l = blockIdx.y * (n / gridDim.y) + threadIdx.y;

    // Ensure indices are within bounds
    if (m < n && l < n) {
        int counter_i = 0;
        for (int i = m - (k / 2); i <= m + (k / 2); i++) {
            int counter_j = 0;
            for (int j = l - (k / 2); j <= l + (k / 2); j++) {
                int index = m * n * k * k + l * k * k + counter_i * k + counter_j;
                int index_i = (n + i) % n;
                int index_j = (n + j) % n;
                neighbors[index] = index_i * n + index_j;
                counter_j++;
            }
            counter_i++;
        }
    }
}