#include "hip/hip_runtime.h"
#include "includes.h"

#define MINVAL 1e-7

__global__ void MaxElement(double* Mtr, int Size, int i, int* strnum)
{
    double MaxValue = Mtr[i * Size + i];
    int localStrnum = i;

    for(int k = i + 1; k < Size; k++) // Start loop from i+1
    {
        double currentVal = fabs(Mtr[i * Size + k]); // Cache value access
        if(currentVal > fabs(MaxValue))
        {
            localStrnum = k; // Use local variable for strnum
            MaxValue = Mtr[i * Size + k];
        }
    }

    *strnum = (fabs(MaxValue) < MINVAL) ? -1 : localStrnum; // Ternary operator for single assignment
}