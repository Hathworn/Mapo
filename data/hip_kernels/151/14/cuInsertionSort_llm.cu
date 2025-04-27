#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuInsertionSort(float *dist, int dist_pitch, int *ind, int ind_pitch, int width, int height, int k) {
    // Assign thread index
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if the thread is within bounds
    if (xIndex < width) {
        // Pointer setup
        float *p_dist = dist + xIndex;
        int *p_ind = ind + xIndex;
        
        // Initialize first element
        float max_dist = p_dist[0];
        p_ind[0] = 1;
        
        // Part 1: Sort the first k elements
        for (int l = 1; l < k; l++) {
            int curr_row = l * dist_pitch;
            float curr_dist = p_dist[curr_row];
            
            // Optimized insertion sort for the first k elements
            if (curr_dist < max_dist) {
                int i = l - 1;
                while (i >= 0 && p_dist[i * dist_pitch] > curr_dist) {
                    i--;
                }
                i++;
                for (int j = l; j > i; j--) {
                    p_dist[j * dist_pitch] = p_dist[(j - 1) * dist_pitch];
                    p_ind[j * ind_pitch] = p_ind[(j - 1) * ind_pitch];
                }
                p_dist[i * dist_pitch] = curr_dist;
                p_ind[i * ind_pitch] = l + 1;
                max_dist = p_dist[(k - 1) * dist_pitch];
            } else {
                p_ind[l * ind_pitch] = l + 1;
            }
        }
        
        // Part 2: Insert remaining elements
        for (int l = k; l < height; l++) {
            int curr_row = l * dist_pitch;
            float curr_dist = p_dist[curr_row];
            
            // Insert only if the current distance is smaller
            if (curr_dist < max_dist) {
                int i = k - 1;
                while (i >= 0 && p_dist[i * dist_pitch] > curr_dist) {
                    i--;
                }
                i++;
                for (int j = k - 1; j > i; j--) {
                    p_dist[j * dist_pitch] = p_dist[(j - 1) * dist_pitch];
                    p_ind[j * ind_pitch] = p_ind[(j - 1) * ind_pitch];
                }
                p_dist[i * dist_pitch] = curr_dist;
                p_ind[i * ind_pitch] = l + 1;
                max_dist = p_dist[(k - 1) * dist_pitch];
            }
        }
    }
}