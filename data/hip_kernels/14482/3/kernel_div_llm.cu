#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_div(char* newB, char* first, char* second, int size_first, int size_second, int * size_newB, char* aux) {
    int i = threadIdx.x;
    int j = threadIdx.y;
    
    // Handle sign in the first thread
    if (j == 0 && i == 0) {
        if (first[j] == '-' || second[i] == '-') {
            newB[0] = '-';
        } else {
            newB[0] = '+';
        }
        return;
    }

    // Perform initial subtraction, using shared memory for efficiency
    extern __shared__ int shared_aux[];
    int diff = size_first - size_second;
    int tmp = 0;
    
    if (j - 1 - diff >= 0 && (second[j - 1 - diff] != '+' && second[j - 1 - diff] != '-')) {
        tmp = first[j - 1] - second[j - 1 - diff];
    } else if (first[j - 1] != '+' && first[j - 1] != '-') {
        tmp = first[j - 1];
    }

    if (tmp < 0) {
        aux[i * size_first + j - 1]--;
        tmp += 10;
    }

    if (i != 0) {
        shared_aux[i * size_first + j] = aux[i * size_first + j] + tmp;
    } else {
        shared_aux[j] = tmp;
    }
    
    __syncthreads();  // Ensure all shared memory updates are complete

    aux[i * size_first + j] = shared_aux[i * size_first + j];  // Update global memory from shared memory
}