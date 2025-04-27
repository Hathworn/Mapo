#include "hip/hip_runtime.h"
#include "includes.h"

#define iceil(num, den) (num + den - 1) / den
#define ARRAY_SIZE 20
#define NUM_LINES 4

#define dimension 5
#define LXBOUND (-1*dimension)
#define RXBOUND (dimension)
#define LYBOUND (-1*dimension)
#define UYBOUND (dimension)

#define INCREMENT 1

#define column (((RXBOUND - LXBOUND) / INCREMENT) * ((RXBOUND - LXBOUND) / INCREMENT)) / ((RXBOUND + UYBOUND) / INCREMENT)

__constant__ int d_coordarray[ARRAY_SIZE];

__global__ void kernelHough(int size, int* d_binarray) {
    // Calculate unique thread index
    const int thread = 2 * (blockDim.x * blockIdx.x + threadIdx.x);

    // Access slope and intercept from constant memory
    const float slope = -1.0 * d_coordarray[thread];
    const float intercept = d_coordarray[thread + 1];

    // Initialize bin counter
    int counter = 0;

    // Loop through the discretized graph by bins
    for (float x = LXBOUND; x < RXBOUND; x += INCREMENT) {
        const float xMin = x;
        const float xMax = x + INCREMENT;

        for (float y = UYBOUND; y > LYBOUND; y -= INCREMENT) {
            const float yMin = y - INCREMENT;
            const float yMax = y;

            // Calculate potential lower and upper y ranges
            const float lower_range = slope * xMin + intercept;
            const float upper_range = slope * xMax + intercept;

            // Check if the calculated y ranges are within the actual bin range
            if ((lower_range <= yMax && lower_range >= yMin) || (upper_range <= yMax && upper_range >= yMin)) {
                // Update bin count with atomic operation to avoid race conditions
                atomicAdd(&d_binarray[counter], 1);
            }
            counter++;
        }
    }
}