typedef long long int int64_t;

const int mask = ~0;

void sum(int64_t *arr, int64_t narr, int64_t *out) {
  int64_t sum = 0;
  for (int64_t i = 0; i < narr; i++) {
    if (arr[i] % 2 == 0) {
      sum += arr[i];
    }
  }
  *out = sum;
}
