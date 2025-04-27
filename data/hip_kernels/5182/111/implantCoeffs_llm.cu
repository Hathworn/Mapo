#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void implantCoeffs(float* matrices, float *coeffArray, int savedCoeffs, int dimsize) {
    int id = blockIdx.x * blockDim.x * blockDim.y * blockDim.z
           + threadIdx.z * blockDim.y * blockDim.x 
           + threadIdx.y * blockDim.x 
           + threadIdx.x;

    int offsetMatrix = id * dimsize * dimsize;
    int offsetCoeff = id * savedCoeffs;
    int coeffsLeft = savedCoeffs;
    int x = 0, y = 0, y_n = 0, x_n = 1;
    int tmp;

    // Directly set the first element
    matrices[offsetMatrix] = coeffArray[offsetCoeff + (savedCoeffs - coeffsLeft)];
    coeffsLeft--;

    while (coeffsLeft > 0) {
        x = x_n;
        y = y_n;

        int numberinrow = (x_n < dimsize - 1) ? x_n + 1 : x_n - (y_n - 1);

        while (numberinrow > 0 && coeffsLeft > 0) {
            // Efficient placement
            matrices[offsetMatrix + x + y * dimsize] = coeffArray[offsetCoeff + (savedCoeffs - coeffsLeft)];
            numberinrow--;
            coeffsLeft--;

            // Simplified coordinate transformation
            tmp = x;
            x = y;
            y = tmp;

            if ((numberinrow + 1) % 2 == 0) {
                x--;
                y++;
            }
        }

        if (numberinrow % 2 == 1 && coeffsLeft > 0) {
            // Handle extra element for odd row sizes
            matrices[offsetMatrix + x + y * dimsize] = coeffArray[offsetCoeff + (savedCoeffs - coeffsLeft)];
            coeffsLeft--;
        }

        // Update coordinate for the next iteration
        if (x_n == dimsize - 1) {
            y_n++;
        } else {
            x_n++;
        }
    }
}