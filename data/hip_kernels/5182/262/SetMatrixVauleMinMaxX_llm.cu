#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for setting matrix values with given conditions
__global__ void SetMatrixVauleMinMaxX(float* matrix, int cols, int size, int id_min, int id_max, float value) {
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Calculate column index
    int id_column = id % cols;
    
    // Set value only if within the specified column range and id is valid
    if (id < size && id_column >= id_min && id_column <= id_max) {
        matrix[id] = value;
    }
}