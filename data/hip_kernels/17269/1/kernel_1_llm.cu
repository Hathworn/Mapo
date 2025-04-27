#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_1(int columns, int rows, float* mat1, float* matanswer) {
    int columna = threadIdx.x;  // Thread index represents the column
    float temp_value = 0;
    
    // Unrolling loop for better performance
    int k = 0;
    for (; k + 3 < rows; k += 4) {
        temp_value += mat1[(k * columns) + columna] +
                      mat1[((k + 1) * columns) + columna] +
                      mat1[((k + 2) * columns) + columna] +
                      mat1[((k + 3) * columns) + columna];
    }

    // Handle remaining iterations
    for (; k < rows; k++) {
        temp_value += mat1[(k * columns) + columna];
    }
    
    matanswer[columna] = temp_value;
}