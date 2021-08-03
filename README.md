# OptimusPrime API

This project is about utility API for Prime numbers and it is written in Elixir.

By definition, Prime numbers are natural numbers that has two distinct factors, 1 and itself. It is also worth to note that 1 is NOT a prime number.

Optimus Prime API provides the following services:

1. Primality Test - checks whether a given natural number is prime.
2. Prime Factors - computes the prime factors of the given natural number.
3. Prime LTE - computes all primes less than equal the given natural number.

OptimusPrime is deployed into my personal Gigalixir sites. Please check below for each API specification. 

And it is completely free for anyone to use it, so try it out !! 🎉🎉🥳



For each API url below please use the following base url: https://optimusprime.gigalixirapp.com/



### Primality Test API

The primality test API will determine whether an input number `n` is prime. For example `n = 13` is prime and `n = 14` is not a prime.

url: `/api/prime/primality/n`

Http method: `GET`

Response: `{"n": n, "is_prime" : true/false}`



Example:

Request: `/api/prime/primality/13`

Response: `{"n": 13, "is_prime" : true}`



### Prime Factors API

The Fundamental Theorem of Arithmetics states that each natural number `n` has a unique prime factorization, different from any other natural number. For example the prime factor of `n = 27` is `[3, 3, 3]`.

The Prime Factors API will compute such factorization for you.

url: `/api/prime/prime_factor/n`

Http method: `GET`

Response : `{"n": n, "prime_factor": [list_of_factor]}`



Example:

Request : `/api/prime/prime_factor/27`

Response: `{"n": 27, "prime_factor": [3,3,3]}`



### Prime LTE API

Prime LTE (less than equal) API will compute prime numbers that's less or equal than the given natural number `n` with pagination zero-based limit `l` , and offset `o`.
For example if `n = 20`, `limit = 2`, and `offset = 3`, then the result will be `[5, 7, 11]` 

Below table describes each request parameters:

| No   | Parameter | Description                | Remark                 |
| ---- | --------- | -------------------------- | ---------------------- |
| 1    | n         | natural number             | minimum 0              |
| 2    | limit     | start index, zero-based    | minimum 0              |
| 3    | offset    | the amount of prime number | minimum 0, maximum 100 |

url: `/api/prime/prime_lte/n?limit=l&offset=o`

Http method: `GET`

Response : `{"n": n, "limit": l, "offset": o, "prime_lte": [list_of_primes]}`



Example:

Request : `/api/prime/prime_lte/20?limit=2&offset=3`

Response: `{"n": 10, "limit": 2, "offset":3, "prime_lte": [2,3,5,7]}`

