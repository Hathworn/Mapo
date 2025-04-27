#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuInsertionSort(float *dist, int dist_pitch, int *ind, int ind_pitch, int width, int height, int k) {

    // Using shared memory for faster access
    extern __shared__ float shared_mem[];
    int* shared_ind = (int*)&shared_mem[k * blockDim.x];
  
    int xIndex = blockIdx.x * blockDim.x + threadIdx.x;

    if (xIndex < width) {

        float* p_dist = dist + xIndex;
        int* p_ind = ind + xIndex;
    
        // Load data into shared memory
        for (int idx = threadIdx.y; idx < k; idx += blockDim.y) {
            shared_mem[threadIdx.x + idx * blockDim.x] = p_dist[idx * dist_pitch];
            shared_ind[threadIdx.x + idx * blockDim.x] = p_ind[idx * ind_pitch];
        }
        __syncthreads();

        // Perform insertion sort in shared memory
        float max_dist = shared_mem[threadIdx.x];
        shared_ind[threadIdx.x] = 1;

        for (int l = 1; l < k; ++l) {
            float curr_dist = shared_mem[threadIdx.x + l * blockDim.x];
            if (curr_dist < max_dist) {
                int i = l - 1;
                for (int a = 0; a < l - 1; ++a) {
                    if (shared_mem[threadIdx.x + a * blockDim.x] > curr_dist) {
                        i = a;
                        break;
                    }
                }
                for (int j = l; j > i; --j) {
                    shared_mem[threadIdx.x + j * blockDim.x] = shared_mem[threadIdx.x + (j - 1) * blockDim.x];
                    shared_ind[threadIdx.x + j * blockDim.x] = shared_ind[threadIdx.x + (j - 1) * blockDim.x];
                }
                shared_mem[threadIdx.x + i * blockDim.x] = curr_dist;
                shared_ind[threadIdx.x + i * blockDim.x] = l + 1;
            } else {
                shared_ind[threadIdx.x + l * blockDim.x] = l + 1;
                max_dist = curr_dist;
            }
        }

        // Additional sorting for the kth elements
        int max_row = (k - 1) * dist_pitch;
        for (int l = k; l < height; ++l) {
            float curr_dist = p_dist[l * dist_pitch];
            if (curr_dist < max_dist) {
                int i = k - 1;
                for (int a = 0; a < k - 1; ++a) {
                    if (shared_mem[threadIdx.x + a * blockDim.x] > curr_dist) {
                        i = a;
                        break;
                    }
                }
                for (int j = k - 1; j > i; --j) {
                    shared_mem[threadIdx.x + j * blockDim.x] = shared_mem[threadIdx.x + (j - 1) * blockDim.x];
                    shared_ind[threadIdx.x + j * blockDim.x] = shared_ind[threadIdx.x + (j - 1) * blockDim.x];
                }
                shared_mem[threadIdx.x + i * blockDim.x] = curr_dist;
                shared_ind[threadIdx.x + i * blockDim.x] = l + 1;
                max_dist = shared_mem[threadIdx.x + max_row];
            }
        }
        
        // Copy back sorted data from shared memory to global memory
        for (int idx = threadIdx.y; idx < k; idx += blockDim.y) {
            p_dist[idx * dist_pitch] = shared_mem[threadIdx.x + idx * blockDim.x];
            p_ind[idx * ind_pitch] = shared_ind[threadIdx.x + idx * blockDim.x];
        }
    }
}