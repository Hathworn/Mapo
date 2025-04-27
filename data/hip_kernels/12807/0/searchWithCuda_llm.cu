#include "hip/hip_runtime.h"
#include "includes.h"

int answersNumber;
int categoriesNumber;
int atribsNumber;

__global__ void searchWithCuda(double *resultPossibilities, char *query, char *atribsValues, double *possibilities, int *queryPrefix, int *atribsPrefix, int *answersNumber, int *categoriesNumber, int *atribsNumber)
{
    int category_id = blockIdx.x;  // categories
    int atrib_id = blockIdx.y;     // atribs

    // Find the start of the attribute string in query and atribsValues
    char *queryAtrib = query + queryPrefix[category_id];
    int queryAtribLength = queryPrefix[category_id + 1] - queryPrefix[category_id];

    char *currAtrib = atribsValues + atribsPrefix[atrib_id];
    int currAtribLength = atribsPrefix[atrib_id + 1] - atribsPrefix[atrib_id];

    if (queryAtribLength == currAtribLength)
    {
        // Optimize comparison by using a single loop and return immediately if not matched
        bool equal = true;
        for (int i = 0; i < queryAtribLength; ++i)
        {
            if (queryAtrib[i] != currAtrib[i])
            {
                equal = false;
                break;
            }
        }
        if (equal)
        {
            // Optimize the memory access pattern
            int resultIndex = *categoriesNumber * blockDim.y * i + category_id;
            int possibilitiesIndex = *atribsNumber * i + atrib_id;
            for (int i = 0; i < *answersNumber; ++i)
            {
                resultPossibilities[resultIndex] = possibilities[possibilitiesIndex];
            }
        }
    }
}