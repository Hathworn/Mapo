#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void getSufficientComponentNum(const double* eigenvalues, std::size_t* componentNum, std::size_t eigenRows, double epsilon)
{
    // Use shared memory to accumulate variance
    extern __shared__ double sharedVariance[];
    unsigned int tid = threadIdx.x;
    double localVariance = 0;

    // Each thread calculates a partial sum
    for (std::size_t i = tid; i < eigenRows; i += blockDim.x) {
        localVariance += eigenvalues[i];
    }
    
    // Sum up partial variances using shared memory
    sharedVariance[tid] = localVariance;
    __syncthreads();

    // Reduce partial sums to calculate total variance
    if (tid == 0) {
        double totalVariance = 0;
        for (int i = 0; i < blockDim.x; ++i) {
            totalVariance += sharedVariance[i];
        }
        totalVariance *= eigenRows;

        // Calculate subVariance and explanatoryScore iteratively
        double subVariance = eigenRows * eigenvalues[eigenRows - 1];
        double explanatoryScore = subVariance / totalVariance;
        for (std::size_t compNum = 1; compNum < eigenRows && explanatoryScore <= epsilon; ++compNum) {
            subVariance += eigenRows * eigenvalues[eigenRows - compNum - 1];
            explanatoryScore = subVariance / totalVariance;
            *componentNum = compNum + 1; // Update componentNum
        }
    }
}