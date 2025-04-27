#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void applyRule(char* left, char* middle, char* right, char* res) {
    char a = *left;
    char b = *middle;
    char c = *right;

    // Utilize bitwise operations for rule application
    unsigned char idx = (a << 2) | (b << 1) | c;
    unsigned char rule_output[8] = {0, 1, 1, 1, 0, 1, 1, 0};
    *res = rule_output[idx];
}

__global__ void computeCell(char* cellData, unsigned int* width, unsigned int* height) {
    int y = 0;
    int x = 0;

    for (y = 1; y < (*height); ++y) {
        for (x = threadIdx.x; x < (*width); x += blockDim.x) {
            char left = (x > 0) ? cellData[(x - 1) + (y - 1) * (*width)] : 0;
            char middle = cellData[x + (y - 1) * (*width)];
            char right = (x < (*width) - 1) ? cellData[(x + 1) + (y - 1) * (*width)] : 0;

            applyRule(&left, &middle, &right, &cellData[x + y * (*width)]);
        }
        __syncthreads();  // Synchronize threads at the end of each row
    }
}