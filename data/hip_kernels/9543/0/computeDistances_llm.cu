#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

__global__ void computeDistances(int numInstances, int numAttributes, float* dataset, float* distances)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    if (tid < numInstances * numInstances)
    {
        int row = tid / numInstances;
        int column = tid % numInstances; // Use modulo to find instance2Index for better readability

        float sum = 0;
        int instance1 = row * numAttributes;
        int instance2 = column * numAttributes;

        /* Loop unrolling to reduce loop overhead and allow better optimization */
        // Assuming that numAttributes is a multiple of 4 for simplification, otherwise adjust the loop appropriately
        for (int atIdx = 1; atIdx < numAttributes; atIdx += 4)
        {
            float diff1 = dataset[instance1 + atIdx] - dataset[instance2 + atIdx];
            float diff2 = dataset[instance1 + atIdx + 1] - dataset[instance2 + atIdx + 1];
            float diff3 = dataset[instance1 + atIdx + 2] - dataset[instance2 + atIdx + 2];
            float diff4 = dataset[instance1 + atIdx + 3] - dataset[instance2 + atIdx + 3];
            sum += diff1 * diff1 + diff2 * diff2 + diff3 * diff3 + diff4 * diff4;
        }

        float dist = sqrtf(sum); // Use sqrtf for better performance with float

        distances[row * numInstances + column] = dist;
        distances[column * numInstances + row] = dist; // Symmetric distance assignment
    }
}