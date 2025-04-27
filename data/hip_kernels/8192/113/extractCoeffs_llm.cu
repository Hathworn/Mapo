#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void extractCoeffs(const float *matrices, float *coeffArray, int savedCoeffs, int dimsize) {
    // Compute global thread ID
    int threadGlobalID = blockIdx.x * blockDim.x * blockDim.y * blockDim.z
                         + threadIdx.z * blockDim.y * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x;

    // Calculate offsets
    int offsetMatrix = threadGlobalID * dimsize * dimsize;
    int offsetCoeff = threadGlobalID * savedCoeffs;
    int coeffsLeft = savedCoeffs;
    int x_n = 1, y_n = 0;
    int x, y, numberinrow, tmp;

    // Initialize first coefficient
    coeffArray[offsetCoeff + (savedCoeffs - coeffsLeft)] = matrices[offsetMatrix];
    coeffsLeft -= 1;

    // Loop through coefficients
    while (coeffsLeft > 0) {
        // Determine number in row
        x = x_n;
        y = y_n;
        numberinrow = (x_n < dimsize - 1) ? x_n + 1 : x_n - (y_n - 1);

        bool isEven = numberinrow % 2 == 0;
        while (numberinrow > 0 && coeffsLeft > 0) {
            // Save coefficient
            coeffArray[offsetCoeff + (savedCoeffs - coeffsLeft)] = matrices[offsetMatrix + x + y * dimsize];
            numberinrow--;
            coeffsLeft--;

            // Swap x and y as needed
            tmp = x;
            x = y;
            y = tmp;
            if (!isEven) {
                x--;
                y++;
            }
        }
        if (!isEven && coeffsLeft > 0) {
            // Handle odd row residual
            coeffArray[offsetCoeff + (savedCoeffs - coeffsLeft)] = matrices[offsetMatrix + x + y * dimsize];
            coeffsLeft--;
        }

        // Increment coordinates
        if (x_n == dimsize - 1) {
            y_n++;
        } else {
            x_n++;
        }
    }
}