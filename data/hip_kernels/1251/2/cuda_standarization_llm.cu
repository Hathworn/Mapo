#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuda_standarization(float *data, int rows, int columns) {
    int total_threads_count = blockDim.x * gridDim.x;
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    for (int i = tid + 1; i < columns; i += total_threads_count) {
        float amo = 0.0f, var = 0.0f;
        
        // Calculate sum and mean
        for (int j = 0; j < rows; ++j) {
            amo += data[j * columns + i];
        }
        float ave = amo / float(rows);

        // Calculate variance
        for (int j = 0; j < rows; ++j) {
            float factor = data[j * columns + i] - ave;
            var += (factor * factor);
        }

        // Check for zero variance
        if (var == 0.0f) {
            for (int j = 0; j < rows; j++) {
                data[j * columns + i] /= 255.0f;
            }
            continue;
        }

        float sd_reciprocal = 1.0f / sqrtf(var);

        // Standardize data
        for (int j = 0; j < rows; j++) {
            data[j * columns + i] = (data[j * columns + i] - ave) * sd_reciprocal;
        }
    }
}