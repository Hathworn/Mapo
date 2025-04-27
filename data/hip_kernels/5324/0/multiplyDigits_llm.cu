#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void multiplyDigits(char* d_str1, char* d_str2, int* d_matrix, int str1_len, int str2_len) {
    // Simplify indexing calculation by precalculating values
    int row = blockIdx.x * blockDim.y + threadIdx.y;
    int col = blockIdx.y * blockDim.x + threadIdx.x;
    
    // Check bounds before executing multiplication
    if (row < str2_len && col < str1_len) {
        int idx = row * (str1_len * str2_len + str1_len) + col + str2_len + 1;

        // Perform multiplication
        d_matrix[idx] = (d_str2[row] - '0') * (d_str1[col] - '0');
    }
}