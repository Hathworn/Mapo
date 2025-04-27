#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuInsertionSort(float *dist, long *ind, int width, int height, int k) {
    // Variables
    float *p_dist;
    long *p_ind;
    float curr_dist, max_dist;
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;

    if (xIndex < width) {        
        // Pointer shift, initialization
        p_dist = dist + xIndex;
        p_ind = ind + xIndex;
        max_dist = p_dist[0];
        p_ind[0] = 1;

        // Part 1 : sort first k elements
        for (int l = 1; l < k; l++) {
            int curr_row = l * width;
            curr_dist = p_dist[curr_row];
            
            if (curr_dist < max_dist) {
                int i = l - 1;
                while (i >= 0 && p_dist[i * width] > curr_dist) i--;  // Find the insertion point
                
                for (int j = l; j > i + 1; j--) {
                    p_dist[j * width] = p_dist[(j - 1) * width];
                    p_ind[j * width] = p_ind[(j - 1) * width];
                }
                
                p_dist[(i + 1) * width] = curr_dist;
                p_ind[(i + 1) * width] = l + 1;
            } else {
                p_ind[l * width] = l + 1;
            }
            
            max_dist = p_dist[curr_row];
        }

        // Part 2 : insert element in the first k sorted lines
        for (int l = k; l < height; l++) {
            curr_dist = p_dist[l * width];
            
            if (curr_dist < max_dist) {
                int i = k - 1;
                while (i >= 0 && p_dist[i * width] > curr_dist) i--;  // Find the insertion point
                
                for (int j = k - 1; j > i + 1; j--) {
                    p_dist[j * width] = p_dist[(j - 1) * width];
                    p_ind[j * width] = p_ind[(j - 1) * width];
                }
                
                p_dist[(i + 1) * width] = curr_dist;
                p_ind[(i + 1) * width] = l + 1;
                max_dist = p_dist[(k - 1) * width];
            }
        }
    }
}